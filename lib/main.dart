import 'package:flicker/pages/cadastro.dart';
import 'package:flicker/pages/home.dart';
import 'package:flicker/pages/login.dart';
import 'package:flicker/pages/splashScreenGeral.dart';
import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';


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
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulEscuro),
        useMaterial3: true,
        
      ),
      initialRoute: "/login",
      routes: {
        '/': (context) => const SplashScreenGeral(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        '/home' : (context) => const Home()
      },
    );
  }
}


