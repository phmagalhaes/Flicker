import 'package:camilly_str/pages/adicionarPerfil.dart';
import 'package:camilly_str/pages/buscar.dart';
import 'package:camilly_str/pages/cadastro.dart';
import 'package:camilly_str/pages/catalogo.dart';
import 'package:camilly_str/pages/downloads.dart';
import 'package:camilly_str/pages/escolhaPerfil.dart';
import 'package:camilly_str/pages/esqueceuSenha.dart';
import 'package:camilly_str/pages/perfil.dart';
import 'package:camilly_str/pages/selecaoPerfil.dart';
import 'package:camilly_str/pages/splashScreen.dart';
import 'package:camilly_str/pages/login.dart';
import 'package:camilly_str/pages/splashScreenGrupo.dart';
import 'package:camilly_str/shared/style.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azul),
        useMaterial3: true,
      ),
      initialRoute: "/downloads",
      routes: {
        "/" : (context) => const Incio(),
        "/login" : (context) => const Login(),
        "/cadastro" : (context) => const Cadastro(),
        "/splashScreenGrupo": (context) => FlickerApp(),
        "/esqueceuSenha": (context) => EsqueceuSenha(),
        "/adicionarPerfil": (context) => Adicionarperfil(),
        "/escolhaPerfil": (context) => Escolhaperfil(),
        "/selecaoPerfil": (context) => Selecaoperfil(),
        "/perfil": (context) => Perfil(),
        "/catalogo": (context) => Catalogo(),
        "/buscar": (context) => Buscar(),
        "/downloads": (context) => Downloads(),
      },
    );
  }
}