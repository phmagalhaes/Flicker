import 'package:flutter/material.dart';
import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/pages/catalogo.dart';
import 'package:camilly_str/shared/style.dart';

class Buscar extends StatefulWidget {
  const Buscar({super.key});

  @override
  State<Buscar> createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  int _selectedIndex = 1;

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
    {
      'title': 'Encanto',
      'image': 'assets/img/filmes/encanto.png',
      'reproducaoImage': 'assets/img/filmes/encanto2.png',
      'description':
          'Uma menina colombiana pode ser a última esperança de sua família quando descobre que a magia que envolve o Encanto, um lugar que abençoa crianças com dons únicos, está em perigo.',
      'year': '2021',
      'ageRating': 'L',
      'duration': '1h49min'
    },
    {
      'title': 'Como perder um Homem em 10 dias',
      'image': 'assets/img/filmes/homem.png',
      'reproducaoImage': 'assets/img/filmes/homem2.png',
      'description':
          'Ao precisar de um relacionamento em 10 dias para escrever um artigo, a jornalista escolhe Ben, que, por uma aposta no trabalho, precisa fazer ela se apaixonar por ele.',
      'year': '2003',
      'ageRating': 'A12',
      'duration': '1h50min'
    },
    {
      'title': 'Frozen: Uma Aventura Congelante',
      'image': 'assets/img/filmes/frozen.png',
      'reproducaoImage': 'assets/img/filmes/frozen2.png',
      'description':
          'Acompanhada por um vendedor de gelo, a jovem e destemida princesa Anna parte em uma jornada por perigosas montanhas de gelo na esperança de encontrar sua irmã, a rainha Elsa, e acabar com a terrível maldição de inverno eterno, que está provocando o congelamento do reino.',
      'year': '2013',
      'ageRating': 'L',
      'duration': '1h42min'
    },
    {
      'title': 'Como Treinar Seu Dragão 3',
      'image': 'assets/img/filmes/dragao.png',
      'reproducaoImage': 'assets/img/filmes/dragao2.png',
      'description':
          'Soluço busca realizar seu grande sonho de encontrar um lar pacífico onde os dragões possam viver em segurança. Lá, Banguela descobre uma companheira, assim como ele, mas um tanto selvagem. Mas é quando o perigo começa a rondar o lar, que a dupla Banguela e Soluço é testada e precisa tomar decisões difíceis para salvar suas espécies.',
      'year': '2019',
      'ageRating': 'L',
      'duration': '1h44min'
    },
  ];

  List<Map<String, String>> _filmesFiltrados = [];
  String _query = "";

  @override
  void initState() {
    super.initState();
    _filmesFiltrados = _filmes;
  }

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


  void _buscarFilmes(String query) {
    setState(() {
      _query = query;
      _filmesFiltrados = _filmes
          .where((filme) =>
              filme['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.azul,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Catalogo()),
                    );
                  },
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                      hintText: "Busque por filmes, séries...",
                      hintStyle: TextStyle(
                          color: Colors.white54, fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: MyColors.azulEscuro.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: _buscarFilmes,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  if (_query.isEmpty)
                    const Text(
                      "Recomendados",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 15),
                  if (_filmesFiltrados.isEmpty)
                    const Text(
                      "Nenhum filme encontrado.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  else
                    Column(
                      children: _filmesFiltrados.map((filme) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(filme['image']!),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Image.asset(
                                      "assets/img/play.png",
                                      width: 28,
                                      height: 28,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            filme['title']!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                          ),
                                          onPressed: () => _showFilmDetails(filme),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
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

  void _showFilmDetails(Map<String, String> filme) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilmDetailPage(filme),
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

class FilmDetailPage extends StatelessWidget {
  final Map<String, String> filme;

  const FilmDetailPage(this.filme);

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
                SizedBox(height: 20,),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Buscar()));
                  },
                ),
                Image.asset(filme['reproducaoImage']!),
                const SizedBox(height: 20),
                // Text(
                //   filme['title']!,
                //   style: const TextStyle(
                //       color: Colors.white,
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold),
                // ),
                const SizedBox(height: 10),
                            Center(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/player');
                                },
                                icon: const Icon(Icons.play_arrow,
                                    color: Colors.white),
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
                                icon: const Icon(Icons.download,
                                    color: Colors.white),
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
                            ),
                            const SizedBox(height: 10),
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
                            SizedBox(height: 15,),
                            Text(
                              ' ${filme!['year']} | Classificação: ${filme!['ageRating']} | Duração: ${filme!['duration'] } | HD',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10,),
                Text(
                  filme['description']!,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16, height: 1.5),
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
