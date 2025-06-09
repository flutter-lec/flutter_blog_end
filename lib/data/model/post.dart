import 'package:flutter_blog/data/model/user.dart';

class Post {
  int id;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  int bookmarkCount;
  bool? isBookmark;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.bookmarkCount,
    this.isBookmark,
  });

  Post.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        content = data['content'],
        createdAt = DateTime.parse(data['createdAt']),
        updatedAt = DateTime.parse(data['updatedAt']),
        user = User.fromMap(data['user']),
        bookmarkCount = data["bookmarkCount"],
        isBookmark = data["isBookmark"];

  @override
  String toString() {
    return 'Post{id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, bookmarkCount: $bookmarkCount, isBookmark: $isBookmark}';
  }
}
