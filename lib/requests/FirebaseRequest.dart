import 'dart:convert';

import 'package:AppCloudComputing/model/taskModel.dart';
import 'package:http/http.dart' as http;

class FirebaseRequest {
  String url = 'https://apptodo-7c8d1-default-rtdb.firebaseio.com/tasks.json';

  //Future<bool> fetchPush(Task task) async {
  //final res = await http.post(url, body: taskToJson(task));
  //return res.statusCode == 200;
  //return  false;
  //}

  Future<List<Task>> fetchGet() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final decodeRes = jsonDecode(res.body);
      //final data1 = decodeRes.keys.map((item) => decodeRes[item]).toList();
      final data1 = decodeRes.keys.map((item) => decodeRes[item]).toList();
      print(data1);

      return data1;
      //print(data1);
    } else {
      throw 'Error ';
    }
  }
}
