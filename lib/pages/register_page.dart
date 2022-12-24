import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psycjfapp/models/user_model.dart';
import 'package:psycjfapp/pages/home_pages.dart';
import 'package:psycjfapp/services/service_firestore.dart';
import 'package:psycjfapp/widgets/TextFieldPass.dart';
import 'package:psycjfapp/widgets/button2_widget.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/textfielf_form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //CONTROLADORES PARA REGISTER
  //var para gestionar el formulario
  final keyForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //instanciamos un objeto de myservice para firestore

  ServiceFirestore userService = ServiceFirestore(collection: 'users');

 //implementación para añadir usuario
  _registerUser() async{
    try{
      //validamos el formulario
      if(keyForm.currentState!.validate()){
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text
        );
        if(userCredential.user !=null){
          UserModel userModel = UserModel(
              fullName: _fullnameController.text,
              email: _emailController.text,
              );
          userService.addUser(userModel).then((value){
            if(value.isNotEmpty){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
            }
          });
        }
      }
    }on FirebaseAuthException catch(error){
      if(error.code == "weak password"){
        //mostrar alerta
        //showSnackBarError(context, "La contraseña es muy débil");
      } else if(error.code == "email-already-in-use"){
        //mostrar alerta
        showSnackBarError(context, "El correo electrónico está en uso");
      }
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Si tienes una cuenta, Inicia sesión"),
      ),
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                divider6(),
                Image.asset("assets/images/logo2.jpg",
                  height: 250,
                  width: 250,),
                Text("REGISTRO en PsyC-JF", style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),),
                Divider(thickness: 7,color: Colors.white70,),
                divider6(),
                Text("Llene los campos para el registro",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                divider10(),
                TextFieldHistory(hinText: "Nombre completo", icon: Icons.person, controller: _fullnameController),
                divider10(),
                TextFieldHistory(hinText: "Correo Electrónico", icon: Icons.email_outlined, controller: _emailController),
                divider10(),
                TextFieldPassword(controller: _passwordController),
                divider10(),
                ButtonCustom(text: "¡REGISTRATE!", color: Colors.teal, icon: Icons.app_registration, onPressed: (){
                  _registerUser();
                },),
              ],

            ),
          ),
        ),
      ),

    );
  }
}
