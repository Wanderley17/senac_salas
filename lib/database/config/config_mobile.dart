import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart'; 
import 'package:path/path.dart' as p; 

LazyDatabase openConnection(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory(); //Diretório e pasta
    final dbFile = File(p.join(dbFolder.path, 'db.sqlite'));// Arquivo SQLite

    return NativeDatabase(dbFile); //Retorna o banco de dados
  });
}
