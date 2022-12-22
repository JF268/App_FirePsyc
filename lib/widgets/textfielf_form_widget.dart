import 'package:flutter/material.dart';


class TextFieldHistory extends StatelessWidget {
  //enviar texto y cambiar icono
  String hinText;
  IconData icon;
  //Función para elegir fecha
  Function? onTap;

  TextEditingController controller;
  //Contructor
  TextFieldHistory({required this.hinText,
  required this.icon,
  this.onTap,
  required this.controller,});
  @override

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap != null? (){onTap!();} : null,
      readOnly: onTap != null? true:false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        prefixIcon: Icon(
          icon,
          size: 20.0,
          color: Colors.teal,
        ),
        hintText: hinText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.black54.withOpacity(0.6),
        ),
        filled: true,
        fillColor: Colors.amber,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (String? value){
        if(value != null && value.isEmpty){
          return "Tienes que llenar este campo";
        }
        return null;
      },
    );
  }
}
