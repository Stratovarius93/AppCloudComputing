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
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          //if (taskProvider.getTaskList.length != 0) {
            return ListTile(
              title: Text(list[index]),
            );
          //} else {
            //return CircularProgressIndicator();
          //}
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
