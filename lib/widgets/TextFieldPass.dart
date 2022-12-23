import 'package:flutter/material.dart';

class TextFieldPassword extends StatefulWidget {
  TextEditingController controller ;

  TextFieldPassword({required this.controller});

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {

  bool isInvisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isInvisible,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        prefixIcon: Icon(
          Icons.lock_person,
          size: 25.0,
          color: Colors.teal,
        ),
        suffixIcon: IconButton(
          icon: Icon( isInvisible ? Icons.remove_red_eye:Icons.remove_red_eye_outlined,color: Colors.teal,size: 30,),
          onPressed: (){
            isInvisible = !isInvisible;
            setState(() {});
        },
        ) ,
        hintText: "Contraseña",
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
          return "Campo obligatorio";
        }
        return null;
      },
    );
  }
}
