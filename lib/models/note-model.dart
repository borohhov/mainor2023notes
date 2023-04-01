
class NoteModel {
  int? id;
  late String title;
  late String message;
  late DateTime date;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["title"] = title;
    map["message"] = message;
    map["date"] = date.toString();
    return map;
  }
}

List<NoteModel> getTestNotes(){
  var note1 = NoteModel();
  note1.title = "Title1";
  note1.message = "Test Message";
  note1.date = DateTime.now();

  var note2 = NoteModel();
  note2.title = "Title 2";
  note2.message = "Test Message 2";
  note2.date = DateTime.now();
  return [note1, note2];
}

