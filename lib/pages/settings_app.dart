import 'package:flutter/material.dart';

class PageSetting extends StatelessWidget {
  const PageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal, Colors.white70
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        title: const Text("Configuración", style: TextStyle(fontWeight: FontWeight.w500),),
        leading: const Icon(Icons.settings_suggest_rounded,size: 40),
        actions: <Widget> [
          IconButton(onPressed: (){
            //Codigo para añadir entrada al diario

          }, icon: const Icon(Icons.expand_more_outlined,size: 35,color: Colors.black45,))
        ],
      ),
    );
  }
}
