import 'package:flutter/material.dart';
import 'package:obras_de_arte/screens/home/home_screen.dart';
import 'package:obras_de_arte/screens/intro/intro_screen.dart';
import 'package:obras_de_arte/screens/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case intro:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  Scaffold(body: Center(child: Text('Rota não encontrada!'))),
        );
    }
  }
}
