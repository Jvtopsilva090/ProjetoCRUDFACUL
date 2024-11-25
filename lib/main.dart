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
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Remove ou altera a cor da barra de status antes de rodar o app
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Torna a faixa de status transparente
        statusBarIconBrightness: Brightness.light, // Cor dos ícones da barra de status (opcional)
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark, // Define o tema escuro
          scaffoldBackgroundColor: Colors.black, // Fundo preto
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark, // Garante a consistência no tema escuro
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.purpleAccent, // Letras roxas
            ),
          ),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}