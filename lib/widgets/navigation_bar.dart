import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          const
          BottomNavigationBarItem(icon: Icon(Icons.home_max),label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.book_rounded),label:'Mi Diario'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Configuración'),
        ],
    );
  }
}
