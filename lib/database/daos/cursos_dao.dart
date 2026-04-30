import 'package:drift/drift.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/tables/tabelas.dart' show Cursos;

part 'cursos_dao.g.dart';

@DriftAccessor(tables: [Cursos])
class CursosDao extends DatabaseAccessor<AppDatabase> with _$CursosDaoMixin {
  CursosDao(super.db);

  Stream<List<Curso>> streamOfCursos() => select(cursos).watch();

  Future<List<Curso>> get todosOsCursos => select(cursos).get();

  //Função que busca os cursos a partir do nome
  Future<List<Curso>> buscarCursosPeloNome({required String nome}) async {
    return await (select(cursos)..where((c) => c.nomeCurso.equals(nome))).get();
  }

  //Função que cadastra um novo curso
  Future<int> cadastrarNovoCurso(CursosCompanion curso) async {
    return await into(cursos).insert(curso);
  }

  //Função para atualizar o curso
  Future<int> atualizarCurso({ required int id, required CursosCompanion curso,
  }) async {
    return await (update(cursos)..where((c) => c.id.equals(id))).write(curso);
  }

  //Função para remover o curso
  Future<int> removerCurso({required int id}) async {
    return await (delete(cursos)..where((c) => c.id.equals(id))).go();
  }
}
