import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psycjfapp/models/diary_model.dart';
import 'package:psycjfapp/models/user_model.dart';

class ServiceFirestore{


  //primero apuntamos a la colección de Firestore
  String collection;

  ServiceFirestore({required this.collection});

  //objeto que apunta a Firebase de forma dinamica con la var 'collection'
  late final CollectionReference historia = FirebaseFirestore.instance.collection(collection);

  //////////////////////////////////////////////////////
  //agregar historia
  Future<String>addHistory(ModelDiary model) async{
  DocumentReference documentReference = await historia.add(model.toJson());
  String id = documentReference.id;
  return id;
  }
  //Modificar el state de la historia: "satisfacción", "insatisfacción", "Neutro"


  //Tachar/borrar del diario
  Future<void>DeleteHistory(String historyId) async{
    await historia.doc(historyId).delete().catchError((error){
      //eliminar
    }).whenComplete(() => null);
  }

  // Agregar usuarios a Firebase
  Future<String>addUser(UserModel userModel)async{
   DocumentReference documentReference = await historia.add(userModel.toJson());
   return documentReference.id;

  }

  //actualizar
}