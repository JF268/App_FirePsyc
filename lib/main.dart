import 'package:flutter/material.dart';
import 'package:psycjfapp/pages/home_pages.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inicio de la aplicación",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
