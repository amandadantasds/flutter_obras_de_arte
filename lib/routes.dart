// Importa a biblioteca principal do Flutter para widgets, temas, etc.
import 'package:flutter/material.dart';

// Importa a tela Home para poder navegar até ela.
import 'package:obras_de_arte/screens/home/home_screen.dart';

// Importa a tela de introdução.
import 'package:obras_de_arte/screens/intro/intro_screen.dart';

// Importa a tela de splash (tela inicial).
import 'package:obras_de_arte/screens/splash/splash_screen.dart';


// Classe que centraliza e gerencia todas as rotas do app.
class Routes {

  // Nome da rota inicial (raiz do app).
  static const String splash = '/';

  // Nome da rota da tela de introdução.
  static const String intro = '/intro';

  // Nome da rota da tela inicial do aplicativo.
  static const String home = '/home';


  // Função responsável por gerar as rotas com base no nome solicitado.
  // Ela é chamada automaticamente pelo Flutter quando Navigator.pushNamed() é usado.
  static Route<dynamic> generateRoute(RouteSettings settings) {

    // Verifica qual rota foi pedida.
    switch (settings.name) {

      // Se o nome da rota for '/', abre a SplashScreen.
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      // Se o nome for '/intro', abre a IntroScreen.
      case intro:
        return MaterialPageRoute(builder: (_) => IntroScreen());

      // Se o nome for '/home', abre a HomeScreen.
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      // Caso tente acessar uma rota que não existe:
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota não encontrada!'), // Mensagem de erro.
            ),
          ),
        );
    }
  }
}
