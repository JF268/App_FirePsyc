import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  //instanciando una colección(objeto) de firestore - apuntando
  CollectionReference productividad = FirebaseFirestore.instance.collection('productividad');

  //añadiendo Stream
  Stream<int> counter() async*{
    for(int i=0;i<10;i++){
      yield i;
      await Future.delayed(const Duration(seconds: 2));
    }
  }
  Future<int> getNumber() async{
    return 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PysC-JF Home"),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(onPressed: (){
      //         //apuntamos a la colección instanciada y con get obtenemos la data
      //         productividad.get().then((value){
      //           //   //con QuerySnapshot lo apuntamos a una colección
      //           //   QuerySnapshot collection = value;
      //           //   //Lista que hace referencia a un documento
      //           //   List<QueryDocumentSnapshot> docs = collection.docs;
      //           //   QueryDocumentSnapshot doc = docs[0];
      //           //   print(doc.data());
      //           QuerySnapshot collection = value;
      //           collection.docs.forEach((QueryDocumentSnapshot element) {
      //             //creamos un mapa
      //             Map<String, dynamic> myMap= element.data() as Map<String,dynamic>;
      //             print(myMap['description']);
      //           });
      //         });
      //       }, child: Text("Obtener listado")),
      //       ElevatedButton(onPressed: (){
      //         //apuntamos a la colección instanciada y con get obtenemos la data
      //         productividad.add(
      //             {
      //               "description" : "Alcancé un nuevo puesto en la empresa",
      //               "satisfaction" : true,
      //             }
      //           //nos devuelve un ID
      //         ).then((DocumentReference value){
      //           print(value.id);
      //         }).catchError((error){
      //           print("Ocurrió un error");
      //         }).whenComplete((){
      //           print("El registro de añadió");
      //         });
      //       }, child: Text("Agregar actividad")),
      //       ElevatedButton(onPressed: (){
      //         //apuntamos a la colección instanciada y con get obtenemos la data
      //         productividad.
      //         doc("mHNEGQI2pTHNTOznXs9W").update({
      //           "description": "fui de paseo",
      //           "satisfaction": true,
      //         }).catchError((error){
      //           print(error);
      //         }).whenComplete((){
      //           print("Actualización completa");
      //         });
      //       }, child: Text("Actualizar documento")),
      //       ElevatedButton(onPressed: (){
      //         //apuntamos a la colección instanciada y para eliminar usamos su id
      //         productividad.
      //         doc("mHNEGQI2pTHNTOznXs9W").delete().catchError((error){
      //           print(error);
      //         }).whenComplete((){
      //           print("Eliminado");
      //         });
      //       }, child: Text("Eliminar actividad")),
      //       ElevatedButton(onPressed: (){
      //         //apuntamos a la colección instanciada y para eliminar usamos su id
      //         productividad.
      //         doc("act001").set({
      //           "description": "Aprobar las materias",
      //           "satisfaction": false,
      //           "estado": false,
      //         },).catchError((error){
      //           print(error);
      //         }).whenComplete((){
      //           print("Actividad añadida");
      //         });
      //       }, child: Text("Agregar actividad nueva personalizada")),
      //     ],
      //   ),
      // ),
      //introduciendo StreamBuilder
      body: StreamBuilder(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){
            int data = snap.data;
            return Center(child: Text(data.toString(), style: TextStyle(fontSize: 80),));
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
