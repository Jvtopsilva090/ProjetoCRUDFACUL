<<<<<<< HEAD
// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_null_comparison, use_build_context_synchronously
=======
// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_null_comparison, use_build_context_synchronously, library_private_types_in_public_api
>>>>>>> d2b590c (Descrição das mudanças realizadas)

import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/provider/users.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatefulWidget {
  final User user;

  const UserTile(this.user);

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user; // Inicializa o estado com o usuário recebido.
  }

  // Método para mostrar as opções de avatar para o usuário.
  Future<void> _chooseAvatar(BuildContext context) async {
    final selectedImage = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Escolha um Avatar'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.count(
            crossAxisCount: 3, // Número de imagens por linha.
            mainAxisSpacing: 10, // Espaçamento vertical.
            crossAxisSpacing: 10, // Espaçamento horizontal.
            children: [
              'https://cdn.pixabay.com/photo/2016/04/01/11/25/avatar-1300331_1280.png',
              'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295429_960_720.png',
              'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295430_1280.png',
              'https://cdn.pixabay.com/photo/2013/07/12/19/15/gangster-154425_960_720.png',
              'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png',
              'https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407_1280.png',
              'https://cdn.pixabay.com/photo/2022/09/23/06/09/man-7473745_960_720.jpg',
            ].map((url) {
              return GestureDetector(
                onTap: () => Navigator.of(ctx).pop(url), // Retorna a URL selecionada.
                child: Image.network(url, fit: BoxFit.cover), // Mostra a imagem.
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(ctx).pop(), // Fecha sem selecionar.
          ),
        ],
      ),
    );

    if (selectedImage != null) {
      setState(() {
        user.icone = selectedImage; // Atualiza a imagem selecionada.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final avatar = (user.icone == null || user.icone.isEmpty)
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(backgroundImage: NetworkImage(user.icone));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email + "\n" + user.numero),
=======
    // Define o avatar do usuário, permitindo que ele selecione uma imagem ou use o padrão.
    final avatar = GestureDetector(
      onTap: () => _chooseAvatar(context), // Chama o método para escolher um avatar.
      child: CircleAvatar(
        backgroundImage: (user.icone == null || user.icone.isEmpty)
            ? null
            : NetworkImage(user.icone), // Usa a imagem selecionada ou deixa sem.
        child: (user.icone == null || user.icone.isEmpty)
            ? const Icon(Icons.person) // Ícone padrão se não houver imagem.
            : null, // Não exibe ícone se houver imagem.
      ),
    );

    // Retorna o layout do item de lista.
    return ListTile(
      leading: avatar, // Avatar com a funcionalidade de escolha.
      title: Text(user.nome), // Nome do usuário.
      subtitle: Text('${user.email}\n${user.numero}'), // E-mail e número de telefone.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
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