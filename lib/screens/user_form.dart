import 'package:flutter/material.dart';
import 'package:flutter_crud/domain/business/user_manager.dart';
import 'package:flutter_crud/domain/models/icones.dart';
import 'package:flutter_crud/domain/models/usuario.dart';

import 'components/notificacao.dart';
import 'home.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<StatefulWidget> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {

  final _form = GlobalKey<FormState>();
  static late Map<String, Object?> _formData = {};
  List<Icone> icones = [];

  void _getIcons() { icones = Icone.list; }

  @override
  Widget build(BuildContext context) {
    _getIcons();

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title:
        const Text(
          'CRIAR USUÁRIO',
          style:
            TextStyle(
              fontWeight: FontWeight.bold,
            ),
        ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: () {
            if (_form.currentState!.validate()) {
              _form.currentState!.save();

              UserManager().inserirUsuario(
                  Usuario(
                      nome: _formData['nome'].toString(),
                      email: _formData['email'].toString(),
                      numero: _formData['numero'].toString(),
                      icone: _formData['icone'].toString()
                  )
              );

              _formData = {};

              setState(() {
                HomePageState.atualizarLista();
              });
              Navigator.of(context).pop();
              Notify.show(context, 'Usuário criado com sucesso!');
            }
          },
        ),
      ],
    );
  }

  Widget? body() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Container( //lista de icones
              margin: const EdgeInsets.only(bottom: 10,),
              height: 150,
              child: ListView.separated(
                itemCount: icones.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 30,),
                itemBuilder: (context, index) {
                  Icone icone = icones.elementAt(index);
                  return GestureDetector(
                    onTap: () => {
                      setState(() {
                        icone.selected = true;
                      }),
                      _formData['icone'] = icone.dir,
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 4,
                              color: _formData['icone'] == icone.dir
                                  ? Colors.lightGreen : Colors.white,
                            ),
                          ]
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/${icone.dir}'),
                        radius: 60,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text(
                'SELECIONE UM AVATAR'
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'NOME',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value ?? '',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'EMAIL',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um email.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value ?? '',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'NÚMERO DE TELEFONE',
                ),
                validator: (value) {
                  if (value?.length != 11) {
                    return 'Número inválido.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['numero'] = value ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}