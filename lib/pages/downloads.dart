import 'package:camilly_str/component/navbar.dart';
import 'package:camilly_str/shared/style.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
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
      ),
      bottomNavigationBar: navBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}