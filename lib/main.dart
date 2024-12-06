import 'package:flutter/material.dart';
import 'package:flutter_crud/data/default_users.dart';
import 'package:flutter_crud/data/user_manager.dart';
import 'package:flutter_crud/provider/usuarios_provider.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/lista_de_usuarios.dart';
import 'package:flutter_crud/views/usuario_edit.dart';
import 'package:flutter_crud/views/usuario_form.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  for (var usuario in defaultUsers) {UserManager().inserirUsuario(usuario);}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:
        false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor:
          Colors.black,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffBD93F9),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => const HomePage(),
          AppRoutes.USER_FORM: (_) => const UserForm(),
          AppRoutes.USER_EDIT_FORM: (_) => const UserEditForm(),
        },
      ),
    );
  }
}