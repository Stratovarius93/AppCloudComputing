import 'package:AppCloudComputing/model/taskModel.dart';
import 'package:AppCloudComputing/requests/FirebaseRequest.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _taskList = [];
  bool _showModal = false;
  bool _isDone = false;
  final firebaseRequest = FirebaseRequest();

  List<Task> get getTaskList => _taskList;
  bool get getShowModal => _showModal;
  bool get getIsDone => _isDone;

  set setTaskList(List<Task> taskList) {
    _taskList = taskList;
  }

  set setShowModal(bool value) {
    _showModal = value;
  }

  TaskProvider() {
    this.getList();
  }

  getList() async {
    _taskList = await firebaseRequest.fetchGet();
    notifyListeners();
  }

  modal() {
    _showModal = !_showModal;
    notifyListeners();
  }

  createTak(Task task) async {
    await firebaseRequest.fetchPush(task);
    getList();

    notifyListeners();
  }

  finish() {
    _isDone = !_isDone;
    notifyListeners();
  }
  updateTask(Task task)async{
    final res = await firebaseRequest.fetchPut(task);
    print(res);
    notifyListeners();
  }
}
