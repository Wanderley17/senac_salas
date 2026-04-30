import 'package:drift/drift.dart';

class Cursos extends Table{ //CREATE TABLE cursos(
  IntColumn get id => integer().autoIncrement()(); //id INTEGER AUTOINCREMENT,
  TextColumn get nomeCurso => text()(); // nome_curso TEXT,
  DateTimeColumn get dataInicio => dateTime()(); //? data_inicio  TEXT,
  DateTimeColumn get dataFim => dateTime()(); //? data_fim TEXT,
  TextColumn get turno => text()(); // turno TEXT,
  TextColumn get professor => text()(); // professor TEXT,
  TextColumn get codigoSIG => text().nullable()(); // codigo_sig TEXT NULL
} // );