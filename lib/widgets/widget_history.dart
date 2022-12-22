import 'package:flutter/material.dart';
import 'package:psycjfapp/models/diary_model.dart';
import 'package:psycjfapp/widgets/satisfaction_widget.dart';

class HistoryWidget extends StatelessWidget {

  ModelDiary modelDiary;

  HistoryWidget({required this.modelDiary});

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
                    Text(modelDiary.date),
                    WidgetSatisfaction(
                      text: modelDiary.state,
                    ),
                  ],
                ),
              ),
              autofocus: true,
              title: Text(modelDiary.title),
              subtitle:
              Text(modelDiary.history),
              trailing: PopupMenuButton(
                elevation: 2,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onSelected: (value){
                  print(value);
                },
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Editar"),),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Borrar del diario"),),
                  ];
                },
                  ),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}
