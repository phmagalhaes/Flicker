import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/pages/catalogo.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  int _selectedIndex = 2;

  final List<Map<String, String>> _filmes = [
    {
      'title': 'Monstros S.A.',
      'image': 'assets/img/filmes/monstro.png',
      'reproducaoImage': 'assets/img/filmes/monstros2.png',
      'description':
          'Na maior fábrica de monstros do mundo, James Sullivan, um monstro azul com chifres, e seu amigo Mike, um monstro verde de um olho só, têm a missão de assustar crianças, consideradas tóxicas pelos monstros. Porém, tudo muda quando a menina Boo, do mundo humano, acidentalmente entra no mundo dos monstros, transformando suas vidas. ',
      'year': '2001',
      'ageRating': 'L',
      'duration': '1h32min'
    },
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Catalogo()));
                  },
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Downloads",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 34),
            Row(
              children: [
                Container(
                  width: 170,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/img/filmes/monstro.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: MyColors.azulEscuro,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FilmDetailPage(_filmes[0]),
                          ),
                        );
                      },
                      child: Text(
                        _filmes[0]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/player");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class FilmDetailPage extends StatelessWidget {
  final Map<String, String> filme;

  const FilmDetailPage(this.filme, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.azulEscuro,
      body: Container(
        decoration: const BoxDecoration(color: MyColors.azul),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                Image.asset(filme['reproducaoImage']!),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/player");
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
                ),
                const SizedBox(height: 5),
                Center(
                  child: ElevatedButton.icon(
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
                ),const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                Text(
                  '${filme['year']} | Classificação: ${filme['ageRating']} | Duração: ${filme['duration']} | HD',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  filme['description']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
