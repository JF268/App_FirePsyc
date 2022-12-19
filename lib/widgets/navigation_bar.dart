import 'package:flutter/material.dart';

class NavigationBarCustom extends StatefulWidget {
  final Function currentIndex;
  const NavigationBarCustom({Key? key, required this.currentIndex}): super(key:key);
  @override
  State<NavigationBarCustom> createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
        onTap: (int i){
        setState((){
          index =i;
          widget.currentIndex(i);
        });
        },
        selectedItemColor: Colors.teal,
        elevation: 10.6,
        //Elementos de la barra
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home_max),label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.book_rounded),label:'Mi Diario'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Configuración'),
        ],
    );
  }
}
