import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/pages/catalogo.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _ConfigPerfilState();
}

class _ConfigPerfilState extends State<Perfil> {
  int _selectedIndex = 3;
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
      body: Container(
        decoration: BoxDecoration(color: MyColors.azul),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Catalogo()));
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Meu perfil',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/img/carol.png",
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Carol',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 18),
                      SizedBox(width: 5),
                      Text(
                        'Editar perfil',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: 337,
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) => Divider(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final titles = [
                        'Minha Lista',
                        'Configurações do Aplicativo',
                        'Avisos Legais',
                        'Ajuda',
                        'Sair'
                      ];
                      return _buildListItem(
                          titles[index], Icons.arrow_forward_ios, context);
                    },
                  ),
                ),
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

 Widget _buildListItem(String title, IconData icon, BuildContext context) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    trailing: Icon(icon, color: Colors.white),
    onTap: () {
      if (title == 'Sair') {
        Navigator.pushReplacementNamed(context, '/login'); // Substitua '/login' pela rota desejada
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicou em $title')),
        );
      }
    },
  );
}

}