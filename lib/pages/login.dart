import 'package:flutter/material.dart';
import 'package:psycjfapp/pages/register_page.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                ButtonCustom(text: "Iniciar Sesión", color: Colors.teal, icon: Icons.login_rounded),
                divider6(),
                Text("Iniciar con Google",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                divider3(),
                ButtonCustom(text: "Iniciar Sesión", color: Colors.teal, icon: Icons.g_mobiledata),
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
    );
  }
}
