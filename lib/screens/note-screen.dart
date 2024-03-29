import 'package:demo_project/controllers/weather-controller.dart';
import 'package:demo_project/models/note-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/notes-controller.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key, this.noteModel}) : super(key: key);
  final NoteModel? noteModel;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteModel note = NoteModel();
  late String? position;
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  initNote(BuildContext context) async {
    position = ModalRoute.of(context)?.settings.arguments as String?;
    if (position == null) {
      note.message = "This is a test message";
      note.title = "Demo note";
      note.date = DateTime.now();
    } else {
      note = await Provider.of<NotesController>(context).getNote(position!);
    }

    titleController.text = note.title;
    messageController.text = note.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          note.title = titleController.value.text;
          note.message = messageController.value.text;
          await Provider.of<NotesController>(context, listen: false)
              .saveNote(position, note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.check),
      ),
      body: FutureBuilder(
          future: initNote(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading..."),);
            }
            else {
              return Padding(
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
                      ),
                      note.weather != null
                          ? Text(note.weather!)
                          : FutureBuilder(
                          future: WeatherController().fetchWeather(),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text("Loading weather");
                            } else if (snapshot.connectionState ==
                                ConnectionState.done &&
                                snapshot.hasData) {
                              note.weather = snapshot.data!;
                              return Text(note.weather!);
                            } else
                              return Text("");
                          })
                    ],
                  ),
                ),
              ),
            );
            }
          }),
    );
  }
}
