//Clase para poder manejar Firestore
class ModelDiary{
  String title;
  String history;
  String date;
  String state;

  ModelDiary({
    required this.title,
    required this.history,
    required this.date,
    required this.state,
});
  factory ModelDiary.fromJson(Map<String, dynamic> json) => ModelDiary(
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