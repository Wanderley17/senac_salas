// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback? onTapEdit; //Ação para edição (pode ou não existir)
  final VoidCallback? onTapDelete; //Ação para apagar (pode ou não existir)
  final VoidCallback? onTapOpen; //Ação para abrir (pode ou não existir)
  final VoidCallback? onTapShare; //Ação para compartilhar (pode ou não existir)

  final String title; //Título do card (Obrigatório)
  final String subtitle; //Subtítulo do card (Obrigatório)
  final String? dataInicio; //Data de início (Opcional, pode ser null)
  final String? dataFim; //Data de fim (Opcional, pode ser null)
  final String? turno; //Turno da aula (Opcional, pode ser null)

  const CustomCard({
    super.key, //?
    this.onTapEdit, //?
    this.onTapDelete, //?
    this.onTapOpen, //?
    this.onTapShare, //?
    required this.title, //?
    required this.subtitle, //?
    this.dataInicio, //?
    this.dataFim, //?
    this.turno, //?
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
      elevation: 1.5,
      borderOnForeground: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.indigo, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Título
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            //Subtítulo
            Text(
              subtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            //Data Inicio e Data fim
            if (dataInicio != null && dataFim != null)
              Text(
                '$dataInicio - $dataFim',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            //Turno
            if (turno != null)
              Text(
                '$turno',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Botão de abrir
                if (onTapOpen != null)
                  IconButton(
                    onPressed: onTapOpen,
                    icon: Icon(Icons.open_in_new, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hoverColor: Colors.amber.shade400,
                    ),
                  ),
                //Botão de compartilhar
                if (onTapShare != null)
                  IconButton(
                    onPressed: onTapShare,
                    icon: Icon(Icons.share, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hoverColor: Colors.blue.shade400,
                    ),
                  ),
                  //Botão de editar
                  if (onTapEdit != null)
                  IconButton(
                    onPressed: onTapEdit,
                    icon: Icon(Icons.edit, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hoverColor: Colors.blue.shade400,
                    ),
                  ),
                   //Botão de remover
                  if (onTapDelete != null)
                  IconButton(
                    onPressed: onTapDelete,
                    icon: Icon(Icons.delete, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hoverColor: Colors.red.shade400,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
