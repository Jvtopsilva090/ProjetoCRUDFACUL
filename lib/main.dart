import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffBD93F9),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}