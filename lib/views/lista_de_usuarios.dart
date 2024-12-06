import 'package:flutter/material.dart';
import 'package:flutter_crud/components/usuario_tile.dart';
import 'package:flutter_crud/provider/usuarios_provider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context);

    return Scaffold(
      appBar:
      AppBar(
        title:
          const Column(
            mainAxisSize:
              MainAxisSize.min,
            children: [
              Text(
                'LISTA DE USUÁRIOS',
                style:
                  TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              Text(
                'Grupo do Shelby',
                style: TextStyle(
                    fontSize: 14,
                ),
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
        elevation: 0.0,
      ),
      body:
      ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => UserTile(users.byID(index)!),
      ),
    );
  }
}