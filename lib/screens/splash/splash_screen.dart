import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:obras_de_arte/routes.dart';

// Tela inicial exibida quando o app abre
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Aguarda 3 segundos antes de trocar para a próxima tela
    Future.delayed(Duration(seconds: 3), () {
      // Verifica se o widget ainda está montado na tela
      if (!mounted) return;

      // Navega para a tela de introdução e remove a splash da pilha
      Navigator.pushReplacementNamed(context, Routes.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Centraliza o conteúdo no meio da tela
      body: Center(
        // Exibe a animação Lottie do splash
        child: Lottie.asset(
          'assets/lottie/splash.json',
          width: 200,          // largura da animação
          height: 200,         // altura da animação
          fit: BoxFit.contain, // garante que a animação caiba sem cortar
        ),
      ),
    );
  }
}
