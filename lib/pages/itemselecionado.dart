import 'package:projeto03_09_24/components/navbar.dart';
import 'package:projeto03_09_24/shared/style.dart';
import 'package:flutter/material.dart';

class Filme5 extends StatefulWidget {
  const Filme5({super.key});

  @override
  State<Filme5> createState() => _Filme5State();
}

class _Filme5State extends State<Filme5> {
  int _selectedIndex = 0;

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
      backgroundColor: MyColors.azulBottomGradiente,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(color: MyColors.azulGradiente),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/img/selecionado.png'),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Ação para assistir
                      },
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text("Assistir"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.azulE,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(300, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Ação para baixar
                      },
                      icon: const Icon(Icons.download, color: Colors.white),
                      label: const Text("Baixar"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.azulE,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(300, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 30),
                  SizedBox(width: 20),
                  Icon(Icons.add_circle, color: Colors.white, size: 30),
                  SizedBox(width: 20),
                  Icon(Icons.cancel, color: Colors.red, size: 30),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "12   2003   Romance/Comédia   1h50min   HD",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ao precisar de um relacionamento em 10 dias para escrever um artigo, a jornalista escolhe Ben, que, por uma aposta no trabalho, precisa fazer ela se apaixonar por ele.",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Text(
                "Direção: Donald Petrie",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 5),
              const Text(
                "Elenco: Kate Hudson, Matthew McConaughey, Adam Goldberg",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Bloco ajustado: Títulos populares
              const Text(
                "Títulos populares",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre o título e as imagens
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Alinha as imagens à esquerda
                crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento vertical
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/img/filmesemelhante1.png',
                      height: 120,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10), // Espaçamento entre as imagens
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/img/filmesemelhante2.png' ,
                      height: 120,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
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
