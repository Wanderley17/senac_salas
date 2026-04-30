import 'package:flutter/material.dart';
import 'package:senac_salas/telas/cadastro_curso.dart';
import 'package:senac_salas/telas/cadastro_sala.dart';
import 'package:senac_salas/telas/tela_cursos.dart';
import 'package:senac_salas/telas/tela_reservas.dart';
import 'package:senac_salas/telas/tela_salas.dart';

class TelasWrapper extends StatefulWidget {
  const TelasWrapper({super.key});

  @override
  State<TelasWrapper> createState() => _TelasWrapperState();
}

class _TelasWrapperState extends State<TelasWrapper>
    with SingleTickerProviderStateMixin {
  late TabController tabCtrl;

  List<Tab> tabs = [
    Tab(icon: Icon(Icons.meeting_room), text: 'Salas'),
    Tab(icon: Icon(Icons.school), text: 'Cursos'),
    Tab(icon: Icon(Icons.bookmark), text: 'Reservas'),
  ];

  List<Widget> pages = [
    TelaSalas(), //? Salas
    TelaCursos(), //? Cursos
    TelaReservas(), //? Reservas
  ];

  void adicionarSala() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CadastroSala()),
  );

  void adicionarCurso() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CadastroCurso()),
  );

  @override
  void initState() {
    tabCtrl = TabController(length: pages.length, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        body: NestedScrollView(
           floatHeaderSlivers: false,
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                elevation: 0.0,
                title: Text('Senac Salas'),
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.add),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onSelected: (value) {
                      switch (value) {
                        case 'sala':
                          adicionarSala(); //?
                          break;
                        case 'curso':
                          adicionarCurso(); //?
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'sala',
                          child: ListTile(
                            leading: Icon(Icons.meeting_room),
                            title: Text('Adicionar Sala'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'curso',
                          child: ListTile(
                            leading: Icon(Icons.grade),
                            title: Text('Adicionar Curso'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        
                      ];
                    },
                  ),
                ],
              ),
              SliverAppBar(
                floating: false,
                pinned: true,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                 backgroundColor: Colors.white,
                title: TabBar(
                  tabs: tabs,
                  controller: tabCtrl,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.indigo,
                  labelColor: Colors.indigo,
                  dividerColor: Colors.transparent,
                ),
              ),
            ];
          },
          body: TabBarView(controller: tabCtrl, children: pages),
        ),
      ),
    );
  }
}
