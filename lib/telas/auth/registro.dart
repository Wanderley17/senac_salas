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
    final ValueNotifier<int> notifier;
  const Registro({super.key, required this.notifier}); //Construtor de classe

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>(); //?
  final tools = ValidateTools();
  //Controladores
  final TextEditingController _matriculaCtrl = TextEditingController();
  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _funcaoCtrl = TextEditingController();
  final TextEditingController _celularCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _dicaSenhaCtrl = TextEditingController();
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
        _dicaSenhaCtrl, //?
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
    String dica = _dicaSenhaCtrl.text.trim();
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
      dicaSenha: d.Value(dica) //?
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
        widget.notifier.value = 0;
      }
      mudaStatusCadastro(false);
    } catch (e) {
      log('Erro ao executar cadastro $e');
      if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Número de Telefone ou Email já registrado',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      }

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
    _dicaSenhaCtrl.dispose();
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
            child: Form(
              key: _formKey,
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
                  TextFormField(
                    controller: _matriculaCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adicione um número de matrícula corretamente";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.fingerprint, color: Colors.indigo),
                      labelText: 'Digite sua matricula',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _nomeCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adicione um nome corretamente";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.person, color: Colors.indigo),
                      labelText: 'Digite seu nome',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _funcaoCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adicione sua função";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.work, color: Colors.indigo),
                      labelText: 'Digite função',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _celularCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 9) {
                        return "Adicione um número de celular corretamente";
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.phone, color: Colors.indigo),
                      labelText: 'Digite seu celular',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _emailCtrl,
                    validator: tools.validarEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.mail, color: Colors.indigo),
                      labelText: 'Digite seu e-mail',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _senhaCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adicione sua senha";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: estaVisivel,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          (estaVisivel)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.indigo,
                        ),
                        onPressed:
                            defineVisibilidade, //Chama a função de alterar a visibilidade
                      ),
                      labelText: 'Digite sua senha',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _senhaConfirmarCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adicione sua senha";
                      }
                      if (_senhaCtrl.text != value) {
                        return 'Senhas não conferem';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: estaVisivel,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          (estaVisivel)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.indigo,
                        ),
                        onPressed:
                            defineVisibilidade, //Chama a função de alterar a visibilidade
                      ),
                      labelText: 'confirme sua senha',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  TextFormField(
                    controller: _dicaSenhaCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adicione uma dica de senha";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.lightbulb_outline_rounded, color: Colors.indigo),
                      labelText: 'Digite uma dica de senha',
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
                        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          fazerCadastro();
                        }
                      },
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
      ),
    );
  }
}
