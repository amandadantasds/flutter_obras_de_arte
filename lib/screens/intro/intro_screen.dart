import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:obras_de_arte/routes.dart';

// Tela de introdução do app
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // Lista contendo as páginas do tutorial (título, subtítulo e animação)
  final List<Map<String, String>> _pages = [
    {
      'title': 'Bem-vindo ao App',
      'subtitle': 'Aprenda a usar o app passo a passo.',
      'lottie': 'assets/lottie/intro1.json',
    },
    {
      'title': 'Funcionalidades',
      'subtitle': 'Explore as diversas funcionalidades.',
      'lottie': 'assets/lottie/intro2.json',
    },
    {
      'title': 'Comece Agora',
      'subtitle': 'Vamos começar a usar o app!',
      'lottie': 'assets/lottie/intro3.json',
    },
  ];

  // Controlador do PageView para navegar entre as páginas
  final PageController _pageController = PageController();

  // Armazena a página atual exibida
  int _currentPage = 0;

  // Define se o usuário escolheu "não mostrar novamente"
  bool _dontShowAgain = false;

  // Função chamada ao clicar no botão "Avançar"
  void _onNext() {
    // Se ainda não está na última página, vai para a próxima
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Se está na última, finaliza o tutorial
      _finishIntro();
    }
  }

  // Finaliza a introdução e navega para a Home
  _finishIntro() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  // Função chamada ao clicar no botão "Voltar"
  void _onBack() {
    // Só permite voltar se não estiver na primeira página
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se está na última página
    final isLastPage = _currentPage == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Parte principal da tela: o PageView com as páginas do tutorial
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,

                // Atualiza o _currentPage quando o usuário troca de página
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },

                // Constrói cada página da introdução
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // Animação Lottie ocupando o espaço disponível
                        Expanded(child: Lottie.asset(page['lottie']!)),

                        // Título da página
                        Text(
                          page['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        // Subtítulo da página
                        Text(
                          page['subtitle']!,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Checkbox só aparece na última página
            if (isLastPage)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    // Checkbox que marca se o usuário não quer ver a intro novamente
                    Checkbox(
                      value: _dontShowAgain,
                      onChanged: (val) {
                        setState(() {
                          _dontShowAgain = val ?? false;
                        });
                      },
                    ),

                    // Texto ao lado do checkbox
                    Expanded(
                      child: Text('Não mostrar essa introdução novamente.'),
                    ),
                  ],
                ),
              ),

            // Botões "Voltar" e "Avançar / Concluir"
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão "Voltar", mas só aparece a partir da segunda página
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: _onBack,
                      child: Text('Voltar'),
                    )
                  else
                    // Apenas um espaço para manter a posição alinhada
                    SizedBox(width: 80),

                  // Botão "Avançar" ou "Concluir" dependendo da página
                  TextButton(
                    onPressed: _onNext,
                    child: Text(isLastPage ? 'Concluir' : 'Avançar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
