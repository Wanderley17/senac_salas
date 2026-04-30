import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:senac_salas/database/daos/cursos_dao.dart';
import 'package:senac_salas/database/daos/reservas_dao.dart';
import 'package:senac_salas/database/daos/salas_dao.dart';
import 'package:senac_salas/database/daos/usuarios_dao.dart';
import 'package:senac_salas/database/tables/tabelas.dart';

part 'app_database.g.dart'; //O build_runner vai criar esse arquivo para você

@DriftDatabase(tables: [Salas, Cursos, Reservas, Usuarios], daos: [UsuariosDao, SalasDao, CursosDao, ReservasDao])
class AppDatabase extends _$AppDatabase{
  AppDatabase._internal() : super(_openConnection()); //Impede criação de novas instâncias fora da classe
  
  static final AppDatabase instance = AppDatabase._internal(); //Única instância estática da classe
  
  factory AppDatabase() => instance; //Retorna sempre a mesma instaância

  @override
  int get schemaVersion => 1; //Versão o esquema do banco de dado

  static QueryExecutor _openConnection(){
    return driftDatabase(
      name: 'senac_salas',
      native: DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),  
    );
  }
}