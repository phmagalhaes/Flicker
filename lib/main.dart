import 'package:flutter/material.dart';
import 'package:projeto03_09_24/pages/Adicionarperfil.dart';
import 'package:projeto03_09_24/pages/buscar.dart';
import 'package:projeto03_09_24/pages/cadastro.dart';
import 'package:projeto03_09_24/pages/catalogo.dart';
import 'package:projeto03_09_24/pages/download.dart';
import 'package:projeto03_09_24/pages/login.dart';
import 'package:projeto03_09_24/pages/perfil.dart';
import 'package:projeto03_09_24/pages/player.dart';
import 'package:projeto03_09_24/pages/selecaoPerfil.dart';
import 'package:projeto03_09_24/pages/splash_screen.dart';
import 'package:projeto03_09_24/shared/style.dart'; 



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
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulBottomGradiente),
        useMaterial3: true, 
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const Login(),
        '/cadastro' : (context) => const Cadastro(),
        '/selecaoPerfil': (context) => const Selecaoperfil(),
        '/splash' : (context) => SplashScreen(),
        '/Adicionarperfil': (context) => Adicionarperfil(),
        '/catalogo': (context) => Catalogo(),
        '/downloads' : (context) => Downloads(),
        '/perfil' : (context) => Perfil(),
        '/buscar': (context) => Buscar(),
        '/player': (context) => YoutubeVideoPage(),
      },
    );
  }
}
