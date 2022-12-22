import 'package:flutter/material.dart';
import 'package:psycjfapp/widgets/button_widget.dart';
import 'package:psycjfapp/widgets/colors_diary.dart';
import 'package:psycjfapp/widgets/divider_widget.dart';
import 'package:psycjfapp/widgets/textfielf_form_widget.dart';


class HistoryWidgetForm extends StatefulWidget {
  const HistoryWidgetForm({Key? key}) : super(key: key);

  @override
  State<HistoryWidgetForm> createState() => _HistoryWidgetFormState();
}

class _HistoryWidgetFormState extends State<HistoryWidgetForm> {
//función para escoger fecha
SelectDate() async{
  DateTime? datetime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      cancelText: "Cancelar",
      confirmText: "Guardar fecha",
      helpText: "¿Qué día pasó?",
      builder: (BuildContext context, Widget? widget){
        return Theme(
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: Colors.teal,
            dialogTheme: DialogTheme(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
            ),
            colorScheme: ColorScheme.light(
              primary: Colors.teal,
            ),
          ),
          child: widget!,);
      }
  );
  
  if(datetime != null){
    _dateController.text = datetime.toString().substring(0,10);
    setState(() {

    });
  }
}

final TextEditingController _tituloController = TextEditingController();
final TextEditingController _historyController = TextEditingController();
final TextEditingController _dateController = TextEditingController();

String stateSelected = "Satisfacción";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(22.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Agregar Historia para hoy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
            divider10(),
            TextFieldHistory(
              hinText: "Título",
              icon: Icons.title,
              controller: _tituloController,
            ),
            divider10(),
            TextFieldHistory(
              hinText: "Historia del día",
              icon: Icons.history_edu_outlined,
              controller: _historyController,
            ),
            divider10(),
            Text("Calificas este día con:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
            Wrap(
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              spacing: 5.0,
              children: [
                FilterChip(
                    selected: stateSelected == "Satisfacción",
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    selectedColor: categoryColor[stateSelected],
                    labelStyle: TextStyle(
                      color: stateSelected == "Satisfacción" ? Colors.white: Colors.grey,
                    ),
                    label: Text("Satisfacción"), onSelected: (bool value){
                      stateSelected = "Satisfacción";
                      setState(() {});
                }),
                FilterChip(
                    selected: stateSelected == "Insatisfacción",
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    selectedColor: categoryColor[stateSelected],
                    labelStyle: TextStyle(
                      color: stateSelected == "Insatisfacción" ? Colors.white: Colors.grey,
                    ),
                    label: Text("Insatisfacción"), onSelected: (bool value){
                  stateSelected = "Insatisfacción";
                  setState(() {});
                }),
                FilterChip(
                    selected: stateSelected == "Neutro",
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    selectedColor: categoryColor[stateSelected],
                    labelStyle: TextStyle(
                      color: stateSelected == "Neutro" ? Colors.white: Colors.grey,
                    ),
                    label: Text("Neutro"), onSelected: (bool value){
                  stateSelected = "Neutro";
                  setState(() {});
                }),
              ],),
            divider3(),
            TextFieldHistory(
              hinText: "Fecha",
              icon: Icons.date_range_rounded,
              controller: _dateController,
              onTap: (){
                //TODO codigo para llamar al metodo para escoger fecha
                SelectDate();
              },),
            divider3(),
            ButtonW(),
          ],
        )
    );
  }
}
