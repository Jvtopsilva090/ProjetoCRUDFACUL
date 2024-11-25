<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:myapp/data/dbconnector.dart';
import 'package:myapp/models/usuario.dart';
import 'package:myapp/provider/users.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/view/user_form.dart';
import 'package:myapp/view/user_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart'; // Para manipular a barra de status

void main() async {
=======
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
// Conexão com o banco de dados (caso necessário).
// Modelo de usuário.
import 'package:myapp/provider/users.dart'; // Provider para gerenciamento de usuários.
import 'package:myapp/routes/app_routes.dart'; // Rotas do aplicativo.
import 'package:myapp/view/user_form.dart'; // Tela de formulário de usuário.
import 'package:myapp/view/user_list.dart'; // Tela de lista de usuários.
import 'package:provider/provider.dart'; // Para gerenciar o estado com o Provider.
import 'package:flutter/services.dart'; // Para manipular a barra de status.

void main() async {
  // Inicializa o aplicativo.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
  runApp(MyApp());
}

// Classe principal do aplicativo.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configuração da barra de status antes de o aplicativo iniciar.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Torna a barra de status transparente.
        statusBarIconBrightness: Brightness.light, // Define os ícones da barra de status como claros.
      ),
    );

    // Configuração de múltiplos Providers.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(), // Provider para gerenciar a lista de usuários.
        ),
      ],
      child: MaterialApp(
<<<<<<< HEAD
        debugShowCheckedModeBanner: false,
=======
        debugShowCheckedModeBanner: false, // Remove o banner de debug do canto superior direito.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
        theme: ThemeData(
          brightness: Brightness.dark, // Define o tema como escuro.
          scaffoldBackgroundColor: Colors.black, // Define o fundo padrão como preto.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, // Cor base do esquema de cores (roxo profundo).
            brightness: Brightness.dark, // Garante que o esquema seja consistente no tema escuro.
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.purpleAccent, // Define a cor padrão do texto como roxo claro.
            ),
          ),
          useMaterial3: true, // Habilita o uso de Material Design 3.
        ),
        routes: {
<<<<<<< HEAD
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
=======
          // Configuração das rotas do aplicativo.
          AppRoutes.HOME: (_) => UserList(), // Rota para a tela de lista de usuários.
          AppRoutes.USER_FORM: (_) => UserForm(), // Rota para a tela de formulário de usuário.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
        },
      ),
    );
  }
}