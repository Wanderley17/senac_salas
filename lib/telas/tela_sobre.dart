import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sobre', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Center(
                  child: SizedBox(
                    width: 150,
                    child: Image.asset(
                      'assets/senac_logo.png',
                      alignment: AlignmentGeometry.center,
                    ),
                  ),
                ),
                Text(
                  'O aplicativo Senac Salas foi desenvolvido pela primeira turma do curso de Programador de Dispositivos Móveis do senac Santarém, ministrado pelo instrutor Patrick Macedo.',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'O Aplicativo foi desenvolvido para facilitar a reserva de salas de aula da instituição, diminuindo o uso de papel e poupando retrabalho.',
                  textAlign: TextAlign.justify,
                ),
                Card(
                  color: Colors.grey.shade200,
                  elevation: 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'O Projeto foi desenvolvido pelos alunos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 1000,
                          height: 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                      'assets/jose.webp',
                                    ),
                                  ),
                                  SizedBox(width: 10, height: 10),
                                  Text('José Wanderley'),
                                ],
                              ),
                              SizedBox(width: 10, height: 10),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                      'assets/kaio.webp',
                                    ),
                                  ),
                                  SizedBox(width: 10, height: 10),
                                  Text('Kaio Sousa'),
                                ],
                              ),
                              SizedBox(width: 10, height: 10),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                      'assets/logan.webp',
                                    ),
                                  ),
                                  SizedBox(width: 10, height: 10),
                                  Text('Logan Camelo'),
                                ],
                              ),
                              SizedBox(width: 10, height: 10),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                      'assets/pedro.webp',
                                    ),
                                  ),
                                  SizedBox(width: 10, height: 10),
                                  Text('Pedro Igor'),
                                ],
                              ),
                              SizedBox(width: 10, height: 10),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset('assets/senac_logo.png', width: 100, height: 100),
                                    )
                                  ),
                                  SizedBox(width: 10, height: 10),
                                  Text('Jonas Felipe'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
