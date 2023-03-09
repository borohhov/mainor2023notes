import 'package:demo_project/widgets/note-row-widget.dart';
import 'package:flutter/material.dart';

import '../models/note-model.dart';

class NotesListWidget extends StatelessWidget {
  NotesListWidget({Key? key, required this.noteModels}) : super(key: key);
  final List<NoteModel> noteModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
            child: Column(
          children: noteModels.map((nm) => NoteRowWidget(note: nm)).toList(),
        )));
  }
}
