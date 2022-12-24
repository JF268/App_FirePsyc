import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:psycjfapp/models/user_model.dart';
import 'package:psycjfapp/pages/home_pages.dart';
import 'package:psycjfapp/pages/register_page.dart';
import 'package:psycjfapp/services/service_firestore.dart';
import 'package:psycjfapp/widgets/TextFieldPass.dart';
import 'package:psycjfapp/widgets/button2_widget.dart';
import 'package:psycjfapp/widgets/button_widget.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/textfielf_form_widget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controladores para login
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //instancia final de Google
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  //Creamos una instancia del servicio de Firestore

  ServiceFirestore userService = ServiceFirestore(collection: 'users');

  //metodo para acceder al login
  login()async{
    try{
     if(formKey.currentState!.validate()){
       //codigo para acceder al login
       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: _emailController.text,
           password: _passwordController.text);
       if(userCredential.user != null){
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()),(route) => false);
       }
     }
    }on FirebaseAuthException catch(error){
      //mandando errores para romper la ejecuión
      if(error.code == "invalid-email"){
        showSnackBarError(context, "El correo electrónico es inválido");
      }else if(error.code =="user-not-found"){
        showSnackBarError(context, "El usuario no está registrado");
      } else if(error.code =="wrong-password"){
        showSnackBarError(context, "La contraseña es incorrecta");
      }
    }
  }

  //método para iniciar con google
  loginGoogle() async{
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if(googleSignInAccount == null){
      return;
    }

    GoogleSignInAuthentication _googleSignInAuth = await googleSignInAccount.authentication;
    OAuthCredential credential =  GoogleAuthProvider.credential(
      idToken: _googleSignInAuth.idToken,
      accessToken: _googleSignInAuth.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    if(userCredential.user != null){
      UserModel userModel = UserModel(
          fullName: userCredential.user!.displayName!,
          email: userCredential.user!.email!);
      //llamar al metodo checkuser para verificar si el correo existe
      userService.checkUser(userCredential.user!.email!).then((value){
        if(!value){
          userService.addUser(userModel).then((value){
            if(value.isNotEmpty){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
            }
          });
        } else {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
        }
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wallpaperuse.com-wallpaper-para-celular-32843.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  divider70(),
                  Image.asset("assets/images/logo2.jpg",
                    height: 250,
                    width: 250,),
                  Text("INICIAR SESIÓN en PsyC-JF", style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),),
                  Divider(thickness: 7,color: Colors.white70,),
                  divider6(),
                  Text("El cambio lo haces tu mismo",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  divider10(),
                  TextFieldHistory(hinText: "Email", icon: Icons.person, controller: _emailController),
                  divider10(),
                  TextFieldPassword(controller: _passwordController),
                  divider10(),
                  //boton para inicio de sesión normal
                  ButtonCustom(text: "Iniciar Sesión", color: Colors.teal, icon: Icons.login_rounded,
                  onPressed: (){
                    login();
                  },),
                  divider6(),
                  //iniciar sesión (text)
                  Text("Iniciar con Google",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  divider3(),
                  //Iniciar sesion con google (boton)
                  ButtonCustom(text: "Iniciar Sesión", color: Colors.teal, icon: Icons.g_mobiledata,
                  onPressed: (){
                    loginGoogle();
                  },),
                  divider6(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dividerW6(),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                        },
                        child: Text("Toca aqui para registrarte si no tienes cuenta",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
