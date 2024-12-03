import 'package:flutter/material.dart';
import 'package:flutter_crud/data/router/app_routes.dart';
import 'package:flutter_crud/domain/business/user_manager.dart';
import 'package:flutter_crud/domain/models/usuario.dart';
import 'package:provider/provider.dart';

import 'components/usuario_tile.dart';

class UsersHomePage extends StatelessWidget {
  const UsersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserManager users = Provider.of<UserManager>(context); // Correção na tipagem
    List<Usuario> usuarios = [];
    UserManager().pegarUsuarios().then((us) => {
      usuarios = us
    });

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Lista de Usuários'),
            Text(
              'Grupo do Shelby',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          )
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (ctx, i) => UserTile(usuarios.elementAt(i)),
      ),
    );
  }
}