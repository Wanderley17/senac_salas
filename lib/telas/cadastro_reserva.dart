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
    AppDatabase db = AppDatabase();
    SalasDao salasDao = SalasDao(db);

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
                child: CardInfo(widget: widget),
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
  const CardInfo({super.key, required this.widget});

  final CadastroReservas widget;

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  int? idSala;

  void selecionaIdSala(int id) => setState(() => idSala = id);

  @override
  Widget build(BuildContext context) {
    AppDatabase db = AppDatabase();
    SalasDao salasDao = SalasDao(db);
    final streamSalas = salasDao.buscarSalasDisponiveis(disponibilidade: true);

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
            StreamBuilder(
              stream: streamSalas,
              builder: (context, snapshot) {
                if (snapshot.hasError) {}
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final list = snapshot.data ?? [];

                if (list.isEmpty) {}

                return SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<Sala>(
                      decoration: InputDecoration(
                        hintText: "Selecione a sala",
                        suffixIcon: Icon(Icons.room, color: Colors.indigo),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.indigo,
                            width: 0.5,
                          ),
                        ),
                      ),
                      items: list.map((Sala sala){
                        return DropdownMenuItem<Sala>(value: sala, child: Text(sala.nome));
                      }).toList(),
                      onChanged: (sala) {
                        if(sala != null){
                          selecionaIdSala(sala.id);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
