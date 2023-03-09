import 'package:demo_project/models/note-model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteRowWidget extends StatelessWidget {
  const NoteRowWidget({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(Icons.ac_unit_rounded),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(note.title, style: Theme.of(context).textTheme.headline6,),
            Text(note.message, style: Theme.of(context).textTheme.bodyMedium,),
          ],),
        ),
        const Spacer(),
        Text(DateFormat('dd.MM').format(note.date))
      ],),
    );
  }
}
