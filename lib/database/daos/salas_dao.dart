import 'package:drift/drift.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/tables/tabelas.dart' show Salas;

part 'salas_dao.g.dart';

@DriftAccessor(tables: [Salas])
class SalasDao extends DatabaseAccessor<AppDatabase> with _$SalasDaoMixin {
  SalasDao(super.db);

  Stream<List<Sala>> streamOfSalas() => select(salas).watch();

  //Função que busca as salas a partir do local
  Future<List<Sala>> buscarSalasPorLocal({required String local}) async {
    return await (select(
      salas,
    )..where((s) => s.localizacao.equals(local))).get();
  }

  //Função que busca as salas a partir da disponibilidade
  Stream<List<Sala>> buscarSalasDisponiveis({required bool disponibilidade}) {
    return (select(salas)..where((s) => s.disponivel.equals(disponibilidade))).watch();
  }

  //Função que cadastra as salas de aula
  Future<int> cadastrarNovaSala(SalasCompanion sala) async {
    return await into(salas).insert(sala);
  }

  //Função para atualizar a sala de aula
  Future<int> atualizarSala({
    required int id,
    required SalasCompanion sala,
  }) async {
    return await (update(salas)..where((s) => s.id.equals(id))).write(sala);
  }

  //Função para remover a sala de aula
  Future<int> removerSala({required int id}) async {
    return await (delete(salas)..where((s) => s.id.equals(id))).go();
  }
}
