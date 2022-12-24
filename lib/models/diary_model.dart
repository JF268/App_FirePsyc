//Clase para poder manejar Firestore
class ModelDiary{
  //añadimos el id puede ser nulo
  String? id;
  String title;
  String history;
  String date;
  String state;

  ModelDiary({
    required this.title,
    required this.history,
    required this.date,
    required this.state,
    this.id,
});
  factory ModelDiary.fromJson(Map<String, dynamic> json) => ModelDiary(
      id:json["id"] ?? "",
      title: json["title"],
      history: json["history"],
      date: json["date"],
      state: json["state"],
  );

  Map <String, dynamic>toJson()=>{
    "title": title,
    "history": history,
    "date":date,
    "state": state,
};
}