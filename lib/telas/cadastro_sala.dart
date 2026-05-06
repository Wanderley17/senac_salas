import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/salas_dao.dart';
import 'package:senac_salas/utils/validate_tools.dart';

class CadastroSala extends StatefulWidget {
  const CadastroSala({super.key});

  @override
  State<CadastroSala> createState() => _CadastroSalaState();
}

class _CadastroSalaState extends State<CadastroSala> {
  final _nomeCtrl = TextEditingController();
  final _numeroCtrl = TextEditingController();
  final _recursosCtrl = TextEditingController();
  final _capacidadeCtrl = TextEditingController();

  String localSala = 'Térreo';
  bool estaCadastrando = false;
  int capacidadeSala = 0;

  void definirStatusCadastro(bool value) =>
      setState(() => estaCadastrando = value);

  void definirLocalizacao(String? local) => setState(() => localSala = local!);

  void cadastrarSala() async {
    AppDatabase db = AppDatabase();
    SalasDao salasDao = SalasDao(db);

    ValidateTools validate = ValidateTools();

    bool camposPreenchidos = validate.validarTextFields(
      [_nomeCtrl, _recursosCtrl],

      numberControllers: [_capacidadeCtrl, _numeroCtrl],
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

    SalasCompanion sala = SalasCompanion.insert(
      nome: _nomeCtrl.text,
      numero: _numeroCtrl.text,
      recursos: _recursosCtrl.text,
      localizacao: localSala,
      capacidade: capacidadeSala,
    );

    definirStatusCadastro(true);

    try {
      int result = await salasDao.cadastrarNovaSala(sala);

      if (result > 0) {
        log('Sala cadastrada com sucesso.');
        definirStatusCadastro(false); //?
        limparCampos();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Sala cadastrada com sucesso."),
              backgroundColor: Colors.green,
              showCloseIcon: true,
            ),
          );
        }
      } else {
        definirStatusCadastro(false);
        log('Sala não cadastrada.');

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Sala não cadastrada."),
              backgroundColor: Colors.red,
              showCloseIcon: true,
            ),
          );
        }
      }
    } catch (e) {
      log('Erro: $e');
      definirStatusCadastro(false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao cadastrar a sala."),
            backgroundColor: Colors.redAccent,
            showCloseIcon: true,
          ),
        );
      }
    }
  }

  void limparCampos() {
    _nomeCtrl.clear();
    _numeroCtrl.clear();
    _recursosCtrl.clear();
    _capacidadeCtrl.clear();
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _numeroCtrl.dispose();
    _recursosCtrl.dispose();
    _capacidadeCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(), title: Text('Cadastrar Sala')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            TextField(
              controller: _nomeCtrl,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.meeting_room, color: Colors.indigo),
                labelText: 'Nome da sala',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            TextField(
              controller: _numeroCtrl,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.numbers, color: Colors.indigo),
                labelText: 'Numero da sala',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            TextField(
              controller: _recursosCtrl,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.tv, color: Colors.indigo),
                labelText: 'Recursos didáticos da sala',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Selecione o local",
                    suffixIcon: Icon(Icons.room, color: Colors.indigo),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 0.5),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: 'Terreo', child: Text("Térreo")),
                    DropdownMenuItem(value: '1º Piso', child: Text('1º Piso')),
                    DropdownMenuItem(value: '2º Piso', child: Text('2º Piso')),
                    DropdownMenuItem(value: 'Anexo', child: Text('Anexo')),
                  ],
                  onChanged: definirLocalizacao,
                ),
              ),
            ),
            TextField(
              controller: _capacidadeCtrl,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(3), //Permite apenas dígitos
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.group, color: Colors.indigo),
                labelText: 'Capacidade da sala',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              keyboardType: TextInputType.number, //Usa o teclado númerico
              onChanged: (value) {
                int? valor = int.tryParse(value);

                if (valor != null) capacidadeSala = valor;

                log('valor digitado = $capacidadeSala');
              },
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: cadastrarSala, //?
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.indigo),
                ),
                child: Text(
                  "Cadastrar nova sala",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
