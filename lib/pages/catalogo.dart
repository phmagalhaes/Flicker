import 'dart:async';
import 'package:projeto03_09_24/components/navbar.dart';
import 'package:projeto03_09_24/shared/style.dart';
import 'package:flutter/material.dart';

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  List<String> images = [
    'assets/img/interestelar.png',
    'assets/img/minions.png',
    'assets/img/venom.png',
    'assets/img/avatar.png',
    'assets/img/aladin.png',
  ];
  int _currentIndex = 0;
  late Timer _timer;

  final List<Map<String, dynamic>> continuarAssistindo = [
    {
      // 'title': 'Frozen: Uma Aventura Congelante',
      'image': 'assets/img/filmes/image-5.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoFrozen.png',
      'description':
      'Acompanhada por um vendedor de gelo, a jovem e destemida princesa Anna parte em uma jornada por perigosas montanhas de gelo na esperança de encontrar sua irmã, a rainha Elsa, e acabar com a terrível maldição de inverno eterno, que está provocando o congelamento do reino.',
      'year': '2013',
      'direcao': 'Direção: Donald Petrie',
      'elenco': 'Elenco: Kate Hudson, Matthew McConaughey, Adam Goldberg',
      'ageRating': 'L',
      'duration': '1h42min'
    },
    {
      // 'title': 'Como Treinar Seu Dragão 3',
      'image': 'assets/img/filmes/image-1.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoDragao.png',
      'description':
      'Soluço busca realizar seu grande sonho de encontrar um lar pacífico onde os dragões possam viver em segurança. Lá, Banguela descobre uma companheira, assim como ele, mas um tanto selvagem. Mas é quando o perigo começa a rondar o lar, que a dupla Banguela e Soluço é testada e precisa tomar decisões difíceis para salvar suas espécies.',
      'year': '2019',
      'direcao': 'Direção: Dean DeBlois',
      'elenco': 'Elenco: Jay Baruchel, America Ferrera, F. Murray Abraham',
      'ageRating': 'L',
      'duration': '1h44min'
    },
  ];

  final List<Map<String, dynamic>> populares = [
    {
      // 'title': 'Monstros S.A.',
      'image': 'assets/img/filmes/image-2.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoMonstrosSA.png',
      'description':
      'Na maior fábrica de monstros do mundo, James Sullivan, um monstro azul com chifres, e seu amigo Mike, um monstro verde de um olho só, têm a missão de assustar crianças, consideradas tóxicas pelos monstros. Porém, tudo muda quando a menina Boo, do mundo humano, acidentalmente entra no mundo dos monstros, transformando suas vidas. ',
      'year': '2001',
      'direcao': 'Direção: Pete Docter, David Silverman, Lee Unkrich',
      'elenco': 'Elenco: John Goodman, Billy Crystal, Steve Buscemi',
      'ageRating': 'L',
      'duration': '1h32min'
    },
    {
      // 'title': 'Encanto',
      'image': 'assets/img/filmes/image-3.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoEncanto.png',
      'description':
      'Uma menina colombiana pode ser a última esperança de sua família quando descobre que a magia que envolve o Encanto, um lugar que abençoa crianças com dons únicos, está em perigo.',
      'year': '2021',
      'direcao': 'Direção: Byron Howard, Jared Bush',
      'elenco': 'Elenco: Isabela Madrigal, Bruno Madrigal, Julieta Madrigal, Pepa Madrigal',
      'ageRating': 'L',
      'duration': '1h49min'
    },
    {
      // 'title': 'Como perder um Homem em 10 dias',
      'image': 'assets/img/filmes/image-4.png',
      'reproducaoImage': 'assets/img/filmes/selecionado.png',
      'description':
      'Ao precisar de um relacionamento em 10 dias para escrever um artigo, a jornalista escolhe Ben, que, por uma aposta no trabalho, precisa fazer ela se apaixonar por ele.',
      'year': '2003',
      'direcao': 'Direção: Donald Petrie',
      'elenco': 'Elenco: Kate Hudson, Matthew McConaughey, Adam Goldberg',
      'ageRating': 'A12',
      'duration': '1h50min'
    },
    {
      // 'title': 'Frozen: Uma Aventura Congelante',
      'image': 'assets/img/filmes/image-5.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoFrozen.png',
      'description':
      'Acompanhada por um vendedor de gelo, a jovem e destemida princesa Anna parte em uma jornada por perigosas montanhas de gelo na esperança de encontrar sua irmã, a rainha Elsa, e acabar com a terrível maldição de inverno eterno, que está provocando o congelamento do reino.',
      'year': '2013',
      'direcao': 'Direção: Jennifer Lee, Chris Buck',
      'elenco': 'Elenco: Kristen Bell, Idina Menzel, Jonathan Groff, Alan Tudyk, Santino Fontana, Josh Gad',
      'ageRating': 'A12',
      'ageRating': 'L',
      'duration': '1h42min'
    },
    {
      // 'title': 'Como Treinar Seu Dragão 3',
      'image': 'assets/img/filmes/image-1.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoDragao.png',
      'description':
      'Soluço busca realizar seu grande sonho de encontrar um lar pacífico onde os dragões possam viver em segurança. Lá, Banguela descobre uma companheira, assim como ele, mas um tanto selvagem. Mas é quando o perigo começa a rondar o lar, que a dupla Banguela e Soluço é testada e precisa tomar decisões difíceis para salvar suas espécies.',
      'year': '2019',
      'direcao': 'Direção: Dean DeBlois',
      'elenco': 'Elenco: Jay Baruchel, America Ferrera, F. Murray Abraham',
      'ageRating': 'L',
      'duration': '1h44min'
    },
  ];

  final List<Map<String, dynamic>> paraFamilia = [
    {
      // 'title': 'Como perder um Homem em 10 dias',
      'image': 'assets/img/filmes/image-5.png',
      'reproducaoImage': 'assets/img/filmes/selecionado.png',
      'description':
      'Ao precisar de um relacionamento em 10 dias para escrever um artigo, a jornalista escolhe Ben, que, por uma aposta no trabalho, precisa fazer ela se apaixonar por ele.',
      'year': '2003',
      'direcao': 'Direção: Donald Petrie',
      'elenco': 'Elenco: Kate Hudson, Matthew McConaughey, Adam Goldberg',
      'ageRating': 'A12',
      'duration': '1h50min'
    },
    {
      // 'title': 'Como Treinar Seu Dragão 3',
      'image': 'assets/img/filmes/image-1.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoDragao.png',
      'description':
      'Soluço busca realizar seu grande sonho de encontrar um lar pacífico onde os dragões possam viver em segurança. Lá, Banguela descobre uma companheira, assim como ele, mas um tanto selvagem. Mas é quando o perigo começa a rondar o lar, que a dupla Banguela e Soluço é testada e precisa tomar decisões difíceis para salvar suas espécies.',
      'year': '2019',
      'direcao': 'Direção: Dean DeBlois',
      'elenco': 'Elenco: Jay Baruchel, America Ferrera, F. Murray Abraham',
      'ageRating': 'L',
      'duration': '1h44min'
    },
    {
      // 'title': 'Monstros S.A.',
      'image': 'assets/img/filmes/image-2.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoMonstrosSA.png',
      'description':
      'Na maior fábrica de monstros do mundo, James Sullivan, um monstro azul com chifres, e seu amigo Mike, um monstro verde de um olho só, têm a missão de assustar crianças, consideradas tóxicas pelos monstros. Porém, tudo muda quando a menina Boo, do mundo humano, acidentalmente entra no mundo dos monstros, transformando suas vidas. ',
      'year': '2001',
      'direcao': 'Direção: Pete Docter, David Silverman, Lee Unkrich',
      'elenco': 'Elenco: John Goodman, Billy Crystal, Steve Buscemi',
      'ageRating': 'L',
      'duration': '1h32min'
    },
    {
      // 'title': 'Frozen: Uma Aventura Congelante',
      'image': 'assets/img/filmes/image-5.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoFrozen.png',
      'description':
      'Acompanhada por um vendedor de gelo, a jovem e destemida princesa Anna parte em uma jornada por perigosas montanhas de gelo na esperança de encontrar sua irmã, a rainha Elsa, e acabar com a terrível maldição de inverno eterno, que está provocando o congelamento do reino.',
      'year': '2013',
      'direcao': 'Direção: Jennifer Lee, Chris Buck',
      'elenco': 'Elenco: Kristen Bell, Idina Menzel, Jonathan Groff, Alan Tudyk, Santino Fontana, Josh Gad',
      'ageRating': 'L',
      'duration': '1h42min'
    },
    {
      // 'title': 'Encanto',
      'image': 'assets/img/filmes/image-3.png',
      'reproducaoImage': 'assets/img/filmes/selecionadoEncanto.png',
      'description':
      'Uma menina colombiana pode ser a última esperança de sua família quando descobre que a magia que envolve o Encanto, um lugar que abençoa crianças com dons únicos, está em perigo.',
      'year': '2021',
      'direcao': 'Direção: Byron Howard, Jared Bush',
      'elenco': 'Elenco: Isabela Madrigal, Bruno Madrigal, Julieta Madrigal, Pepa Madrigal',
      'ageRating': 'L',
      'duration': '1h49min'
    },
  ];

  Map<String, dynamic>? selectedContent;

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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

  void _showNotification(
      BuildContext context, String message, IconData icon, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: MyColors.azulBottomGradiente,
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
                  foregroundColor: MyColors.azulBottomGradiente,
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

  Widget buildSection(String title, List<Map<String, dynamic>> filmes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filmes.map((filme) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContent = filme;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      filme['image'],
                      width: 120,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.azulBottomGradiente,
      body: Container(
        decoration: const BoxDecoration(color: MyColors.azulGradiente),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectedContent == null
                  ? AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: Stack(
                        key: ValueKey<int>(_currentIndex),
                        children: [
                          Image.asset(
                            images[_currentIndex],
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    MyColors.azulGradiente,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Catalogo()));
                            },
                          ),
                          Image.asset(
                            selectedContent!['reproducaoImage'],
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/player');
                              },
                              icon: const Icon(Icons.play_arrow,
                                  color: Colors.white),
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
                                  ); // Exibe a notificação com ícone verde
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
                                  ); // Exibe a notificação com ícone branco
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
                                  ); // Exibe a notificação com ícone vermelho
                                },
                              ),
                            ],
                          ),
                          // Text(
                          //   selectedContent!['title'],
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          const SizedBox(height: 15),
                          Text(
                            ' ${selectedContent!['year']} | Classificação: ${selectedContent!['ageRating']} | Duração: ${selectedContent!['duration']} | HD',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            selectedContent!['description'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ' ${selectedContent!['direcao']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                            const SizedBox(height: 10),
                          Text(
                            ' ${selectedContent!['elenco']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
              if (selectedContent == null) ...[
                buildSection("Continue Assistindo", continuarAssistindo),
                buildSection("Populares", populares),
                buildSection("Para Família", paraFamilia),
              ],
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
