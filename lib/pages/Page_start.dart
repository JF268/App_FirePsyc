import 'package:flutter/material.dart';

class PageStart extends StatelessWidget {
  const PageStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Text("Tips para manejar el estrés"),
            Icon(Icons.pages, size: 40,),
          ],
        ),
      ),
    );
  }
}
