import 'package:flutter/material.dart';
import 'package:senac_salas/telas/auth/login.dart';
import 'package:senac_salas/telas/auth/registro.dart';

class Autenticar extends StatefulWidget {
  const Autenticar({super.key});

  @override
  State<Autenticar> createState() => _AutenticarState();
}

class _AutenticarState extends State<Autenticar> {
  final ValueNotifier<int> _indexNotifier = ValueNotifier<int>(0);
  List<Widget> paginas =[];

  @override
  void initState() {
    paginas = [
      Login(notifier: _indexNotifier),
      Registro(notifier: _indexNotifier),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _indexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: _indexNotifier,
          builder: (context, index, child) {
            return paginas.elementAt(index);
          }
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _indexNotifier,
          builder: (context, index, child) {
            return Container(
              height: 70,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Botão de entrada
                  TextButton(
                    onPressed: () => _indexNotifier.value = 0,
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        color: (index == 0)
                            ? Colors.indigo
                            : Colors.black26,
                        fontWeight: (index == 0)
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: (index == 0) ? 18 : 16,
                      ),
                    ),
                  ),
                  //Botão de registro
                  TextButton(
                    onPressed: () => _indexNotifier.value = 1,
                    child: Text(
                      "Registrar",
                      style: TextStyle(
                        color: (index == 1)
                            ? Colors.indigo
                            : Colors.black26,
                        fontWeight: (index == 1)
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: (index == 1) ? 18 : 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
