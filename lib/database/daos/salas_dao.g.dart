// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salas_dao.dart';

// ignore_for_file: type=lint
mixin _$SalasDaoMixin on DatabaseAccessor<AppDatabase> {
  $SalasTable get salas => attachedDatabase.salas;
  SalasDaoManager get managers => SalasDaoManager(this);
}

class SalasDaoManager {
  final _$SalasDaoMixin _db;
  SalasDaoManager(this._db);
  $$SalasTableTableManager get salas =>
      $$SalasTableTableManager(_db.attachedDatabase, _db.salas);
}
