import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/colors_diary.dart';

class WidgetSatisfaction extends StatelessWidget {

  //variable String para que podamos enviar algo desde Widget.history
  String text;
  WidgetSatisfaction({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.5),
        decoration: BoxDecoration(
            color: categoryColor[text],
            borderRadius: BorderRadius.circular(6.0)
        ),
        child: Text(text));
  }
}
