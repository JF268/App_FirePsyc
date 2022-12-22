import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psycjfapp/models/diary_model.dart';
import 'package:psycjfapp/widgets/History_form_widget.dart';
import 'package:psycjfapp/widgets/button_widget.dart';
import 'package:psycjfapp/widgets/colors_diary.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/textfielf_form_widget.dart';
import 'package:psycjfapp/widgets/widget_history.dart';


class MyDiary extends StatelessWidget {

  //instanciando una colección(objeto) de firestore - apuntando
  CollectionReference historia = FirebaseFirestore.instance.collection('productividad');

  //Método para ingresar una nueva historia

  showFormHistory(BuildContext context){
    showModalBottomSheet(
        context: context ,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return Padding(
            //Consumir el espacio que quita el teclado para visualizar el form
            padding: MediaQuery.of(context).viewInsets,
            child: HistoryWidgetForm(),
          );
        }
    );
  }
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
              showFormHistory(context);
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
                //llamando a streambuilder desde Firebase
                StreamBuilder(
                  stream: historia.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<ModelDiary> historys = [];
                      QuerySnapshot collection = snap.data;
                      // collection.docs.forEach((element) {
                      //   Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
                      //   historys.add(ModelDiary.fromJson(myMap));
                      // });

                      historys = collection.docs.map((e){
                        ModelDiary model = ModelDiary.fromJson(e.data() as Map<String, dynamic>);
                        model.id = e.id;
                        return model;
                      }).toList();

                      return ListView.builder(
                        itemCount: historys.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                            return HistoryWidget(
                              modelDiary: historys[index],);
                        },
                      );
                    }
                    return Center(child: loadingWidget());
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
