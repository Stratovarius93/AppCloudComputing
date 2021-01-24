import 'dart:convert';

import 'package:AppCloudComputing/model/taskModel.dart';
import 'package:http/http.dart' as http;

class FirebaseRequest {
  String url = 'https://apptodo-7c8d1-default-rtdb.firebaseio.com/tasks.json';

  Future<bool> fetchPush(Task task) async {
    final res = await http.post(url, body: taskToJson(task));
    return res.statusCode == 200;
  }

  Future<List<Task>> fetchGet() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final decodeRes = json.decode(res.body);
      List<Task> list = [];
      decodeRes.forEach((id, task) {
        final tasks = Task.fromJson(task);
        tasks.id = id;
        list.add(tasks);
      });
      return list;
    } else {
      throw 'Error ';
    }
  }

  Future<bool> fetchPut( Task task )async {
  String url = 'https://apptodo-7c8d1-default-rtdb.firebaseio.com/tasks/${task.id}.json';
    final res = await http.put(url, body: taskToJson(task));
    final decodeRes = json.decode(res.body);
    print(decodeRes);
    return true;
  }
}
