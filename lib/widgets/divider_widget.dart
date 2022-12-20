import 'package:flutter/material.dart';

//Widgets para altura
Widget divider3() => const SizedBox(height: 3);
Widget divider6() => const SizedBox(height: 6);
Widget divider10() => const SizedBox(height: 10);
Widget divider20() => const SizedBox(height: 20);
//Widgets para ancho
Widget dividerW3() => const SizedBox(width: 3);
Widget dividerW6() => const SizedBox(width: 6);
Widget dividerW10() => const SizedBox(width: 10);

Widget loadingWidget()=> Center(
  child: SizedBox(
    height: 50,
    width: 50,
    child: CircularProgressIndicator(
      strokeWidth: 2.2,
      color: Colors.teal,
    ),
  ),);