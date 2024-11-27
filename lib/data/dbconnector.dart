import 'package:flutter/widgets.dart';
import 'package:myapp/models/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBConnector {

  Future<Database> criarConexao() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'usuarios.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE IF NOT EXISTS usuarios (id INTEGER PRIMARY KEY, nome TEXT, email TEXT, numero TEXT, icone INTEGER)'
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> inserirUsuario(Usuario usuario) async {
    final db = await criarConexao();

    await db.insert('usuarios',
        usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //editar

  //excluir
}
