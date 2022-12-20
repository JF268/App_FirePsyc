import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/satisfaction_widget.dart';

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
                    WidgetSatisfaction(
                      text: "Insatisfacción",
                    ),
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
