import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';


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
      body:Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage("assets/images/wallpaperuse.com-wallpaper-para-celular-32843.jpg"),
              fit: BoxFit.fill),
            ),
          ),
          Container( // container para imagen de fondo login
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),

            ),
          )
        ],
      ),
    );
  }
}
