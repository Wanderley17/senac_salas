import 'package:drift/drift.dart';
import 'package:senac_salas/database/tables/cursos.dart';
import 'package:senac_salas/database/tables/salas.dart';

class Reservas extends Table{ //CREATE TABLE reservas(
  IntColumn get idReserva => integer().autoIncrement()(); //id INT AUTOINCREMENT
  IntColumn get idCurso => integer().references(Cursos, #id)(); //id_curso INTEGER
  IntColumn get idSala => integer().references(Salas, #id)(); //id_sala INTEGER
} // );