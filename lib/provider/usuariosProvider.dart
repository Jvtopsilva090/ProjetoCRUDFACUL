// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_usuarios.dart';
import 'package:flutter_crud/models/usuario.dart';

class Users with ChangeNotifier {
  final Map<String, Usuario> _items = {...DUMMY_USERS};

  List<Usuario> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Usuario byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Usuario user) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return;
    }

    // Verificar se o usuário já tem um ID válido
    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      // Atualizar usuário existente
      _items.update(user.id!, (_) => user);
    } else {
      // Adicionar novo usuário com ID gerado
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Usuario(
          id: id,
          nome: user.nome,
          email: user.email,
          numero: user.numero, 
          icone: user.icone,
        ),
      );
    }

    notifyListeners();
  }

  void remove(Usuario user) {
    // ignore: unnecessary_null_comparison
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
