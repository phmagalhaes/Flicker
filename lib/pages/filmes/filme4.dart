import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Filme4 extends StatefulWidget {
  const Filme4({super.key});

  @override
  State<Filme4> createState() => _Filme4State();
}

class _Filme4State extends State<Filme4> {
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

  // Função para exibir a notificação
  void _showNotification(BuildContext context, String message, IconData icon, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: MyColors.azulEscuro,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 50,
              ),
              const SizedBox(height: 10),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: MyColors.azulEscuro,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Fechar"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.azul,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(color: MyColors.azul),
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
                child: Image.asset('assets/img/filmes/monstros2.png'),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text("Assistir"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.azulClaro,
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
                        _showNotification(
                          context,
                          "Download iniciado!",
                          Icons.download_done, 
                          Colors.blue, 
                        );
                      },
                      icon: const Icon(Icons.download, color: Colors.white),
                      label: const Text("Baixar"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.azulClaro,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30,
                    ),
                    onPressed: () {
                      _showNotification(
                        context,
                        "Filme adicionado aos favoritos!",
                        Icons.check_circle,
                        Colors.green,
                      ); 
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _showNotification(
                        context,
                        "Filme adicionado à lista!",
                        Icons.add_circle,
                        Colors.white,
                      ); 
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      _showNotification(
                        context,
                        "Filme removido da lista!",
                        Icons.cancel,
                        Colors.red,
                      ); 
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "L   2001   Aventura/Comédia   1h32min   HD",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Na maior fábrica de monstros do mundo, James Sullivan, um monstro azul com chifres, e seu amigo Mike, um monstro verde de um olho só, têm a missão de assustar crianças, consideradas tóxicas pelos monstros. Porém, tudo muda quando a menina Boo, do mundo humano, acidentalmente entra no mundo dos monstros, transformando suas vidas.    ",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Text(
                "Direção: Pete Docter, David Silverman, Lee Unkrich",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 5),
              const Text(
                "Elenco:  John Goodman, Billy Crystal, Steve Buscemi",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                "Títulos populares",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/img/filmes/dragao.png',
                      height: 120,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/img/filmes/frozen.png',
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