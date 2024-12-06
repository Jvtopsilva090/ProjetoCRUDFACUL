import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/components/notificacao.dart';
import 'package:flutter_crud/data/app_database.dart';
import 'package:sqflite/sqflite.dart';

import '../models/usuario.dart';

class UserManager with ChangeNotifier {

  Future<bool> verificarUsuario(Usuario user, Database db) async {
    final List<Usuario> usuarios = await pegarUsuarios();

    //verificando se o nome do usuario a ser inserido existe dentro do banco
    for (var usuario in usuarios) {
      if (usuario.nome == user.nome) {
        return false;
      };
    }

    return true;
  }

  Future<void> inserirUsuario(Usuario user) async {
    final db = await AppDatabase.instance.database;

    if (db == null) return;
    //if (!await verificarUsuario(user, db)) return;

    await db.insert(
      AppDatabase.tableName,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> atualizarUsuario(Usuario user) async {
    final db = await AppDatabase.instance.database;

    if (db == null) return;
    //if (!await verificarUsuario(user, db)) return;

    await db.update(
      AppDatabase.tableName,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deletarUsuario(int id) async {
    final db = await AppDatabase.instance.database;

    if (db == null) return;

    await db.delete(
      AppDatabase.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Usuario>> pegarUsuarios() async {
    final db = await AppDatabase.instance.database;

    if (db == null) return [];

    final List<Map<String, Object?>> userMaps = await db.query(AppDatabase.tableName);

    return [
      for (
        final {
        'id': id as int,
        'nome': nome as String,
        'email': email as String,
        'numero': numero as String,
        'icone': icone as String,
        } in userMaps
      ) Usuario(id: id, nome: nome, email: email, numero: numero, icone: icone)
    ];
  }
}