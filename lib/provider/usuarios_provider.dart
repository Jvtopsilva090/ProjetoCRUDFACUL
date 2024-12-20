import 'package:flutter/material.dart';
import 'package:flutter_crud/data/user_manager.dart';
import 'package:flutter_crud/models/usuario.dart';

class Users with ChangeNotifier {

  List<Usuario> _usuarios = [];

  List<Usuario> get all {
    return _usuarios;
  }

  int get count {
    return _usuarios.length;
  }

  Usuario? byIndex(int id) {
    for (var usuario in _usuarios) {
      if (usuario.id == id) return usuario;
    }
    return null;
  }

  void put(Usuario user) {
    // Verificar se o usuário já tem um ID. Que indica também se ele existe na lista.
    if (user.id != null || user.id == 0) {
      // Atualizar usuário existente
      UserManager().atualizarUsuario(user);
    } else {
      // Adicionar novo usuário. ID gerado automaticamente pelo SGBD SQLite.
      UserManager().inserirUsuario(user);
    }

    notifyListeners();
  }

  void remove(Usuario user) {
    if (user.id == null || user.id == 0) return;

    UserManager().deletarUsuario(user.id!);
    atualizarLista();

    notifyListeners();
  }

  //Conecta ao BD e atualiza a lista de Usuario;
  Future<List<Usuario>> atualizarLista() async {
    _usuarios = await UserManager().pegarUsuarios();
    return _usuarios;
  }
}