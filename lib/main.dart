// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart'; // Importa os widgets principais do Flutter.
import 'package:flutter_crud/provider/usuariosProvider.dart'; // Importa o provedor de usuários.
import 'package:flutter_crud/routes/app_routes.dart'; // Importa as rotas definidas para navegação.
import 'package:flutter_crud/views/usuario_edit.dart'; // Importa a página de edição de usuário.
import 'package:flutter_crud/views/usuario_form.dart'; // Importa a página de formulário de usuário.
import 'package:flutter_crud/views/usuario.dart'; // Importa a página principal de usuários.
import 'package:provider/provider.dart'; // Importa o pacote para gerenciar estado com o Provider.

void main() {
  runApp(const MyApp()); // Inicia o aplicativo com a classe `MyApp`.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor da classe `MyApp`.

  @override
  Widget build(BuildContext context) {
    // Define a estrutura principal do aplicativo.
    return MultiProvider(
      providers: [
        // Define os provedores para gerenciar estados globais.
        ChangeNotifierProvider(
          create: (ctx) => Users(), // Cria uma instância do gerenciador de usuários.
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: 
            false, // Remove o banner de "Debug" do canto superior direito.
        theme: ThemeData(
          brightness: Brightness.dark, // Define o tema como escuro.
          scaffoldBackgroundColor: 
              Colors.black, // Define a cor de fundo padrão como preto.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, // Define a cor base do tema como roxo profundo.
            brightness: Brightness.dark, // Garante a consistência do tema escuro.
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.purpleAccent, // Define a cor padrão do texto como roxo claro.
            ),
          ),
          useMaterial3: true, // Habilita o uso do Material Design 3.
        ),
        routes: {
          // Define as rotas para navegação no aplicativo.
          AppRoutes.HOME: (_) => const UsersHomePage(), // Página inicial de usuários.
          AppRoutes.USER_FORM: (_) => UserForm(), // Página de criação de usuário.
          AppRoutes.USER_EDIT_FORM: (_) => UserEditForm(), // Página de edição de usuário.
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Define um widget de estado para gerenciar mudanças.
  const MyHomePage({super.key, required this.title}); // Construtor com um título como parâmetro.

  final String title; // Propriedade para armazenar o título da página.

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Cria o estado da página inicial.
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Variável para contar o número de cliques.

  void _incrementCounter() {
    // Função para incrementar o contador.
    setState(() {
      // Atualiza o estado do widget.
      _counter++; // Incrementa o contador em 1.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface da página.
    return Scaffold(
      appBar: AppBar(
        // Barra de navegação superior.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Cor da AppBar baseada no tema.
        title: Text(widget.title), // Exibe o título da página.
      ),
      body: Center(
        // Centraliza o conteúdo no meio da tela.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente.
          children: <Widget>[
            const Text(
              // Texto fixo que informa sobre a quantidade de cliques.
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', // Exibe o valor do contador.
              style: Theme.of(context).textTheme.headlineMedium, // Estilo do texto baseado no tema.
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Botão flutuante no canto inferior direito.
        onPressed: _incrementCounter, // Ação do botão: chama a função de incremento.
        tooltip: 'Increment', // Tooltip exibido ao manter o cursor sobre o botão.
        child: const Icon(Icons.add), // Ícone de adição no botão.
      ),
    );
  }
}
