import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    this.description,
    this.status,
    this.title,
  });

  String description;
  String status;
  String title;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        description: json["description"],
        status: json["status"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "status": status,
        "title": title,
      };
}
