import 'package:demo_project/controllers/notes-controller.dart';
import 'package:demo_project/controllers/random-number-generator.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:demo_project/widgets/note-row-widget.dart';
import 'package:demo_project/widgets/notes-list-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Märkmik"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/note-screen'),
      ),
      body: NotesListWidget(noteModels: Provider.of<NotesController>(context, listen: true).allNotes,),
    );
  }
}


