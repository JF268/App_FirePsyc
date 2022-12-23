import 'package:flutter/material.dart';


class ButtonCustom extends StatelessWidget {
  //parametros para cambiar las propiedades del boton
  String text;
  Color color;
  IconData icon;

  ButtonCustom({
    required this.text,
    required this.color,
    required this.icon,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
        ),
        icon: Icon(icon,size: 35,),
        label:Text(text,style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white)),
      ),
    );
  }
}
