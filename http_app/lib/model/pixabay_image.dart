class PixabayImage {
  PixabayImage({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.previewUrl,
    required this.largeImageUrl,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  int id;
  String pageUrl;
  String type;
  String tags;
  String previewUrl;

  String largeImageUrl;

  int views;
  int downloads;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  factory PixabayImage.fromJson(Map<String, dynamic> json) {
    return PixabayImage(
      id: json["id"],
      pageUrl: json["pageURL"],
      type: json["type"],
      tags: json["tags"],
      previewUrl: json["previewURL"],
      largeImageUrl: json["largeImageURL"],
      views: json["views"],
      downloads: json["downloads"],
      likes: json["likes"],
      comments: json["comments"],
      userId: json["user_id"],
      user: json["user"],
      userImageUrl: json["userImageURL"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": type,
        "tags": tags,
        "previewURL": previewUrl,
        "largeImageURL": largeImageUrl,
        "views": views,
        "downloads": downloads,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
      };
}
