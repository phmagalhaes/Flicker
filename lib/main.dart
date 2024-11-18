import 'package:flicker/pages/buscar.dart';
import 'package:flicker/pages/cadastro.dart';
import 'package:flicker/pages/catalogo.dart';
import 'package:flicker/pages/configPerfil.dart';
import 'package:flicker/pages/downloads.dart';
import 'package:flicker/pages/filmes/filme1.dart';
import 'package:flicker/pages/filmes/filme2.dart';
import 'package:flicker/pages/filmes/filme3.dart';
import 'package:flicker/pages/filmes/filme4.dart';
import 'package:flicker/pages/filmes/filme5.dart';
import 'package:flicker/pages/home.dart';
import 'package:flicker/pages/login.dart';
import 'package:flicker/pages/splashScreenGeral.dart';
import 'package:flicker/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreenGeral(),
        '/login': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
        '/home': (context) => const Home(),
        '/catalogo': (context) => const Catalogo(),
        '/perfil': (context) => const ConfigPerfil(),
        '/buscar': (context) => const Buscar(),
        '/downloads': (context) => const Downloads(),

        // filmes
        '/filme1': (context) => const Filme1(),
        '/filme2': (context) => const Filme2(),
        '/filme3': (context) => const Filme3(),
        '/filme4': (context) => const Filme4(),
        '/filme5': (context) => const Filme5(),
      },
    );
  }
}
