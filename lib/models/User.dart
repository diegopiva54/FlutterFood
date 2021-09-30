import 'dart:convert';

class User {
  String name;
  String email;
  String avatar;

  User({this.name, this.email, this.avatar});

  factory User.fromJson(jsonData) {
    return User(
      name: jsonData['name'],
      email: jsonData['email'],
      avatar: jsonData['avatar'],
    );
  }

  toJson() {
    return jsonEncode({
      'name': name,
      'email': email,
      'avatar': avatar,
    });
  }
}
