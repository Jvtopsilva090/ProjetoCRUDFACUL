import 'package:flutter/material.dart';
import 'package:flutter_crud/components/notificacao.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../provider/usuarios_provider.dart';

class UserTile extends StatelessWidget {
  final Usuario user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = user.icone.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: AssetImage(user.icone));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_EDIT_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Usuário'),
                    content: const Text(
                        'Tem certeza que deseja excluir este usuário?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Provider.of<Users>(context, listen: false).remove(user);
                          Navigator.of(context).pop(true);
                          Notify.show(context, 'Usuário deletado com sucesso!');
                        },
                      ),
                    ],
                  ));
              },
            ),
          ],
        ),
      ),
    );
  }
}