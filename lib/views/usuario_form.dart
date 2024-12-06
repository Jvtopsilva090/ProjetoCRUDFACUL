import 'package:flutter/material.dart';
import 'package:flutter_crud/components/notificacao.dart';
import 'package:flutter_crud/models/icones.dart';
import 'package:flutter_crud/models/usuario.dart';
import 'package:flutter_crud/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<StatefulWidget> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, Object?> _formData = {};

  final List<Icone> _icones = Icone.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CRIAR USUÁRIO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_form.currentState!.validate()) {
                _form.currentState!.save();

                Provider.of<Users>(context, listen: false).put(Usuario(
                  nome: _formData['nome'].toString(),
                  email: _formData['email'].toString(),
                  numero: _formData['numero'].toString(),
                  icone: _formData['icone'].toString(),
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
              //LISTA DE ICONES
              Container(
                margin: const EdgeInsets.only(bottom: 10,),
                height: 150,
                child: ListView.separated(
                  itemCount: _icones.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: 30,),
                  itemBuilder: (context, index) {
                    Icone icone = _icones.elementAt(index);
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
                                color: _formData['icone'].toString() == icone.dir
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
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'NOME'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-MAIL'),
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
                    const InputDecoration(labelText: 'NÚMERO DE TELEFONE'),
                validator: (value) {
                  if (value!.length != 11) {
                    return 'Número inválido.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['numero'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
