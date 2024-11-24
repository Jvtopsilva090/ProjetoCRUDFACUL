import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/data/dummy_users.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
     return [..._items.values];
  }

  int get counter{
    return _items.length;
  }
}