import 'package:flutter/material.dart';
import 'package:note_app/utils/db_service.dart';

import '../model/note.dart';

class NoteUpdateScreen extends StatefulWidget {
  const NoteUpdateScreen({super.key, required this.note});
  final Note note;
  @override
  State<NoteUpdateScreen> createState() => _NoteUpdateScreenState();
}

class _NoteUpdateScreenState extends State<NoteUpdateScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note.title;
    bodyController.text = widget.note.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: InkWell(
        onTap: () async {
          await DBService.updateNote(
              id: widget.note.id,
              title: titleController.text,
              body: bodyController.text);
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          color: Colors.green,
          child: Center(
              child: Text(
            "SAVE",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Enter  note title"),
          ),
          TextField(
            controller: bodyController,
            maxLines: 10,
            decoration: InputDecoration(hintText: "Enter  note description"),
          ),
        ]),
      ),
    );
  }
}
