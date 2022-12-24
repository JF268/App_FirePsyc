import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _registerUser() async{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "lobito2@gmail.com",
        password: "lobo2026");
    print(userCredential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Si tienes cuenta, Inicia sesión"),
      ),
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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

    );
  }
}
