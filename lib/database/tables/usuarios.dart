import 'package:drift/drift.dart';

class Usuarios extends Table{
  IntColumn get idUsuario => integer().autoIncrement()();
  TextColumn get matricula => text().nullable()();
  TextColumn get nome => text()();
  TextColumn get funcao => text()();
  TextColumn get celular => text().nullable()(); 
  TextColumn get email => text().nullable()(); 
  TextColumn get senha => text()();
  BoolColumn get logado => boolean().withDefault(const Constant(false))();
}