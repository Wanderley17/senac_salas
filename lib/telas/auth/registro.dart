// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/usuarios_dao.dart';
import 'package:senac_salas/utils/validate_tools.dart';

class Registro extends StatefulWidget {
  const Registro({super.key}); //Construtor de classe

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  //Controladores
  final TextEditingController _matriculaCtrl = TextEditingController();
  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _funcaoCtrl = TextEditingController();
  final TextEditingController _celularCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _senhaCtrl = TextEditingController();
  final TextEditingController _senhaConfirmarCtrl = TextEditingController();

  bool estaVisivel = false;
  bool estaCadastrando = false; //Variavel responsável pelo progresso

  //Função que altera o valor da variável estaVisivel (ela recebe a negação (!) dela mesma)
  void defineVisibilidade() => setState(() => estaVisivel = !estaVisivel);

  //Função que altera o valor da variavel estaCadastrando
  void mudaStatusCadastro(bool value) =>
      setState(() => estaCadastrando = value);

  //Função de criptografia de senhas de usuário
  String _criptografarSenha(String senha) {
    final bytes = utf8.encode(senha);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  //Função que efetua o cadastro do usuário no banco de dados
  void fazerCadastro() async {
    AppDatabase db = AppDatabase(); //Cria uma instancia de banco de dados
    UsuariosDao usuariosDao = UsuariosDao(
      db,
    ); //Cria uma instancia de UsuariosDao

    ValidateTools validate = ValidateTools();

    bool camposPreenchidos = validate.validarTextFields(
      [
        _senhaCtrl,
        _matriculaCtrl,
        _funcaoCtrl,
        _celularCtrl,
        _emailCtrl,
        _senhaConfirmarCtrl,
        _nomeCtrl,
      ],
      senhasControllers: [_senhaCtrl, _senhaConfirmarCtrl],
    );

    //Verifica o login e senha inseridos
    log(
      '${_senhaCtrl.text} | ${_matriculaCtrl.text} | ${_funcaoCtrl.text} | ${_celularCtrl.text} | ${_nomeCtrl.text} | ${_emailCtrl.text} | ${_senhaConfirmarCtrl.text}',
    );

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

    String matricula = _matriculaCtrl.text.trim();
    String nome = _nomeCtrl.text.trim();
    String funcao = _funcaoCtrl.text.trim();
    String celular = _celularCtrl.text.trim();
    String email = _emailCtrl.text.trim();
    String senha = _criptografarSenha(_senhaCtrl.text.trim());
    String senhaConfirmar = _criptografarSenha(_senhaConfirmarCtrl.text.trim());

    //Verificação se as senhas são diferentes
    if (senha != senhaConfirmar) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Senhas não conferem',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return; //Encerra a execução do If e retorna para o bloco principal
    }

    //Cria o objeto Usuario que irá para o banco de dados
    UsuariosCompanion usuario = UsuariosCompanion(
      matricula: d.Value(matricula),
      nome: d.Value(nome),
      funcao: d.Value(funcao),
      celular: d.Value(celular),
      email: d.Value(email),
      senha: d.Value(senha),
    );

    mudaStatusCadastro(true);

    try {
      int result = await usuariosDao.cadastrar(usuario);

      if (result > 0 && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Cadastrado com sucesso',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
      mudaStatusCadastro(false);
    } catch (e) {
      log('Erro ao exexutar cadastro $e');

      mudaStatusCadastro(false);
    }
  }

  @override
  void dispose() {
    //Controladores
    _matriculaCtrl.dispose();
    _nomeCtrl.dispose();
    _funcaoCtrl.dispose();
    _celularCtrl.dispose();
    _emailCtrl.dispose();
    _senhaCtrl.dispose();
    _senhaConfirmarCtrl.dispose();

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
                  'Criar conta',
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
                  controller: _matriculaCtrl,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.fingerprint, color: Colors.indigo),
                    labelText: 'Digite sua matricula',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextField(
                  controller: _nomeCtrl,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.person, color: Colors.indigo),
                    labelText: 'Digite seu nome',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextField(
                  controller: _funcaoCtrl,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.work, color: Colors.indigo),
                    labelText: 'Digite função',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextField(
                  controller: _celularCtrl,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.phone, color: Colors.indigo),
                    labelText: 'Digite seu celular',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
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
                        color: Colors.indigo,
                      ),
                      onPressed:
                          defineVisibilidade, //Chama a função de alterar a visibilidade
                    ),
                    labelText: 'Digite sua senha',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                TextField(
                  controller: _senhaConfirmarCtrl,
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
                        color: Colors.indigo,
                      ),
                      onPressed:
                          defineVisibilidade, //Chama a função de alterar a visibilidade
                    ),
                    labelText: 'confirme sua senha',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                    icon: (estaCadastrando)
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.check, color: Colors.white),
                    onPressed: fazerCadastro,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    label: Text(
                      "Registro",
                      style: TextStyle(color: Colors.white),
                    ),
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
