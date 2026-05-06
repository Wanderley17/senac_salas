import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/tables/tabelas.dart' show Usuarios;

part 'usuarios_dao.g.dart';

@DriftAccessor(tables: [Usuarios])
class UsuariosDao extends DatabaseAccessor<AppDatabase>
    with _$UsuariosDaoMixin {
  UsuariosDao(super.db);

  //Função que verifica se o usuário está logado no sistema
  Stream<Usuario?> streamUsuarioLogado(int id) {
    return (select(
      usuarios,
    )..where((u) => u.idUsuario.equals(id))).watchSingleOrNull();
  }

  //STREAM: Busca o último usuário cadastrado no sistema
  Stream<Usuario?> get buscarUltimoUsuario =>
      (select(usuarios)
            ..where((u) => u.logado.equals(true))
            ..limit(1))
          .watchSingleOrNull();

  //FUTURE: Carrega o último usuário cadastrado no sitstema
  Future<Usuario?> get carregarUltimoUsuario =>
      (select(usuarios)
            ..where((u) => u.logado.equals(true))
            ..limit(1))
          .getSingleOrNull();


  //Função para realizar o cadastro de usuários
  Future<int> cadastrar(UsuariosCompanion usuario) =>
      into(usuarios).insert(usuario);

  //Função para realizar o login de usuário
  Future<Usuario?> login({required String login, required String senha}) async {
    log('Iniciando operação de login');

    return transaction(() async {
    log('Iniciando operação de transação');

      final query = select(usuarios)..where((u) => u.email.equals(login) & u.senha.equals(senha));
      Usuario? usuarioEncontrado = await query.getSingleOrNull();
      log('Usuario encontrado: $usuarioEncontrado');

      if(usuarioEncontrado != null){
          final atualizaStatus = UsuariosCompanion(logado: Value(true));
          log('atualizaStatus: $atualizaStatus');

          await (update(usuarios)..where((u) => u.idUsuario.equals(usuarioEncontrado.idUsuario))).write(atualizaStatus);
          log('Atualização concluída');

          return await (select(usuarios)..where((u) => u.idUsuario.equals(usuarioEncontrado.idUsuario))).getSingle();
        }
      log('retorno nulo.');
      return null;
      }
    );
  }

  //Função para atualizar o usuário
  Future<bool> atualizar(UsuariosCompanion usuario) =>
      update(usuarios).replace(usuario);

  Future<bool> fazerLogout(Usuario usuario) async {
    final entidade = UsuariosCompanion(
      idUsuario: Value(usuario.idUsuario), //?
      nome: Value(usuario.nome),
      funcao: Value(usuario.funcao),
      senha: Value(usuario.senha),
      logado: Value(false),
    );

    bool result = await (update(usuarios)).replace(entidade); //?

    return result;
  }

  Future<String?> buscarDicaSenha(String email)async{
    final result = await (
      select(usuarios)
      ..where((u) => u.email.equals(email))
    ).getSingleOrNull();

    return result?.dicaSenha;
  }
}
