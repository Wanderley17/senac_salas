// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursos_dao.dart';

// ignore_for_file: type=lint
mixin _$CursosDaoMixin on DatabaseAccessor<AppDatabase> {
  $CursosTable get cursos => attachedDatabase.cursos;
  CursosDaoManager get managers => CursosDaoManager(this);
}

class CursosDaoManager {
  final _$CursosDaoMixin _db;
  CursosDaoManager(this._db);
  $$CursosTableTableManager get cursos =>
      $$CursosTableTableManager(_db.attachedDatabase, _db.cursos);
}
