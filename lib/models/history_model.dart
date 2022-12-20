//Clase para poder manear Firestore
class HistoryModel{
  String title;
  String history;
  String date;
  String state;

  HistoryModel({
    required this.title,
    required this.history,
    required this.date,
    required this.state,
});
  factory HistoryModel.fromJson(Map<String,dynamic> json) => HistoryModel(
      title: json["title"],
      history: json["history"],
      date: json["date"],
      state: json["state"],
  );
}