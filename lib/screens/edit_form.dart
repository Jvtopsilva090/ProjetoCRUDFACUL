import 'package:flutter/material.dart';
import 'package:flutter_crud/domain/business/user_manager.dart';
import 'package:flutter_crud/domain/models/icones.dart';
import 'package:flutter_crud/domain/models/usuario.dart';

import 'components/notificacao.dart';
import 'home.dart';

class EditFormPage extends StatefulWidget {
  const EditFormPage({super.key});

  @override
  State<StatefulWidget> createState() => _EditFormPageState();
}

class _EditFormPageState extends State<EditFormPage> {

  final _form = GlobalKey<FormState>();
  static late Map<String, Object?> _formData = {};
  List<Icone> icones = [];

  void _getIcons() { icones = Icone.list; }

  Usuario? user;

  @override
  Widget build(BuildContext context) {
    _getIcons();

    var args = ModalRoute.of(context)?.settings.arguments;

    if (args != null) {
      user = args as Usuario;
      _formData['id'] = user!.id;
      _formData['nome'] = user!.nome;
      _formData['email'] = user!.email;
      _formData['numero'] = user!.numero;
      _formData['icone'] = user!.icone;
    } else {
      Navigator.of(context).pop();
      Notify.show(context, 'Algo de errado ocorreu ao pegar o usuario');
    }

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title:
        const Text(
          'EDITAR USUÁRIO',
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

              UserManager().atualizarUsuario(
                Usuario(
                  id: _formData['id'] as int,
                  nome: _formData['nome'].toString(),
                  email: _formData['email'].toString(),
                  numero: _formData['numero'].toString(),
                  icone: _formData['icone'].toString()
                )
              );

              setState(() {
                _formData = {};
                HomePageState.atualizarLista();
              });
              Navigator.of(context).pop();
              Notify.show(context, 'Usuário atualizado com sucesso!');
            }else{
              setState(() {
                _formData = {};
                HomePageState.atualizarLista();
              });

              Navigator.of(context).pop();
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
                        _formData['icone'] = icone.dir;
                        user!.icone = icone.dir;
                      }),
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 4,
                              color: icone.dir == _formData['icone'].toString()
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
                initialValue: _formData['nome'].toString(),
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
                initialValue: _formData['email'].toString(),
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
                initialValue: _formData['numero'].toString(),
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