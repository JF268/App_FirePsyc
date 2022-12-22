import 'package:flutter/material.dart';
import 'package:psycjfapp/models/diary_model.dart';
import 'package:psycjfapp/services/service_firestore.dart';
import 'package:psycjfapp/widgets/colors_diary.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/satisfaction_widget.dart';

class HistoryWidget extends StatelessWidget {

  ModelDiary modelDiary;

  HistoryWidget({required this.modelDiary});

  //Creamos un objeto de MyserviceFirestore

  final ServiceFirestore _myServiceFirestore = ServiceFirestore(collection: "productividad");
  //dialogo de alerta para eliminar una tarea
  showDeleteHistory(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("¿Eliminar del diario?",style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            divider10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const[
                Icon(Icons.delete_rounded,size: 40,),
                Icon(Icons.book_outlined, size: 40,),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text("Cancelar",style:TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: NosatisfactoryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.5),
                            )
                        ) ,
                        onPressed: (){
                          _myServiceFirestore.DeleteHistory(modelDiary.id!);
                          Navigator.pop(context);
                        }, child: Text("Borrar") )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }


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
              Text(modelDiary.history,style: TextStyle(

              ),),
              trailing: PopupMenuButton(
                elevation: 2,
                color: Colors.teal,
                icon: Icon(Icons.expand_more_rounded),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onSelected: (value){
                  if(value == 2){
                    //ejecutamos método para tachar historia
                    showDeleteHistory(context);
                  }
                  if(value == 1){

                  }
                },
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Reescribir"),),
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
