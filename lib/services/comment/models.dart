import 'package:meta/meta.dart';

class Comment {
  final int id;
  final int postId;
  final String email;
  final String body;

  Comment({
    @required this.id,
    @required this.postId,
    @required this.email,
    @required this.body
  });

  factory Comment.fromMap(Map map) => Comment(
      id: map["id"],
      postId: map["postId"],
      email: map["email"],
      body: map["body"]
  );
}