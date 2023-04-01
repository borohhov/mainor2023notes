

import 'dart:async';
import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/note-model.dart';

class SqlPersistence extends Persistence {
  static final SqlPersistence _instance = SqlPersistence.internal();

  factory SqlPersistence() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  SqlPersistence.internal();

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, message TEXT, date TEXT)');
  }

  @override
  Future<int> saveNote(NoteModel note) async {
    var dbClient = await db;
    int res = await dbClient.insert("Notes", note.toMap());
    return res;
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient.rawQuery(
        'SELECT * FROM Notes');
    List<NoteModel> notes = [];
    for (var i = 0; i < list.length; i++) {
      NoteModel note = NoteModel();
      note.title = list[i]['title'];
      note.message = list[i]['message'];
      note.date = DateTime.parse(list[i]['date']);
      notes.add(note);
    }
    return notes;
  }

  Future<int> deleteAllNotes() async {
    var dbClient = await db;
    int res = await dbClient.rawDelete('DELETE FROM Notes');
    return res;
  }

  @override
  Future<NoteModel> getNote(String id) {
    // TODO: implement getNote
    throw UnimplementedError();
  }
}
