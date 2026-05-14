import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/usuarios_dao.dart';
import 'package:senac_salas/telas/home.dart';
import 'package:senac_salas/utils/validate_tools.dart';

class Login extends StatefulWidget {
  final ValueNotifier<int> notifier;
  const Login({super.key, required this.notifier});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AppDatabase db = AppDatabase();
  late UsuariosDao usuariosDao = UsuariosDao(db);
  ValidateTools validate = ValidateTools();
  final TextEditingController _loginCtrl = TextEditingController();
  final TextEditingController _senhaCtrl = TextEditingController();

  bool estaVisivel = false;
  bool estaLogando = false;

  //Função que altera o valor da variável estaVisivel (ela recebe a negação (!) dela mesma)
  void defineVisibilidade() => setState(() => estaVisivel = !estaVisivel);

  //Função que muda o estado da variável logando
  void mudaEstadoLogando(bool value) => setState(() => estaLogando = value);

  //Função de criptografia de senhas de usuário
  String _criptografarSenha(String senha) {
    final bytes = utf8.encode(senha);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  void fazerLogin() async {
    bool camposPreenchidos = validate.validarTextFields([
      _loginCtrl,
      _senhaCtrl,
    ]);

    if (!camposPreenchidos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber,
          content: Text(
            'Preencha todos os campos',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

      return;
    }

    String login = _loginCtrl.text.trim();
    String senha = _criptografarSenha(_senhaCtrl.text.trim());

    try {
      Usuario? user = await usuariosDao.login(login: login, senha: senha);
      if (user != null && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'E-mail ou Senhas Incorretas',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      }
    } catch (e) {
      log('Erro no login $e');
    }
  }

  void recuperarSenha() async {
    if (_loginCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Preencha o campo de e-mail',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    if (!_loginCtrl.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Digite um e-mail válido',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    final result = await usuariosDao.buscarDicaSenha(_loginCtrl.text.trim());

    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Dica de senha não encontrada',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'dica de senha: $result',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //Controladores
    _loginCtrl.dispose();
    _senhaCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Entrar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  'Gerenciador de salas',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _loginCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.mail, color: Colors.indigo),
                    labelText: 'Digite seu e-mail',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextField(
                  controller: _senhaCtrl,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: estaVisivel,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        (estaVisivel) ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed:
                          defineVisibilidade, //Chama a função de alterar a visibilidade
                    ),
                    labelText: 'Digite sua senha',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: fazerLogin,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                ),
                TextButton(
                  onPressed: recuperarSenha,
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
