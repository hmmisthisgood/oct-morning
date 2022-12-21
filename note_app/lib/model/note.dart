class Note {
  final int id;
  final String title, body, createdAt;
  final String? updatedAt;

  Note(
      {required this.id,
      required this.title,
      required this.body,
      required this.createdAt,
      required this.updatedAt});

  static Note fromJson(Map json) {
    return Note(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  static List<Note> fromList(List data) {
    return data.map((e) => Note.fromJson(e)).toList();
  }
}
