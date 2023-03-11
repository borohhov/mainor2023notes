

import 'package:flutter/material.dart';

import '../models/note-model.dart';

class NotesController extends ChangeNotifier {
  List<NoteModel> notes = [];

  List<NoteModel> get allNotes {return notes;}

  void addNote(NoteModel note) {
    notes.add(note);
    notifyListeners();
  }

  void editNote(int position, NoteModel note) {
    notes[position] = note;
    notifyListeners();
  }

  NoteModel getNote(int position) {
    return notes[position];
  }
}