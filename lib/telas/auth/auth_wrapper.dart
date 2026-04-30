import 'package:flutter/material.dart';
import 'package:senac_salas/database/app_database.dart';
import 'package:senac_salas/database/daos/usuarios_dao.dart';
import 'package:senac_salas/telas/auth/autenticar.dart';
import 'package:senac_salas/telas/home.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    AppDatabase db = AppDatabase();
    UsuariosDao usuariosDao = UsuariosDao(db);

    Stream<Usuario?> streamUsuario = usuariosDao.buscarUltimoUsuario; 

    return StreamBuilder(
      stream: streamUsuario, 
      builder: (context, snapshot){
        if(snapshot.hasError){} //Caso ocorra um erro
        if(snapshot.connectionState == ConnectionState.waiting){ //Caso esteja carregando
          return Center(child: CircularProgressIndicator(color: Colors.orange,),);
        }

        Usuario? user = snapshot.data;

        if(user != null){ //Se o usuário for diferente de nulo
          return Home(); //Chama a tela Home
        }

        return Autenticar(); //Caso padrao, chama a tela de autenticação
      }
    );
  }
}