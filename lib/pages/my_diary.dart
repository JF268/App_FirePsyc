import 'package:flutter/material.dart';


class MyDiary extends StatelessWidget {
  const MyDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal, Colors.white70
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          title: Text("Añadir entrada", style: TextStyle(fontWeight: FontWeight.w500),),
          leading: Icon(Icons.menu_book_rounded,size: 40),
          actions: <Widget> [
            IconButton(onPressed: (){}, icon: const Icon(Icons.border_color,color: Colors.black45,))
          ],
        ),
        body: Center(
          child: Text("Hola a todos"),)
    );
  }
}
