import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({this.description, this.status, this.title, this.id});

  String description;
  String status;
  String title;
  String id;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      description: json["description"],
      status: json["status"],
      title: json["title"],
      id: json["id"]);

  Map<String, dynamic> toJson() =>
      {"description": description, "status": status, "title": title, "id": id};
}
