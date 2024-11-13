import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/pages/catalogo.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Buscar extends StatefulWidget {
  const Buscar({super.key});

  @override
  State<Buscar> createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/catalogo');
        break;
      case 1:
        Navigator.pushNamed(context, '/buscar');
        break;
      case 2:
        Navigator.pushNamed(context, '/downloads');
        break;
      case 3:
        Navigator.pushNamed(context, '/perfil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.azul,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Catalogo() ));
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Busque por filmes,séries,reality...",
                          ),
                        )
                      ],
                    ),
                    Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recomendados",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        Image.asset("assets/img/filmes/dragao.png"),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Image.asset(
                            "assets/img/play.png",
                            width: 28, // ajuste o tamanho conforme necessário
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      children: [
                        Image.asset("assets/img/filmes/frozen.png"),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Image.asset(
                            "assets/img/play.png",
                            width: 28, // ajuste o tamanho conforme necessário
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      children: [
                        Image.asset("assets/img/filmes/encanto.png"),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Image.asset(
                            "assets/img/play.png",
                            width: 28, // ajuste o tamanho conforme necessário
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      children: [
                        Image.asset("assets/img/filmes/homem.png"),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Image.asset(
                            "assets/img/play.png",
                            width: 28, // ajuste o tamanho conforme necessário
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      children: [
                        Image.asset("assets/img/filmes/monstro.png"),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Image.asset(
                            "assets/img/play.png",
                            width: 28, // ajuste o tamanho conforme necessário
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}