<<<<<<< HEAD
// ignore_for_file: avoid_print, use_key_in_widget_constructors, unused_import, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
=======
// Essas diretivas desabilitam warnings específicos do Dart que podem aparecer nesse código.
// ignore_for_file: avoid_print, use_key_in_widget_constructors, unused_import, library_private_types_in_public_api

// Importa os pacotes necessários para criar a interface e gerenciar estados no Flutter.
import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart'; // Importa o modelo de dados "User".
import 'package:myapp/provider/users.dart'; // Importa o provedor de gerenciamento de usuários.
import 'package:provider/provider.dart'; // Importa o pacote "Provider" para gerenciamento de estado.

/// Define o widget "UserForm" que será um formulário para adicionar ou editar usuários.
class UserForm extends StatefulWidget {
  // Método que cria o estado associado a esse widget.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
  @override
  _UserFormState createState() => _UserFormState();
}

<<<<<<< HEAD
class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String?> _formData = {};


  void _loadFormData(User? user) {
    if (user != null) {
=======
/// Classe responsável por gerenciar o estado do formulário.
class _UserFormState extends State<UserForm> {
  // Chave global para identificar o formulário e permitir validação e salvamento.
  final _form = GlobalKey<FormState>();

  // Mapa para armazenar os dados inseridos no formulário.
  final Map<String, String?> _formData = {};

  // Carrega os dados de um usuário existente para edição, se houver.
  void _loadFormData(User? user) {
    if (user != null) {
      // Preenche o mapa com os dados do usuário existente.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['email'] = user.email;
      _formData['numero'] = user.numero.toString();
      _formData['icone'] = user.icone;
    }
  }

<<<<<<< HEAD
  void _saveForm() {
    final isValid = _form.currentState?.validate() ?? false;

    if (!isValid) return;

    _form.currentState?.save();

    Provider.of<Users>(context, listen: false).put(
      User(
        id: _formData['id'] ?? '',
        nome: _formData['nome'] ?? 'Nome Padrão',
        email: _formData['email'] ?? 'email@padrao.com',
        numero: _formData['numero'] ?? '6231564564',
        icone: _formData['icone'] ?? '',
      ),
    );

    Navigator.of(context).pop();
  }

=======
  // Salva os dados do formulário ao pressionar o botão de salvar.
  void _saveForm() {
    // Valida o formulário (retorna false se alguma validação falhar).
    final isValid = _form.currentState?.validate() ?? false;

    if (!isValid) return; // Não continua se a validação falhar.

    // Salva os valores inseridos no formulário.
    _form.currentState?.save();

    // Atualiza os dados no provedor (lista de usuários).
    Provider.of<Users>(context, listen: false).put(
      User(
        id: _formData['id'] ?? '', // Se o ID não for fornecido, usa uma string vazia.
        nome: _formData['nome'] ?? 'Nome Padrão', // Valor padrão caso o nome esteja vazio.
        email: _formData['email'] ?? 'email@padrao.com', // Valor padrão para o email.
        numero: _formData['numero'] ?? '6231564564', // Número padrão caso não seja preenchido.
        icone: _formData['icone'] ?? '', // Avatar padrão (vazio).
      ),
    );

    // Fecha a tela atual e retorna à tela anterior.
    Navigator.of(context).pop();
  }

  // Método chamado quando o estado do widget é inicializado ou alterado.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

<<<<<<< HEAD
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    _loadFormData(user);
  }

=======
    // Obtém o usuário passado como argumento pela rota.
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    _loadFormData(user); // Carrega os dados do usuário, se houver.
  }

  // Constrói a interface do formulário.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('Formulário de Usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
=======
        title: const Text('Formulário de Usuário'), // Título da tela no AppBar.
        actions: [
          // Botão de salvar no AppBar.
          IconButton(
            icon: const Icon(Icons.save), // Ícone do botão.
            onPressed: _saveForm, // Chama o método _saveForm ao pressionar.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
          ),
        ],
      ),
      body: Padding(
<<<<<<< HEAD
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: const InputDecoration(labelText: 'Nome Completo'),
                validator: (value) {
=======
        padding: const EdgeInsets.all(25), // Adiciona espaçamento em volta do formulário.
        child: Form(
          key: _form, // Associa a chave global ao formulário.
          child: Column(
            children: [
              // Campo para o nome do usuário.
              TextFormField(
                initialValue: _formData['nome'], // Preenche com o valor existente, se houver.
                decoration: const InputDecoration(labelText: 'Nome Completo'), // Rótulo do campo.
                validator: (value) {
                  // Validação do campo (retorna uma mensagem de erro se inválido).
>>>>>>> d2b590c (Descrição das mudanças realizadas)
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido.';
                  }
                  if (value.trim().length <= 2) {
                    return 'Quantidade de caracteres muito baixa.';
                  }
<<<<<<< HEAD
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value,
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
              TextFormField(
                initialValue: _formData['icone'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['icone'] = value,
=======
                  return null; // Retorna null se for válido.
                },
                onSaved: (value) => _formData['nome'] = value, // Salva o valor no mapa _formData.
              ),
              // Campo para o email do usuário.
              TextFormField(
                initialValue: _formData['email'], // Preenche com o valor existente, se houver.
                decoration: const InputDecoration(labelText: 'E-mail'), // Rótulo do campo.
                validator: (value) {
                  // Validação do campo.
                  if (value == null || value.isEmpty) {
                    return 'E-mail inválido.';
                  }
                  return null; // Válido.
                },
                onSaved: (value) => _formData['email'] = value, // Salva o valor no mapa _formData.
              ),
              // Campo para o número de telefone do usuário.
              TextFormField(
                initialValue: _formData['numero'], // Preenche com o valor existente, se houver.
                decoration: const InputDecoration(labelText: 'Número de telefone'), // Rótulo do campo.
                validator: (value) {
                  // Validação do campo (deve ter exatamente 11 caracteres).
                  if (value?.length != 11) {
                    return 'Número inválido.';
                  }
                  return null; // Válido.
                },
                onSaved: (value) => _formData['numero'] = value, // Salva o valor no mapa _formData.
              ),
              // Campo para o URL do avatar do usuário.
              TextFormField(
                initialValue: _formData['icone'], // Preenche com o valor existente, se houver.
                decoration: const InputDecoration(labelText: 'URL do Avatar'), // Rótulo do campo.
                onSaved: (value) => _formData['icone'] = value, // Salva o valor no mapa _formData.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
              ),
            ],
          ),
        ),
      ),
    );
  }
}