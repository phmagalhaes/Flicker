import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  int _selectedIndex = 2;
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
                    Navigator.pop(context);
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
                      image: AssetImage('assets/img/filmes/homem.png'),
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
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Como Perder um Homem em 10 Dias',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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