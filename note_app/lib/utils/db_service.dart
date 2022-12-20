import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {
  final noteTableName = "notes";
  late Database database;

  initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, "our-database.db");
    print(dbPath);

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

  createNote({String title = "buy something", String body = ""}) async {
    await database.insert(
      noteTableName,
      {
        "title": title,
        "body": body,
        "createdAt": DateTime.now().toIso8601String(),
        "isCompleted": 'false'
      },
    );
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    return await database.query(
      noteTableName,
      // orderBy: "dateCreated DSC",
    );
  }

  deleteNote(int id) async {
    await database.delete(noteTableName, where: "id=?", whereArgs: [id]);
  }

  updateNote({String? title, String? body}) async {
    await database.update(
      noteTableName,
      {"title": title, "body": body},
    );
  }
}
