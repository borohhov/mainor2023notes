import 'package:demo_project/controllers/notes-controller.dart';
import 'package:demo_project/screens/home-screen.dart';
import 'package:demo_project/screens/note-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return NotesController();
  },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => HomeScreen(),
        '/note-screen': (context) => NoteScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}



