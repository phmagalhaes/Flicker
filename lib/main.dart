import 'package:carol_str/pages/adicionarPerfil.dart';
import 'package:carol_str/pages/buscar.dart';
import 'package:carol_str/pages/cadastro.dart';
import 'package:carol_str/pages/catalogo.dart';
import 'package:carol_str/pages/confPerfil.dart';
import 'package:carol_str/pages/dowload.dart';
import 'package:carol_str/pages/escolhaPerfil.dart';
import 'package:carol_str/pages/esqueceuSenha.dart';
import 'package:carol_str/pages/login.dart';
import 'package:carol_str/pages/selecaoPerfil.dart';
import 'package:carol_str/pages/selecionadoEncanto.dart';
import 'package:carol_str/pages/selecionadoFrozen.dart';
import 'package:carol_str/pages/style.dart';
import 'package:carol_str/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:carol_str/pages/dowload.dart';
import 'package:carol_str/pages/itemSelecionado.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azul),
      ),
      
        initialRoute: "/selecionadoFrozen",
        routes: {
          '/': (context) => const Login(),
          '/cadastro' : (context) => const Cadastro(),
          '/splash' : (context) => SplashScreen(),
          '/perfil' : (context) => Perfil(),
          '/downloads' : (context) => Downloads(),
          '/adicionarPerfil' : (context) => const Adicionarperfil(),
          '/escolhaPerfil' : (context) => const Escolhaperfil(),
          '/esqueceuSenha' : (context) => const EsqueceuSenha(),
          '/selecaoPerfil' : (context) => const Selecaoperfil(),
          '/catalogo' : (context) => const Catalogo(),
          '/buscar': (context) => const Buscar(),
          '/itemSelecionado': (context) => Homem(),
          '/selecionadoEncanto': (context) => Encanto(),
          '/selecionadoFrozen': (context) => Frozen()
        },
    );
  }
}
