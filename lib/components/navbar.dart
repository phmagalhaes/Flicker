import 'package:flutter/material.dart';
import 'package:flicker/shared/style.dart'; // Importe seu arquivo de estilo, se necessário.

class navBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const navBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.azulBottomGratiente,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: selectedIndex == 0 ? Colors.white : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: selectedIndex == 1 ? Colors.white : Colors.grey,
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.download,
            color: selectedIndex == 2 ? Colors.white : Colors.grey,
          ),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: selectedIndex == 3 ? Colors.white : Colors.grey,
          ),
          label: 'Perfil',
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
