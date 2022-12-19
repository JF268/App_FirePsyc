import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psycjfapp/pages/Page_start.dart';
import 'package:psycjfapp/pages/my_diary.dart';
import 'package:psycjfapp/pages/settings_app.dart';
import 'package:psycjfapp/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}): super(key:key);
  @override
  State<HomePage> createState() => _HomePageState();
}
//Pagina principal de App Raíz
class _HomePageState extends State<HomePage> {
  int index = 0;
  NavigationBarCustom ?myNav;
  @override
  void initState() {
    myNav = NavigationBarCustom(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
  }
  //instanciando una colección(objeto) de firestore - apuntando
  CollectionReference productividad = FirebaseFirestore.instance.collection('productividad');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      // body: StreamBuilder(
      //   stream: productividad.snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot snap){
      //     if(snap.hasData){
      //       QuerySnapshot collection = snap.data;
      //       //apuntando a una colección
      //       List<QueryDocumentSnapshot> docs = collection.docs;
      //       //generar una lista de mapas
      //       List<Map<String,dynamic>> docsMap = docs.map((e) => e.data() as Map<String,dynamic>).toList();
      //       return ListView.builder(itemCount: docsMap.length,
      //       itemBuilder: (BuildContext context, int index){
      //         return ListTile(
      //           title: Text(docsMap[index]["description"]),
      //         );
      //       },);
      //     }
      //     return Center(child: CircularProgressIndicator(),);
      //   },
      // ),
      bottomNavigationBar: myNav,
      body: Rutas(index: index),
    );
  }
}


class Rutas extends StatelessWidget {
  final int index;
  const Rutas({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //variable para posicionarnos en el Botton NavigationBar
    List<Widget> myList = [
      PageStart(),
      MyDiary(),
      PageSetting(),
    ];
    return myList[index];
  }
}
