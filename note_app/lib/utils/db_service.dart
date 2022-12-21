import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/note.dart';

class DBService {
  static final noteTableName = "notes";
  static late Database database;

  static Future initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, "our-database.db");

    /// /data/user/0/com.example.note_app/app_flutter/our-database.db

    database = await openDatabase(
      dbPath,
      version: 1,
      onConfigure: (db) async {
        final createNotesTable = """
        CREATE TABLE IF NOT EXISTS $noteTableName(
          id INTEGER PRIMARY KEY,
          title VARCHAR,
          body TEXT,
          createdAt VARCHAR,
          updatedAt VARCHAR,
          isCompleted INTEGER
        );
 """;

        try {
          await db.execute(createNotesTable);
        } catch (e, s) {
          print(e);
          print(s);
        }
      },
      onCreate: (db, version) {},
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
      onOpen: (db) {},
    );
  }

  static createNote({String title = "buy something", String body = ""}) async {
    await database.insert(
      noteTableName,
      {
        "title": title,
        "body": body,
        "createdAt": DateTime.now().toString(),
        "isCompleted": 'false'
      },
    );
  }

  static Future<List<Note>> getNotes() async {
    final result = await database.query(
      noteTableName,
      // orderBy: "dateCreated DSC",
    );

    final notes = Note.fromList(result);
    return notes;
  }

  static deleteNote(int id) async {
    await database.delete(noteTableName, where: "id=?", whereArgs: [id]);
  }

  static updateNote({String? title, String? body, required int id}) async {
    await database.update(
        noteTableName,
        {
          "title": title,
          "body": body,
          "updatedAt": DateTime.now().toString(),
        },
        where: "id=?",
        whereArgs: [id]);
  }
}
