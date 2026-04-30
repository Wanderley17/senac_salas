import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/cursos_dao.dart';
import 'package:senac_salas/utils/validate_tools.dart';

class CadastroCurso extends StatefulWidget {
  const CadastroCurso({super.key});

  @override
  State<CadastroCurso> createState() => _CadastroCursoState();
}

class _CadastroCursoState extends State<CadastroCurso> {
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>(); //?

  final _nomeCursoCtrl = TextEditingController();
  final _professorCtrl = TextEditingController();
  DateTime? _dataInicio;
  DateTime? _dataFim;
  String _turno = "Matutino";
  bool estaCadastrando = false; //?

  void alteraStatus(bool value) => setState(() => estaCadastrando = value); //?

  void selecionarDataInicio() async {
    final DateTime? dataEscolhida = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );

    if (dataEscolhida != null) {
      setState(() => _dataInicio = dataEscolhida);
    }
  }

  void selecionarDataFim() async {
    final DateTime? dataEscolhida = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );

    if (dataEscolhida != null) {
      setState(() => _dataFim = dataEscolhida);
    }
  }

  void selecionarTurno(String? value) => setState(() => _turno = value!);

  void cadastrarCurso() async {
    AppDatabase db = AppDatabase();
    CursosDao cursosDao = CursosDao(db);
    ValidateTools validate = ValidateTools();

    bool camposPreenchidos = validate.validarTextFields([
      _professorCtrl, _nomeCursoCtrl
    ]);

    if(!camposPreenchidos){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber,
          content: Text(
            'Preencha todos os campos', 
            style: TextStyle(color: Colors.black
            ),
          ),
        )
      );
      
      return;
    }

    alteraStatus(true);

    try {
      var curso = CursosCompanion.insert(
        dataFim: _dataFim!,
        dataInicio: _dataInicio!,
        nomeCurso: _nomeCursoCtrl.text.trim(),
        professor: _professorCtrl.text.trim(),
        turno: _turno,
      );

      int result = await cursosDao.cadastrarNovoCurso(curso);

      if (result > 0) {
        log("Curso cadastrado com sucesso");
        alteraStatus(false);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Curso cadastrado com sucesso"),
              backgroundColor: Colors.green,
              showCloseIcon: true,
            ),
          );
        }
      } else {
        log("Cadastro falhou!");
        alteraStatus(false);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Cadastro falho."),
              backgroundColor: Colors.red,
              showCloseIcon: true,
            ),
          );
        }
      }
    } catch (e) {
      log("Erro no cadastro de curso! $e");
      alteraStatus(false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Erro no cadastro de curso."),
            backgroundColor: Colors.redAccent,
            showCloseIcon: true,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nomeCursoCtrl.dispose();
    _professorCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text('Cadastrar curso')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              TextField(
                controller: _nomeCursoCtrl,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.book, color: Colors.indigo),
                  labelText: 'Nome do curso',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              TextField(
                controller: _professorCtrl,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.school, color: Colors.indigo),
                  labelText: 'Nome do professor',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: "Selecione o turno",
                      suffixIcon: Icon(Icons.sunny, color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 0.5,
                        ),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Matutino',
                        child: Text("Matutino"),
                      ),
                      DropdownMenuItem(
                        value: 'Vespertino',
                        child: Text('Vespertino'),
                      ),
                      DropdownMenuItem(
                        value: 'Noturno',
                        child: Text('Noturno'),
                      ),
                    ],
                    onChanged: selecionarTurno,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextButton.icon(
                  onPressed: selecionarDataInicio,
                  icon: Icon(Icons.calendar_today),
                  label: Text(
                    (_dataInicio != null)
                        ? "$_dataInicio"
                        : "Selecione data de início",
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black45, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextButton.icon(
                  onPressed: selecionarDataFim,
                  icon: Icon(Icons.calendar_month),
                  label: Text(
                    (_dataFim != null) ? "$_dataFim" : "Selecione data de fim",
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black45, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  //? mudar para .icon
                  onPressed: cadastrarCurso, //? Adiciona função
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.indigo),
                  ),
                  label: Text(
                    //? ALterar child para label
                    "Cadastrar novo curso",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: (estaCadastrando)
                      ? SizedBox.square(
                          dimension: 10,
                          child: CircularProgressIndicator(),
                        )
                      : Icon(Icons.check),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
