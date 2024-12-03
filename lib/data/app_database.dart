import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static const _dbName = "app_database.db";
  static const _dbVersion = 1;
  static const tableName = "usuarios";

  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();
  static Database? _database;

  Future<Database> _initialize() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        return await db.execute('CREATE TABLE $tableName(id INTEGER PRIMARY KEY, nome TEXT, email TEXT, numero TEXT, icone TEXT);');
      },
    );
  }

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initialize();
    return _database;
  }
}