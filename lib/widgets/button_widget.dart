import 'package:flutter/material.dart';

class ButtonW extends StatelessWidget {
  Function onPressed;

  ButtonW({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0,
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal, Colors.transparent,
            ],
          ),
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                )
            ),
            onPressed: (){
              //TODO codigo para guardar historia
              onPressed();
            }, child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.border_color),
              Text('GUARDAR HISTORIA',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
        )),
      ),
    );
  }
}
