import 'package:flutter/material.dart';

import 'package:flutter_crud/data/user_manager.dart';

import '../components/notificacao.dart';
import '../models/usuario.dart';
import '../views/usuario_edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  List<Usuario> usuarios = [];

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget? body(BuildContext context) {
    return
      FutureBuilder(
        future: UserManager().pegarUsuarios(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Text(
                'Carregando dados...',
              );
            default:
              if (snapshot.hasError) {
                return
                  Text('Error: ${snapshot.error}');
              } else {
                return
                  createListView(context, snapshot);
              }
          }
        },
    );
  }
  
  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    usuarios = snapshot.data;
    return
      ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          Usuario user = usuarios.elementAt(index);
          final avatar = user.icone.isEmpty || user.icone == ""
              ? const CircleAvatar(child: Icon(Icons.person))
              : CircleAvatar(backgroundImage: AssetImage('assets/icons/${user.icone}'));

          return
            //USER TIEL
            ListTile(
              leading: avatar,
              title: Text(user.nome),
              subtitle: Text(user.email),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:
                    <Widget>[
                      //BOTAO EDITAR USUARIO
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: Colors.orange,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const UserEditForm(),
                              settings: RouteSettings(
                                arguments: user,
                              )
                            )
                          ).then((value) {
                            setState(() {
                              atualizarLista();
                            });
                          });
                        },
                      ),
                      //BOTAO DELETAR USUARIO
                      IconButton( //deletar
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Excluir Usuário'),
                              content: const Text('Tem certeza que deseja excluir este usuário?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Não'),
                                  onPressed: () => Navigator.of(context).pop(false),
                                ),
                                TextButton(
                                  child: const Text('Sim'),
                                  onPressed: () {
                                    UserManager().deletarUsuario(user.id!);
                                    setState(() {
                                      atualizarLista();
                                    });
                                    Navigator.of(context).pop();
                                    Notify.show(context, 'Usuário deletado com sucesso!');
                                  },
                                ),
                              ],
                            )
                          );
                        },
                      ),
                    ],
                ),
              ),
            );
        },
      );
  }

  static void atualizarLista() async {
    HomePageState().usuarios = await UserManager().pegarUsuarios();
  }
}