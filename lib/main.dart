import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:senac_salas/telas/auth/auth_wrapper.dart';
import 'package:senac_salas/themes/tema.dart';
import 'package:senac_salas/utils/audit_tools.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Informa que existem recursos que serão inicializados antes

  await initializeDateFormatting('pt_BR', null); //Informa qual padrão de formato de data

  final globalScaffoldKey = GlobalKey<ScaffoldMessengerState> (); //Cria chave global do ScaffoldMessenger

  final audit = AuditTools(); //Chama o Singleton de auditoria

  //1. Captura erros comuns de construção de widgets
  FlutterError.onError = (FlutterErrorDetails detalhes){
    FlutterError.presentError(detalhes); //Mantém o log no console
    audit.salvarLogErro(detalhes.exception, detalhes.stack); //Insere os detalhes no arquivo
  };

  //2. Capturar erros assincronos fora do contexto Flutter (Isolates e Plataforma)
  PlatformDispatcher.instance.onError = (error, stack){
    audit.salvarLogErro(error, stack); //Salva os detalhes do erro no log
    return true; //Informa que o erro foi tratado pela auditoria
  };

  runApp(
    MaterialApp(
      scaffoldMessengerKey: globalScaffoldKey, //Chave global do Scaffold
      debugShowCheckedModeBanner: false,  //Remove o banner de debug do aplicativo
      home: AuthWrapper(), //Autenticar(),
      theme: tema,
      locale: const Locale('pt', 'BR'),
    ),
  );
}
