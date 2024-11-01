import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart'; // Importe sua tela de login

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isImageVisible = false;

  @override
  void initState() {
    super.initState();

    // Inicializa o controlador da animação
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define a animação de escala
    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Inicia a animação da imagem
    _controller.forward().whenComplete(() {
      setState(() {
        _isImageVisible = true; // Torna a imagem visível
      });
      // Move a imagem para cima após 1 segundo
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 95, 176),
      body: Stack(
        children: [
          Center(
            child: Lottie.asset('assets/animacao/carregando2.json'), // Animação Lottie
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: _isImageVisible ? 100 : MediaQuery.of(context).size.height / 2 - 50, // Ajuste conforme necessário
            left: MediaQuery.of(context).size.width / 2 - 50, // Centraliza horizontalmente
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/img/logo.png',
                width: 100, // Ajuste conforme necessário
                height: 100, // Ajuste conforme necessário
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
