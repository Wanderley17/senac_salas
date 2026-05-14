// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/utils/format_tools.dart';

class CustomCardSalaCurso extends StatefulWidget {
  final Curso curso; //Dados da sala a ser exibida no card

  const CustomCardSalaCurso({super.key, required this.curso});

  @override
  State<CustomCardSalaCurso> createState() => _CustomCardSalaCursoState();
}

class _CustomCardSalaCursoState extends State<CustomCardSalaCurso> {
  final FormatTools tools = FormatTools();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      borderOnForeground: true,
      elevation: 1.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(14),
        side: BorderSide(color: Colors.indigo, width: 0.5),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.curso.nomeCurso,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      overflow: TextOverflow.fade,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Text(
              widget.curso.professor,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Text(
              'Início: ${tools.converterDateTime(widget.curso.dataInicio)}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Text(
              'Conclusão: ${tools.converterDateTime(widget.curso.dataFim)}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Text(
              widget.curso.turno,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
