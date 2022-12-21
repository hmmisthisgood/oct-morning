import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/utils/db_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';

import 'note_details_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Note> allNotes = [];

  // DBService DBService = DBService();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initDbAndFetchNotes();
  }

  initDbAndFetchNotes() async {
    DBService.initDatabase().then((value) {
      getNotes();
    });
  }

  createNote() async {
    final title = titleController.text;
    final body = bodyController.text;

    if (title.isEmpty && body.isEmpty) {
      Fluttertoast.showToast(
        msg: "Both note title and body cannot be empty",
      );
      return;
    }

    await DBService.createNote(title: title, body: body);
    titleController.clear();
    bodyController.clear();
    FocusScope.of(context).unfocus();
    getNotes();
  }

  getNotes() async {
    allNotes = await DBService.getNotes();
    setState(() {});
  }

  deleteNote(int id) async {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (context) => Container(
    //           color: Colors.blue,
    //           height: 400,
    //         ));

    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.blue.withOpacity(0.4),
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.warning_amber_rounded,
          size: 40,
        ),
        title: const Text("Are you sure, you want to delete your note?"),
        actions: [
          MaterialButton(
              color: Colors.red,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.green,
              minWidth: double.infinity,
              onPressed: () async {
                await DBService.deleteNote(id);
                getNotes();
                Navigator.pop(context);
              },
              child: Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );

    // await DBService.deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter  note title"),
              ),
              TextField(
                controller: bodyController,
                // maxLines: 5,
                decoration:
                    InputDecoration(hintText: "Enter  note description"),
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: createNote,
                      child: Text(
                        "Create Note",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allNotes.length,
                  itemBuilder: (context, index) {
                    final note = allNotes[index];
                    final createdAt = note.createdAt;
                    // final date = "";
                    final date = Jiffy(createdAt).yMMMdjm;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => NoteUpdateScreen(
                                      note: note,
                                    ))).then((value) => getNotes());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              InkWell(
                                  onTap: () async {
                                    await deleteNote(note.id);
                                    getNotes();
                                  },
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            note.body,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          SizedBox(height: 6),
                          Text(date),
                          Divider()
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
