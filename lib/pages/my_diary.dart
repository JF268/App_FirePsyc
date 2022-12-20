import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/widget_history.dart';


class MyDiary extends StatelessWidget {
  const MyDiary({Key? key}) : super(key: key);

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
          title: const Text("Añadir entrada", style: TextStyle(fontWeight: FontWeight.w500),),
          leading: const Icon(Icons.menu_book_rounded,size: 40),
          actions: <Widget> [
            IconButton(onPressed: (){
              //Codigo para añadir entrada al diario
            }, icon: const Icon(Icons.border_color,color: Colors.black45,))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                divider10(),
                Text("Entradas para mi diario personal",style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87.withOpacity(0.55),
                ),),
                divider6(),
                HistoryWidget(),
                HistoryWidget(),
                HistoryWidget(),
                HistoryWidget(),
              ],
            ),
          ),
        )
    );
  }
}
