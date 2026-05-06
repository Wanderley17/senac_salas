import 'dart:developer';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/usuarios_dao.dart';
import 'package:senac_salas/telas/auth/auth_wrapper.dart';
import 'package:senac_salas/telas/tela_sobre.dart';

class TelaSettings extends StatefulWidget {
  const TelaSettings({super.key});

  @override
  State<TelaSettings> createState() => _TelaSettingsState();
}

class _TelaSettingsState extends State<TelaSettings> {
  final AppDatabase db = AppDatabase();
  late UsuariosDao usuarioDao = UsuariosDao(db);
  Usuario? user;

  void carregarUsuario() async {
    user = await usuarioDao.carregarUltimoUsuario;
    if (user == null) return;
  }

  void dialogoAlterarSenha(BuildContext context) async {
    user = await usuarioDao.carregarUltimoUsuario;

    if (user == null) return;

    showDialog(
      context: context,
      builder: (context) {
        final senhaCtrl = TextEditingController();
        final senhaRepetirCtrl = TextEditingController();

        ValueNotifier<bool> isValidoNotifier = ValueNotifier<bool>(false);
        ValueNotifier<bool> isVisivelNotifier = ValueNotifier<bool>(false);
        ValueNotifier<String?> erroNotifier = ValueNotifier<String?>(null);

        void validar() {
          final senha1 = senhaCtrl.text;
          final senhaR = senhaRepetirCtrl.text;

          if (senha1.isEmpty) {
            erroNotifier.value = null;
            isValidoNotifier.value = false;
          } else if (senha1 != senhaR) {
            erroNotifier.value = "Senhas não conferem";
            isValidoNotifier.value = false;
          } else {
            erroNotifier.value = null;
            isValidoNotifier.value = true;
          }
        }

        void exibir() => isVisivelNotifier.value = !isVisivelNotifier.value;

        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween, //?
          backgroundColor: Colors.white,
          title: Text('Alterar Senha'),
          content: ValueListenableBuilder(
            valueListenable: isVisivelNotifier,
            builder: (context, visivel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  TextField(
                    controller: senhaCtrl,
                    obscureText: !visivel,
                    decoration: InputDecoration(
                      labelText: 'Nova Senha',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: exibir,
                        icon: Icon(
                          (!visivel) ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 0.5,
                        ),
                      ),
                    ),
                    onChanged: (_) => validar(),
                  ),
                  ValueListenableBuilder(
                    valueListenable: erroNotifier,
                    builder: (context, erro, child) {
                      return TextField(
                        controller: senhaRepetirCtrl, //?
                        obscureText: !visivel,
                        decoration: InputDecoration(
                          labelText: 'Confirmar senha', //?
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: exibir,
                            icon: Icon(
                              (!visivel)
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.indigo,
                              width: 0.5,
                            ),
                          ),
                          errorText: erro, //?
                        ),
                        onChanged: (_) => validar(),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar', style: TextStyle(color: Colors.black)),
            ),
            ValueListenableBuilder(
              valueListenable: isValidoNotifier,
              builder: (context, isValido, child) {
                return Visibility(
                  visible: isValido,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      if (user == null) {
                        return;
                      }

                      UsuariosCompanion usuario = UsuariosCompanion(
                        celular: drift.Value(user?.celular),
                        email: drift.Value(user?.email),
                        funcao: drift.Value(user!.funcao),
                        idUsuario: drift.Value(user!.idUsuario),
                        logado: drift.Value(user!.logado),
                        matricula: drift.Value(user!.matricula),
                        nome: drift.Value(user!.nome),
                        senha: drift.Value(senhaCtrl.text),
                      );

                      final result = await usuarioDao.atualizar(usuario);

                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Senha atualizada com sucesso',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Falha na atualização da senha',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Confirmar'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback(
      (_) => carregarUsuario(),
    );
    super.initState();
  }

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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaSobre()),
                      );
                    },
                    title: Text(
                      'Sobre',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Informações dos desenvolvedores',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Icon(Icons.info_outline, color: Colors.indigo),
                  ),
                  //Adicionar aqui um ListTile para atualização de senha(5 minutos)
                  ListTile(
                    onTap: () => dialogoAlterarSenha(context),
                    title: Text(
                      'Mudar a senha',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Altera as configurações de senha do usuário',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Icon(Icons.password, color: Colors.black54),
                  ),
                  ListTile(
                    onTap: () async {
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
                    title: Text(
                      'Fazer Log Out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      'Encerra a sessão e sai da conta',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Icon(Icons.logout, color: Colors.red),
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
