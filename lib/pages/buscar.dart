import 'package:carol_str/componentes/navbar.dart';
import 'package:carol_str/pages/catalogo.dart';
import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';

class Buscar extends StatefulWidget {
  const Buscar({super.key});

  @override
  State<Buscar> createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  int _selectedIndex = 1;

  final List<Map<String, String>> _filmes = [
    {
      "titulo": "Como Treinar Seu Dragão 3",
      "img": "assets/catalogo/filmes/dragao.png",
      "ano": "2019",
      "genero": "Infantil/Aventura"
    },
    {
      "titulo": "Frozen: Uma Aventura Congelante",
      "img": "assets/catalogo/filmes/frozen.png",
      "ano": "2013",
      "genero": "Infantil/Musical"
    },
    {
      "titulo": "Encanto",
      "img": "assets/catalogo/filmes/encanto.png",
      "ano": "2021",
      "genero": "Fantasia"
    },
    {
      "titulo": "Como perder um Homem em 10 dias",
      "img": "assets/catalogo/filmes/homem.png",
      "ano": "2003",
      "genero": "Comédia/Romance"
    },
    {
      "titulo": "Universidade Monstros",
      "img": "assets/catalogo/filmes/monstro.png",
      "ano": "2013",
      "genero": "Infantil/Comédia"
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
        Navigator.pushNamed(context, '/download');
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
              filme['titulo']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: MyColors.azulescuro,
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
                    fillColor: MyColors.azulfinal.withOpacity(0.5),
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
                                Image.asset(filme['img']!),
                                Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: Image.asset(
                                    "assets/img/filmePD.png",
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
                                  Text(
                                    filme['titulo']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    filme['ano']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    filme['genero']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
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

}