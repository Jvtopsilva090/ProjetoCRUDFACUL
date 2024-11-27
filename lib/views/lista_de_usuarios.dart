import 'package:flutter/material.dart';
import 'package:flutter_crud/components/usuario_tile.dart';
import 'package:flutter_crud/provider/usuariosProvider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UsersHomePage extends StatelessWidget {
  const UsersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context); // Correção na tipagem

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
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}