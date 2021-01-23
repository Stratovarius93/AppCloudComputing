import 'package:AppCloudComputing/model/taskModel.dart';
import 'package:AppCloudComputing/requests/FirebaseRequest.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _taskList = [];
  final firebaseRequest = FirebaseRequest();

  List<Task> get getTaskList => _taskList;

  set setTaskList(List<Task> taskList) {
    _taskList = taskList;
  }

  TaskProvider() {
    this.getList();
  }

  getList() async {
    _taskList = await firebaseRequest.fetchGet();
    //final data = await firebaseRequest.fetchGet();

    //print(data);
    notifyListeners();
  }

}
