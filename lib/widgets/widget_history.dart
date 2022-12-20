import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Para listar nuestros elementos del diario- se crea Cards con ListTile
          Card(
            child: ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Column(
                  children: [
                    Text('10/12/2022'),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: Text('Satisfactorio')),
                  ],
                ),
              ),
              autofocus: true,
              title: Text('Titulo de historia 1'),
              subtitle:
              Text('Hoy obtuve un nuevo trabajo como desarrollador y las horas laborales son bastante ligeras'),
              trailing: Icon(Icons.more_vert_rounded),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}
