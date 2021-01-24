import 'package:AppCloudComputing/model/taskModel.dart';
import 'package:AppCloudComputing/provider/taskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> list = ['1', '2'];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('App notas'),
      ),
      body: ListView.builder(
        itemCount: taskProvider.getTaskList.length,
        itemBuilder: (BuildContext context, int index) {
          if (taskProvider.getTaskList.length != 0) {
            return ListTile(
              title: Text(taskProvider.getTaskList[index].title),
              subtitle: Text(taskProvider.getTaskList[index].description),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
