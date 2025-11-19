import 'package:flutter/material.dart';
import 'welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoScale = 1.0;
  double _logoPosition = 0.0;
  String _displayTitle = "";
  String _displaySubtitle = "";
  // ignore: unused_field
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() async {
    // 1. Logo cresce suavemente
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _logoScale = 1.3;
    });

    // 2. Logo vai para esquerda mais suavemente
    await Future.delayed(const Duration(milliseconds: 500));
    for (double i = 0; i <= 1; i += 0.1) {
      if (!mounted) break;
      await Future.delayed(const Duration(milliseconds: 30));
      setState(() {
        _logoPosition = -0.30 * i; 
      });
    }

    // 3. Efeito de digitação do título
    await Future.delayed(const Duration(milliseconds: 500));
    const titleText = "LuxDrive";
    for (int i = 0; i < titleText.length; i++) {
      if (!mounted) break;
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _displayTitle = titleText.substring(0, i + 1);
      });
    }

    // 4. Efeito de digitação do subtítulo (mais rápido)
    await Future.delayed(const Duration(milliseconds: 200));
    const subtitleText = "ir além é nosso ponto de partida";
    for (int i = 0; i < subtitleText.length; i++) {
      if (!mounted) break;
      await Future.delayed(const Duration(milliseconds: 30)); 
      setState(() {
        _displaySubtitle = subtitleText.substring(0, i + 1);
      });
    }

    // 5. Marca animação completa
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _animationCompleted = true;
      });
    }

    // 6. Vai para WelcomePage depois de 5 segundos totais
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF191919),
      body: Stack(
        children: [
          // LOGO
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            left: (screenWidth / 2 - 45) + (_logoPosition * screenWidth),
            top: screenHeight / 2 - 40,
            child: AnimatedScale(
              scale: _logoScale,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              child: Image.asset(
                "assets/images/LogoLux.png",
                height: 80,
                width: 80,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBEA264),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.directions_car,
                      color: Colors.white,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),

          // TÍTULO E SUBTÍTULO
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: screenWidth * 0.30,
            top: screenHeight / 2 - 40,
            child: AnimatedOpacity(
              opacity: _displayTitle.isNotEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, 
                children: [
                  // TÍTULO
                  Text(
                    _displayTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 65,
                      fontFamily: 'MinionPro',
                      height: 0.8, 
                    ),
                  ),

                  // SUBTÍTULO 
                  if (_displaySubtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2), 
                      child: Text(
                        _displaySubtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                          fontFamily: 'CenturyGothic',
                          height: 1.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}