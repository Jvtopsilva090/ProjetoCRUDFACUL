// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_crud/components/notificacao.dart';
import 'package:flutter_crud/models/usuario.dart';
import 'package:flutter_crud/provider/usuariosProvider.dart';
import 'package:provider/provider.dart';

class UserEditForm extends StatelessWidget {
  UserEditForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};

  final List<String> _icones = [
    'https://cdn.pixabay.com/photo/2016/04/01/11/25/avatar-1300331_1280.png',
    'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295429_960_720.png',
    'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295430_1280.png',
    'https://cdn.pixabay.com/photo/2013/07/12/19/15/gangster-154425_960_720.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png',
    'https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407_1280.png',
    'https://cdn.pixabay.com/photo/2022/09/23/06/09/man-7473745_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/04/20/07/59/woman-6193184_1280.jpg',
    'https://cdn.pixabay.com/photo/2023/06/23/11/23/ai-generated-8083323_1280.jpg',
    'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png',
  ];

  void _loadFormData(Usuario user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['email'] = user.email;
      _formData['numero'] = user.numero;
      _formData['icone'] = user.icone;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Usuario user = ModalRoute.of(context)!.settings.arguments as Usuario;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar usuário"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_form.currentState!.validate()) {
                _form.currentState!.save();

                Provider.of<Users>(context, listen: false).put(Usuario(
                  id: _formData['id'] ?? '',
                  nome: _formData['nome'] ?? '',
                  email: _formData['email'] ?? '',
                  numero: _formData['numero'] ?? '',
                  icone: _formData['icone'] ?? '',
                ));

                Navigator.of(context).pop();
                Notify.show(context, 'Usuário editado com sucesso!');
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um email.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['numero'],
                decoration: const InputDecoration(labelText: 'Número de telefone'),
                validator: (value) {
                  if (value?.length != 11) {
                    return 'Número inválido.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['numero'] = value,
              ),
              const SizedBox(height: 20),
              const Text('Selecione um Avatar:', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 10,
                children: _icones.map((url) {
                  return GestureDetector(
                    onTap: () => _formData['icone'] = url,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(url),
                      radius: 30,
                      child: _formData['icone'] == url
                          ? const Icon(Icons.check, color: Colors.black)
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
