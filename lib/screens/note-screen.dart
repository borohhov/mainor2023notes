import 'package:demo_project/models/note-model.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key, this.noteModel}) : super(key: key);
  final NoteModel? noteModel;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteModel note = NoteModel();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    if (widget.noteModel == null) {
      note.message = "This is a test message";
      note.title = "Demo note";
      note.emoji = "👍";
      note.date = DateTime.now();
    } else {
      note = widget.noteModel!;
    }

    titleController.text = note.title;
    messageController.text = note.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/', arguments: note),
        child: Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  onSubmitted: (text) => titleController.text = text,
                  decoration: InputDecoration(labelText: "Title"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (text) => messageController.text = text,
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
