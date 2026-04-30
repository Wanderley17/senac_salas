import 'package:flutter/material.dart';
import 'package:senac_salas/custom/custom_card.dart';
import 'package:senac_salas/custom/custom_ticket.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/reservas_dao.dart';
import 'package:senac_salas/utils/format_tools.dart';

class TelaReservas extends StatefulWidget {
  const TelaReservas({super.key});

  @override
  State<TelaReservas> createState() => _TelaReservasState();
}

class _TelaReservasState extends State<TelaReservas> {
  FormatTools tools = FormatTools(); //Importa a 'caixa de ferramentas'
  AppDatabase db = AppDatabase();
  late ReservasDao reservasDao = ReservasDao(db);

  Future<void> removerReserva(Reserva reserva) async {
    int result = await reservasDao.removerReserva(
      id: reserva.idReserva,
      idSala: reserva.idSala,
    );

    if (result > 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Reserva ${reserva.idReserva} removida com sucesso.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              "Reserva ${reserva.idReserva} não removida.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }

    if (mounted) Navigator.of(context).pop();
  }

  Future<void> abrirDialogoRemover(Reserva reserva) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remover?'),
          content: Text('Deseja remover a reserva ${reserva.idReserva} ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async => removerReserva(reserva),
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void abrirTelaCompartilhar(ReservasModel reserva) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CustomTicket(reserva: reserva)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<List<ReservasModel>>(
          stream: reservasDao.streamOfReservas(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Erro ao carregar a lista"));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            List<ReservasModel> listOfReservas = snapshot.data ?? [];

            if (listOfReservas.isEmpty) {
              return Center(child: Text("Nenhuma reserva efetuada."));
            }

            return ListView.builder(
              itemCount: listOfReservas.length,
              itemBuilder: (context, index) {
                final model = listOfReservas[index]; //?

                final reserva =
                    listOfReservas[index].reserva; //Extrai a reserva da lista
                final sala =
                    listOfReservas[index].sala; //Extrai a sala da lista
                final curso =
                    listOfReservas[index].curso; //Extrai o curso da lista

                return CustomCard(
                  title: sala.nome,
                  subtitle: curso.nomeCurso,
                  dataInicio: tools.converterDateTime(curso.dataInicio), 
                  dataFim: tools.converterDateTime(curso.dataFim),
                  turno: curso.turno,
                  onTapShare: () => abrirTelaCompartilhar(model), //?
                  onTapDelete: () {
                    if (reserva != null) {
                      abrirDialogoRemover(reserva);
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
