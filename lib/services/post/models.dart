import 'package:meta/meta.dart';

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body
  });

  factory Post.fromMap(Map map) => Post(
      id: map["id"],
      userId: map["userId"],
      title: map["title"],
      body: map["body"]
  );
}