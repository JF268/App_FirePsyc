import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class PageSetting extends StatelessWidget {
  const PageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _myDetail(){
      showDialog(context: context,
          builder: (BuildContext context){
        return AlertDialog(
          title: Text("PysC-JF detail"),
          content: Container(
            height: 420,
            child: Column(
              children: [
                Image.asset("assets/images/logo2.jpg",
                  height: 200,
                  width: 300,),
                Divider(thickness: 6,),
                divider10(),
                Text("Los diarios personales influyen de manera"
                  " positiva en las personas que les cuesta recordar o capturar recuerdos"
                  " históricos, adicionalmente ayuda a manejar el estrés y la ansiedad e"
                  " inspira la reflexión en uno mismo, la aplicación “PysC-JF” pretende"
                  " cumplir la con función de un diario personal digital que guarde"
                  " momentos históricos del usuario", textAlign: TextAlign.start,),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cerrar", style: TextStyle(
                fontSize: 20, color: Colors.teal
              ),),
            ),
          ],
        );
      });
    }
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
        title: const Text("Sobre esta aplicación", style: TextStyle(fontWeight: FontWeight.w500),),
        leading: const Icon(Icons.app_shortcut_outlined,size: 40),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              divider6(),
              Divider(thickness: 8,),
              Card(
                color: Colors.teal,
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded, size: 30),
                  title: Text("Acerca de PysC-JF"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){
                      _myDetail();
                  },
                ),
              ),
              Card(shadowColor: Colors.yellow,
                child: ListTile(
                  leading: Icon(Icons.code_rounded, size: 30),
                  title: Text("Código en GitHub"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){
                    //dirección url
                    url_launcher.launchUrl(Uri.parse("https://github.com/JF268/App_FirePsyc.git"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
