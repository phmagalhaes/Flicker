import 'package:flutter/material.dart';
import 'package:projeto03_09_24/shared/style.dart';

class Selecaoperfil extends StatefulWidget {
  const Selecaoperfil({super.key});

  @override
  State<Selecaoperfil> createState() => _SelecaoperfilState();
}

class _SelecaoperfilState extends State<Selecaoperfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 1],
            colors: [
              MyColors.azulE,
              MyColors.azulGradiente,
              MyColors.azulBottomGradiente,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Quem está assistindo?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 280, // Largura do grid (ajuste conforme necessário)
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2, // Número de colunas
                  crossAxisSpacing: 10, // Espaçamento horizontal
                  mainAxisSpacing: 10, // Espaçamento vertical
                  children: [
                    Image.asset(
                      'assets/img/camilly.png',
                      width: 129,
                      height: 144,
                    ),
                    Image.asset(
                      'assets/img/carol.png',
                      width: 129,
                      height: 144,
                    ),
                    Image.asset(
                      'assets/img/pedro.png',
                      width: 129,
                      height: 144,
                    ),
                    Image.asset(
                      'assets/img/vitoria.png',
                      width: 129,
                      height: 144,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Selecaoperfil(),
  ));
}
