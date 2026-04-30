import 'package:flutter/material.dart';
import 'package:senac_salas/telas/auth/login.dart';
import 'package:senac_salas/telas/auth/registro.dart';

class Autenticar extends StatefulWidget {
  const Autenticar({super.key});

  @override
  State<Autenticar> createState() => _AutenticarState();
}

class _AutenticarState extends State<Autenticar> {
  int selectedIndex = 0;

  List<Widget> paginas = [Login(), Registro()];

  void mudarPagina(int index) => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: paginas.elementAt(selectedIndex),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Botão de entrada
              TextButton(
                onPressed: () => mudarPagina(0),
                child: Text("Entrar", style: TextStyle(
                  color: (selectedIndex == 0) ? Colors.indigo : Colors.black26,
                  fontWeight: (selectedIndex == 0) ? FontWeight.bold : FontWeight.normal,
                  fontSize: (selectedIndex == 0) ? 18 : 16
                )),
              ),
              //Botão de registro
               TextButton(
                onPressed: () => mudarPagina(1),
                child: Text("Registrar", style: TextStyle(
                  color: (selectedIndex == 1) ? Colors.indigo : Colors.black26,
                  fontWeight: (selectedIndex == 1) ? FontWeight.bold : FontWeight.normal,
                  fontSize: (selectedIndex == 1) ? 18 : 16
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
