import 'package:demo_project/models/note-model.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteModel note = NoteModel();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    note.message = "This is a test message";
    note.title = "Demo note";
    note.emoji = "👍";
    note.date = DateTime.now();

    titleController.text = note.title;
    messageController.text = note.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "Title"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: messageController,
                    maxLines: 16,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Your message",
                        hintText: "Tell me your thoughts"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
