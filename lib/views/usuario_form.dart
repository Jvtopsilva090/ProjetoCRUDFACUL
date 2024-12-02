import 'package:flutter/material.dart';
import 'package:flutter_crud/components/notificacao.dart';
import 'package:flutter_crud/models/usuario.dart';
import 'package:flutter_crud/provider/usuariosProvider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

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
    'https://miro.medium.com/v2/resize:fit:2400/1*k38PmUEbJR64Tbdz6sPNjA.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar usuário"),
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
                Notify.show(context, 'Usuário criado com sucesso!');
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
                decoration:
                    const InputDecoration(labelText: 'Número de telefone'),
                validator: (value) {
                  if (value?.length != 11) {
                    return 'Número inválido.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['numero'] = value,
              ),
              const SizedBox(height: 20),
              const Text('Selecione um Avatar:',
                  style: TextStyle(fontSize: 16)),
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
