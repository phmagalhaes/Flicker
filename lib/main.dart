import 'package:flutter/material.dart';
import 'package:projeto03_09_24/pages/cadastro.dart';
import 'package:projeto03_09_24/pages/login.dart';
import 'package:projeto03_09_24/pages/selecaoPerfil.dart';
import 'package:projeto03_09_24/pages/splash_screen.dart';
import 'package:projeto03_09_24/shared/style.dart'; // Import correto do arquivo de estilos

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary, // Utilizando a fonte definida corretamente
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulE),
        useMaterial3: true, 
      ),
      initialRoute: "/splash",
      routes: {
        '/': (context) => const Login(),
        '/cadastro' : (context) => const Cadastro(),
        '/selecaoPerfil': (context) => const Selecaoperfil(),
        '/splash' : (context) => SplashScreen(),
      },
    );
  }
}
