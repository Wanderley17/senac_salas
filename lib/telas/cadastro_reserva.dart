import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:senac_salas/custom/custom_label.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/reservas_dao.dart';
import 'package:senac_salas/database/daos/salas_dao.dart';

class CadastroReservas extends StatefulWidget {
  final Curso curso;
  const CadastroReservas({super.key, required this.curso});

  @override
  State<CadastroReservas> createState() => _CadastroReservasState();
}

class _CadastroReservasState extends State<CadastroReservas> {
  List<Sala> listOfSalasDisponiveis = [];
  bool estaReservando = false;
  int? selectedIndex;
  Sala? selectedSala;

  void selecionarSala(Sala sala) => setState(() => selectedSala = sala);

  void selecionarIndex(int index) => setState(() => selectedIndex = index);

  void mudaStatusReserva(bool value) => setState(() => estaReservando = value);

  void cadastrarReserva({required int idSala}) async {
    AppDatabase db = AppDatabase();
    ReservasDao reservasDao = ReservasDao(db);

    ReservasCompanion reserva = ReservasCompanion.insert(
      idCurso: widget.curso.id,
      idSala: idSala,
    );

    mudaStatusReserva(true);

    try {
      int result = await reservasDao.fazerReserva(reserva, idSala);

      if (result > 0) {
        log("Reserva de sala efetuada com sucesso"); //?
        mudaStatusReserva(false);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Reserva de sala efetuada com sucesso"),
              backgroundColor: Colors.green,
              showCloseIcon: true,
            ),
          );
        }
        if (mounted) Navigator.pop(context); //?
      } else {
        log("Reserva de sala não efetuada");
        mudaStatusReserva(false);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Reserva de sala não efetuada"),
              backgroundColor: Colors.red,
              showCloseIcon: true,
            ),
          );
        }
      }
    } catch (e) {
      log("Erro ao efetuar reserva de sala. $e");
      mudaStatusReserva(false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erro ao efetuar reserva de sala"),
            backgroundColor: Colors.redAccent,
            showCloseIcon: true,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Cadastrar Reserva")),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CardInfo(
                  widget: widget,
                  salaSelecionada: (sala) {
                    if (sala != null) {
                      selecionarSala(sala);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Cor de fundo
                foregroundColor: Colors.white, // Cor do texto e ícone
              ),
              onPressed: () {
                if (selectedSala != null) {
                  cadastrarReserva(idSala: selectedSala!.id);
                } else {
                  log("Selecionar sala primeiro");
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Selecione a sala primeiro"),
                        backgroundColor: Colors.amber,
                        showCloseIcon: true,
                      ),
                    );
                  }
                }
              },
              child: Text("Fazer Reserva da Sala"),
            ),
          ),
        ),
      ),
    );
  }
}

class CardInfo extends StatefulWidget {
  final Function(Sala? sala) salaSelecionada;

  const CardInfo({
    super.key,
    required this.widget,
    required this.salaSelecionada,
  });

  final CadastroReservas widget;

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  int? idSala;
  Sala? selectedSala;
  List<Sala> listOfSalas = [];

  void selecionaIdSala(int id) => setState(() => idSala = id);

  void selecionaSala(Sala? sala) => setState(() {
    selectedSala = sala;
    widget.salaSelecionada(selectedSala);
  });

  void carregaTodasSalas() async {
    AppDatabase db = AppDatabase();
    SalasDao salasDao = SalasDao(db);
    List<Sala> list = await salasDao.buscarSalasDisponiveis(
      disponibilidade: true,
    );
    setState(() => listOfSalas = list);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => carregaTodasSalas());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.5,
      margin: EdgeInsets.all(10),
      borderOnForeground: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            CustomLabel(
              title: widget.widget.curso.nomeCurso,
              label: "Nome do curso",
            ),
            CustomLabel(
              title: widget.widget.curso.professor,
              label: "Professor do curso",
            ),

            CustomLabel(
              title: widget.widget.curso.turno,
              label: "Turno  do curso",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: (listOfSalas.isNotEmpty)
                  ? DropdownButtonHideUnderline(
                      child: DropdownButton<Sala>(
                        dropdownColor: Colors.white,
                        value: selectedSala,
                        items: listOfSalas.map((Sala sala) {
                          return DropdownMenuItem<Sala>(
                            value: sala,
                            child: Text(sala.nome),
                          );
                        }).toList(),

                        onChanged: selecionaSala,
                      ),
                    )
                  : ListTile(
                      title: Text(
                        'Nenhuma sala disponível',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Cadastre uma nova sala ou altere a disponibilidade de uma',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
