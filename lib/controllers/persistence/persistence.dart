import '../../models/note-model.dart';

abstract class Persistence {
  Future<void> saveNote(NoteModel note);
  Future<NoteModel> getNote(String id);
  Future<List<NoteModel>> getAllNotes();
}