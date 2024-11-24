// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/provider/users.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = (user.icone == null || user.icone.isEmpty)
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(backgroundImage: NetworkImage(user.icone));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email + "\n" + user.numero),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Usuário'),
                    content: const Text('Tem certeza que deseja excluir este usuário?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () => Navigator.of(ctx).pop(false),
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () => Navigator.of(ctx).pop(true),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed ?? false) {
                    Provider.of<Users>(context, listen: false).remove(user);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}