import 'dart:async';
import 'package:flutter/material.dart';
// Importe a próxima tela para onde deseja navegar

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar para a tela principal após 3 segundos
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home'); // Usa a rota '/home'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFE171BA), // Fundo rosa para combinar com o tema
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Aroma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sedan',
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 3,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            // Imagem do personagem
            CircleAvatar(
              radius: 250, // Ajuste o tamanho conforme necessário
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/imgSplash.png', // Caminho da imagem
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Texto "Aroma Caseiro"

            const Text(
              'Caseiro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sedan',
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 3,
                    color: Colors.black26,
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
