import 'package:meta/meta.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email
  });

  factory User.fromMap(Map map) => User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"]
  );
}