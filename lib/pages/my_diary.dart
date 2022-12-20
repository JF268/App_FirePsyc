import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';


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
                Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text("10/12/2022"),
                          ),
                          autofocus: true,
                          title: Text('Titulo de historia 1'),
                          subtitle:
                          Text('Hoy obtuve un nuevo trabajo como desarrollador y las horas laborales son bastante ligeras'),
                          trailing: Icon(Icons.more_vert_rounded),
                          isThreeLine: true,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text("11/12/2022"),
                          ),
                          autofocus: true,
                          title: Text('Titulo de historia 2'),
                          subtitle:
                          Text("Aqui puede entrar otra historia que desees añadir al dirio"),
                          trailing: Icon(Icons.more_vert_rounded),
                          isThreeLine: true,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text("15/12/2022"),
                          ),
                          autofocus: true,
                          title: Text('Titulo de historia 3'),
                          subtitle:
                          Text('Hoy no fue un buen dia y tuve una conflicto con un amigo de la universidad'),
                          trailing: Icon(Icons.more_vert_rounded),
                          isThreeLine: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
