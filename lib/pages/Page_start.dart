import 'package:flutter/material.dart';

class PageStart extends StatelessWidget {
  const PageStart({Key? key}) : super(key: key);

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
          title: Center(child: Text("PsyC-JF Inicio", style: TextStyle(fontWeight: FontWeight.w500),)),
          actions: <Widget> [],
        ),
      body: Center(
        child: Text("Descrubre novedades"),)
    );
  }
}

