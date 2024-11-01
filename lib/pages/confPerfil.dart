import 'package:carol_str/pages/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(configPerfil());
}

class configPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: MyColors.azulescuro),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16),
            Text(
              'Meu perfil',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Bordas arredondadas
              child: Image.asset(
                "assets/img/carol.jpg",
                height: 110, // Ajuste a altura conforme desejado
                width: 110,  // Ajuste a largura conforme desejado
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
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => Divider(
                    color: const Color.fromARGB(
                        255, 255, 255, 255), // Cor da linha
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
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold), // Texto em branco e negrito
      ),
      trailing: Icon(icon, color: Colors.white),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicou em $title')),
        );
      },
    );
  }
}
