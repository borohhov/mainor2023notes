

import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:demo_project/controllers/persistence/sql-persistence.dart';
import 'package:flutter/material.dart';

import '../models/note-model.dart';

class NotesController extends ChangeNotifier {
  //List<NoteModel> notes = [];
  Persistence persistence = SqlPersistence();
  Future<List<NoteModel>> get allNotes {
    return persistence.getAllNotes();
  }

  Future<void> saveNote(int? id, NoteModel note) async {
    await persistence.saveNote(note);
    notifyListeners();
  }

  Future<NoteModel> getNote(int id) async {
    return persistence.getNote(id);
  }
}