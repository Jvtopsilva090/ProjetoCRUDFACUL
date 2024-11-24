// ignore_for_file: avoid_print, use_key_in_widget_constructors, unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};


  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  void _saveForm() {
    final isValid = _form.currentState?.validate() ?? false;

    if (!isValid) return;

    _form.currentState?.save();

    Provider.of<Users>(context, listen: false).put(
      User(
        id: _formData['id'] ?? '',
        name: _formData['name'] ?? 'Nome Padrão',
        email: _formData['email'] ?? 'email@padrao.com',
        avatarUrl: _formData['avatarUrl'] ?? '',
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context)!.settings.arguments as User?;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome Completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido.';
                  }
                  if (value.trim().length <= 2) {
                    return 'Quantidade de caracteres muito baixa.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-mail inválido.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}