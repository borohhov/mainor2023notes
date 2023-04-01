
import 'package:demo_project/controllers/persistence/persistence.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

class FirebasePersistence extends Persistence {
  FirebaseApp? _firebaseApp;

  Future<void> init() async {
    if(_firebaseApp == null) {
      _firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  }
  @override
  Future<List<NoteModel>> getAllNotes() async {
    await init();
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<NoteModel> getNote(num id) async {
    await init();
    // TODO: implement getNote
    throw UnimplementedError();
  }

  @override
  Future<void> saveNote(NoteModel note) async {
    // TODO: implement saveNote
    throw UnimplementedError();
  }

}