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
        // padding: const EdgeInsets.all(15.0),
        child: Column(
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
                       SizedBox(width: 8),
                    ],
                  ),
                  Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Text(
                  "Downloads",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

                SizedBox(width: 48), 
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage('assets/img/filme.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.translate(
                        offset: Offset(12, 14),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/img/cel.png"))
                        ),
                      ),
                    ),
                  ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Padding( 
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0), 
                      child: Text(
                        'Como Perder um Homem em 10 Dias',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () {
                    },
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