import 'package:flutter/material.dart';
import 'package:senac_salas/custom/custom_card_sala_cursos.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/salas_dao.dart';

class TelaCursosSala extends StatefulWidget {
  final Sala sala;
  const TelaCursosSala({super.key, required this.sala});

  @override
  State<TelaCursosSala> createState() => _TelaCursosSalaState();
}

class _TelaCursosSalaState extends State<TelaCursosSala> {
  final AppDatabase db = AppDatabase();
  late SalasDao salasDao = SalasDao(db);

  @override
  Widget build(BuildContext context) {
    final futureCursos = salasDao.buscarCursosPorSala(idSala: widget.sala.id);

    return Scaffold(
      appBar: AppBar(title: Text('Cursos na sala')),
      body: FutureBuilder(
        future: futureCursos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Icon(Icons.error_outline, color: Colors.amber, size: 50),
                      Text('Houve um erro ao carregar os cursos'),
                    ],
                  ),
                ),
              ),
            );
          }

          final list = snapshot.data ?? [];

          if(list.isEmpty){
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Icon(Icons.data_array, color: Colors.amber, size: 50),
                      Text('Nenhum curso previsto para esta sala'),
                    ],
                  ),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.all(15),
            itemBuilder: (context, index){
              final curso = list[index];
              
              return CustomCardSalaCurso(curso: curso);
            },
          );
        },
      ),
    );
  }
}
