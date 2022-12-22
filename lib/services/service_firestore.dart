import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psycjfapp/models/diary_model.dart';

class ServiceFirestore{


  //primero apuntamos a la colección de Firestore
  String collection;

  ServiceFirestore({required this.collection});
  //objeto que apunta a Firebase de forma dinamica con la var 'collection'
  late final CollectionReference historia = FirebaseFirestore.instance.collection('productividad');

  //agregar
  Future<String>addHistory(ModelDiary model) async{
  DocumentReference documentReference = await historia.add(model.toJson());
  String id = documentReference.id;
  return id;
  }


  //eliminar


  //actualizar
}