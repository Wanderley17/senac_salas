import 'package:drift/drift.dart';

class Salas extends Table{ //CREATE TABLE salas(
  IntColumn get id => integer().autoIncrement()(); //id INTEGER AUTOINCREMENT,
  TextColumn get nome => text()(); //nome TEXT,
  TextColumn get numero => text()(); //numero TEXT,
  IntColumn get capacidade => integer()(); //capacidade INTEGER,
  TextColumn get recursos => text()(); //recursos TEXT,
  TextColumn get localizacao => text()(); //localizacao TEXT,
  BoolColumn get disponivel => boolean().withDefault(const Constant(true))();//?disponivel INTEGER -- (0 - false; 1 - true)
} // );