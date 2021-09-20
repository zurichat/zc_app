import 'dart:convert';

class TodoModel {
  int userId;
  int id;
  String title;
  bool status;
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'status': status,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));
}
