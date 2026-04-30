import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/usuarios_dao.dart';
import 'package:senac_salas/telas/auth/auth_wrapper.dart';

class TelaSettings extends StatefulWidget {
  const TelaSettings({super.key});

  @override
  State<TelaSettings> createState() => _TelaSettingsState();
}

class _TelaSettingsState extends State<TelaSettings> {
  final AppDatabase db = AppDatabase();
  late UsuariosDao usuarioDao = UsuariosDao(db);

  @override
  Widget build(BuildContext context) {
    final usuarioStream = usuarioDao.buscarUltimoUsuario;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Configurações')),
        body: StreamBuilder(
          stream: usuarioStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              log('Erro encontrado na tela Settings: ${snapshot.error}');
            } //Verifica se houve erro

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } //Verifica se está em carregamento de dados

            Usuario? usuario = snapshot.data; //Captura o resultado do future

            if (usuario == null) {
              log('Usuário nulo');
              return Center(child: Text('Usuário Nulo'));
            } //Verifica se o resultado do future é nulo

            log('Usuário logado ${usuario.nome}');

            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Sobre'),
                    subtitle: Text('Informações dos desenvolvedores'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.info_outline, color: Colors.indigo),
                    ),
                  ),
                  ListTile(
                    title: Text('Fazer Log Out'),
                    subtitle: Text('Encerra a sessão e sai da conta'),
                    trailing: IconButton(
                      onPressed: () async {
                        try {
                          final result = await usuarioDao.fazerLogout(usuario);

                          if (result) {
                            if (mounted) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthWrapper(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }
                            return;
                          }
                        } catch (e) {
                          log('Erro no logout: $e');
                        }
                      },
                      icon: Icon(Icons.logout, color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
