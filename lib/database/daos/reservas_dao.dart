import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/tables/tabelas.dart'
    show Reservas, Salas, Cursos;

part 'reservas_dao.g.dart';

@DriftAccessor(tables: [Reservas, Salas, Cursos])
class ReservasDao extends DatabaseAccessor<AppDatabase>
    with _$ReservasDaoMixin {
  ReservasDao(super.db);

  Future<void> reativarSalasAutomatico() async {
    final agora = DateTime.now(); //Captura o dia e horário atuais

    final query = selectOnly(cursos); //Seleciona apenas essa tabela
    query.addColumns([cursos.id]); //Adiciona quais colunas retornarão com a Query
    query.where(cursos.dataFim.isSmallerOrEqualValue(agora)); //Aplica o filtro de data

    List<int?> list = await query.map((row) => row.read(cursos.id)!).get();

    log('Lista de ids dos cursos que encerram hoje: ${list.hashCode}');
  }

  Stream<List<ReservasModel>> streamOfReservas() {
    final query = select(reservas).join([
      innerJoin(
        salas,
        salas.id.equalsExp(reservas.idSala),
      ), //procura na tabela sala a sala com o id
      innerJoin(
        cursos,
        cursos.id.equalsExp(reservas.idCurso),
      ), //procura na tabela curso o curso com o id
    ]);

    return query.watch().map((rows) {
      //Explora as linhas(rows) retornadas
      return rows.map((row) {
        return ReservasModel(
          row.readTable(salas), //Adiciona a sala extraída da linha retornada
          row.readTable(cursos), //Adiciona o curso extraído da linha retornada
          reserva: row.readTable(
            reservas,
          ), //(Opcional): usamos para capturar a reserva
        );
      }).toList(); //Transforma tudo isso em uma lista
    });
  }

  Future<int> fazerReserva(ReservasCompanion reserva, int idSala) async {
    int result = await into(reservas).insert(reserva);
    int resposta = 0;

    if (result > 0) {
      int resultSala = await (update(salas)..where((s) => s.id.equals(idSala)))
          .write(SalasCompanion(disponivel: Value(false)));

      if (resultSala > 0) resposta = 1;
    }

    return resposta;
  }

  Future<int> removerReserva({required int id, required int idSala}) async {
    int result = await (delete(reservas)..where((r) => r.idReserva.equals(id))).go();

    int resposta = 0;

    if (result > 0) {
      int resultSala = await (
        update(salas)..where((s) => s.id.equals(idSala))
        ).write(SalasCompanion(disponivel: Value(true)));

      if (resultSala > 0) resposta = 1;
    }

    return resposta;
  }
}

//Classe que vai armazenar as salas e os cursos
class ReservasModel {
  final Reserva? reserva; //Opcional para cada reserva
  final Sala sala;
  final Curso curso;

  ReservasModel(this.sala, this.curso, {this.reserva}); //Construtor da classe
}
