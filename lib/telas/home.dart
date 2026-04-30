import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/reservas_dao.dart';
import 'package:senac_salas/telas/tela_perfil.dart';
import 'package:senac_salas/telas/telas_wrapper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> listOfPages = [
    TelasWrapper(), //? Salas
    Container(color: Colors.grey), //? Cursos
    Container(color: Colors.grey), //? Reservas
    TelaPerfil(), //? Perfil
  ];
  int _selectedIndex = 0;

  //Função de alteração de página
  void _onTap(int index) => setState(() => _selectedIndex = index);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      AppDatabase db = AppDatabase();
      ReservasDao reservasDao = ReservasDao(db);

      reservasDao.reativarSalasAutomatico();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            activeIcon: Icon(Icons.meeting_room),
            label: 'Salas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
