// ignore_for_file: unnecessary_null_comparison

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/data/dummy_users.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get counter {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (User == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          nome: user.nome,
          email: user.email,
          numero: user.numero,
          icone: user.icone,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
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

  void remove(User user){
    if(user != null && user.id != null  ){
      _items.remove(user.id);
      notifyListeners();
    }
  }

}