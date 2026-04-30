import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:senac_salas/database/daos/reservas_dao.dart';
import 'package:senac_salas/utils/format_tools.dart';
import 'package:share_plus/share_plus.dart';

class CustomTicket extends StatefulWidget {
  final ReservasModel reserva;

  const CustomTicket({super.key, required this.reserva});

  @override
  State<CustomTicket> createState() => _CustomTicketState();
}

class _CustomTicketState extends State<CustomTicket> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> capturarImagemWidget() async {
    try {
      var boundary = _globalKey.currentContext?.findRenderObject();

      if (boundary is RenderRepaintBoundary) {
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? imageBytes = await image.toByteData(
          format: ui.ImageByteFormat.png,
        );
        Uint8List imageData = imageBytes!.buffer.asUint8List();

        final tempDir =
            await getTemporaryDirectory(); //Cria um diretório temporário para o arquivo
        final file = await File(
          '${tempDir.path}/${widget.reserva.curso.nomeCurso}.png',
        ).create();
        await file.writeAsBytes(imageData);

        final params = ShareParams(
          files: [XFile(file.path)],
          text: "Verifique sua reserva de sala",
        );

        final result = await SharePlus.instance.share(params);

        if (result.status == ShareResultStatus.success) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Reserva compartilhada com sucesso",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        }

        log("Imagem capturada com sucesso");
      }
    } catch (e) {
      log("Erro na captura de imagem: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Reserva'),
          actions: [
            IconButton(
              onPressed: capturarImagemWidget,
              icon: Icon(Icons.share),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: RepaintBoundary(
                  key: _globalKey,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderOnForeground: true,
                    color: Colors.white,
                    elevation: 1.5,
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                      side: BorderSide(color: Colors.indigo, width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20), //?
                      child: Stack(
                        children: [
                          Center(
                            child: Opacity(
                              opacity: 0.2,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height *
                                    0.4, //?
                                width:
                                    MediaQuery.of(context).size.width * 0.4, //?
                                child: Image.asset('assets/senac_logo.png'),
                              ),
                            ),
                          ),
                          CardCustomTicket(reserva: widget.reserva),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Widget Customizado para exibir informações de texto
class TextInfo extends StatelessWidget {
  final String text;
  final String label;
  final double textSize;
  final double labelSize;

  const TextInfo({
    super.key,
    required this.text,
    required this.label,
    required this.textSize,
    required this.labelSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            label,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: labelSize,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Flexible(
          child: Text(
            text,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class CardCustomTicket extends StatelessWidget {
  final ReservasModel reserva;

  const CardCustomTicket({super.key, required this.reserva});

  @override
  Widget build(BuildContext context) {
    FormatTools tools = FormatTools(); //Ferramenta de formatação
    final dadosReserva = reserva.reserva;
    final dadosCurso = reserva.curso;
    final dadosSala = reserva.sala;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        TextInfo(
          text: '${dadosReserva!.idReserva}',
          label: 'id reserva',
          textSize: 16.0,
          labelSize: 12.0,
        ),
        Divider(),
        TextInfo(
          text: dadosCurso.nomeCurso,
          label: 'Nome do curso',
          textSize: 16.0,
          labelSize: 12.0,
        ),
        if (dadosCurso.codigoSIG != null)
          TextInfo(
            text: dadosCurso.codigoSIG!,
            label: 'Codigo SIG',
            textSize: 16.0,
            labelSize: 2.0,
          ),
        TextInfo(
          text: dadosCurso.professor,
          label: 'Professor do curso',
          textSize: 16.0,
          labelSize: 12.0,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInfo(
                text: tools.converterDateTime(dadosCurso.dataInicio),
                label: 'Inicio do curso',
                textSize: 16.0,
                labelSize: 12.0,
              ),
              TextInfo(
                text: tools.converterDateTime(dadosCurso.dataFim),
                label: 'Fim do curso',
                textSize: 16.0,
                labelSize: 12.0,
              ),
            ],
          ),
        ),
        TextInfo(
          text: dadosCurso.turno,
          label: 'Turno do curso',
          textSize: 16.0,
          labelSize: 12.0,
        ),
        Divider(),
        TextInfo(
          text: dadosSala.nome,
          label: 'Nome da sala',
          textSize: 16.0,
          labelSize: 12.0,
        ),

        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInfo(
                text: dadosSala.numero,
                label: 'Número da sala',
                textSize: 16.0,
                labelSize: 12.0,
              ),
              TextInfo(
                text: '${dadosSala.capacidade}',
                label: 'Capacidade da sala',
                textSize: 16.0,
                labelSize: 12.0,
              ),
            ],
          ),
        ),
        TextInfo(
          text: dadosSala.localizacao,
          label: 'Localização da sala',
          textSize: 16.0,
          labelSize: 12.0,
        ),
        TextInfo(
          text: dadosSala.recursos,
          label: 'Recursos da sala',
          textSize: 16.0,
          labelSize: 12.0,
        ),
      ],
    );
  }
}
