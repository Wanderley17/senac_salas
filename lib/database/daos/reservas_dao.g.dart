// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservas_dao.dart';

// ignore_for_file: type=lint
mixin _$ReservasDaoMixin on DatabaseAccessor<AppDatabase> {
  $CursosTable get cursos => attachedDatabase.cursos;
  $SalasTable get salas => attachedDatabase.salas;
  $ReservasTable get reservas => attachedDatabase.reservas;
  ReservasDaoManager get managers => ReservasDaoManager(this);
}

class ReservasDaoManager {
  final _$ReservasDaoMixin _db;
  ReservasDaoManager(this._db);
  $$CursosTableTableManager get cursos =>
      $$CursosTableTableManager(_db.attachedDatabase, _db.cursos);
  $$SalasTableTableManager get salas =>
      $$SalasTableTableManager(_db.attachedDatabase, _db.salas);
  $$ReservasTableTableManager get reservas =>
      $$ReservasTableTableManager(_db.attachedDatabase, _db.reservas);
}
