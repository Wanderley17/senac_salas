// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:senac_salas/database/app_database.dart';

class CustomCardSala extends StatefulWidget {
  final Function(bool) onDisponivel; //Função para troca de disponibilidade de sala
  final VoidCallback onDelete;
  final Sala sala; //Dados da sala a ser exibida no card
  
  const CustomCardSala({
    super.key,
    required this.onDisponivel,
    required this.sala, 
    required this.onDelete,
  });

  @override
  State<CustomCardSala> createState() => _CustomCardSalaState();
}

class _CustomCardSalaState extends State<CustomCardSala> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 10),
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
                Text(
                  widget.sala.nome,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    overflow: TextOverflow.fade,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: (widget.sala.disponivel)
                          ? Colors.green
                          : Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    iconSize: 20,
                    onPressed: () =>
                        widget.onDisponivel(!widget.sala.disponivel),
                    icon: Icon(Icons.power_settings_new),
                  ),
                ),
              ],
            ),
            Text(
              widget.sala.numero,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Text(
              widget.sala.localizacao,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  '${widget.sala.capacidade} Alunos',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                IconButton(onPressed: widget.onDelete, icon: Icon(Icons.delete, color: Colors.red))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
