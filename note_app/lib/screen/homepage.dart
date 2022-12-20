import 'package:flutter/material.dart';
import 'package:note_app/utils/db_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> allNotes = [];

  DBService dbService = DBService();

  @override
  void initState() {
    super.initState();
    dbService.initDatabase();
  }

  createNote({String title = "buy something", String body = ""}) async {
    dbService.createNote(title: title, body: body);
    getNotes();
  }

  getNotes() async {
    allNotes = await dbService.getNotes();
    setState(() {});
  }

  deleteNote(int id) async {
    await dbService.deleteNote(id);
  }

  updateNote({String? title, String? body}) async {
    await dbService.updateNote(title: title, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () => createNote(
                        title: "do something",
                        body: "Buy 10 books for your class..."),
                    child: Text(
                      "Create Note",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: getNotes,
                    child: Text(
                      "Get Notes",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: allNotes.length,
                itemBuilder: (context, index) {
                  final note = allNotes[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            note['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          IconButton(
                              onPressed: () async {
                                await deleteNote(note['id']);
                                getNotes();
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      Text(
                        note['body'],
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        note["createdAt"],
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
