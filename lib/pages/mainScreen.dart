import 'package:AppCloudComputing/provider/taskProvider.dart';
import 'package:AppCloudComputing/widgets/modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> list = ['1', '2'];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('App notas'),
      ),
      body: Stack(children: [
        Container(
          child: ListView.builder(
            itemCount: taskProvider.getTaskList.length,
            itemBuilder: (BuildContext context, int index) {
              if (taskProvider.getTaskList.length != 0) {
                return GestureDetector(
                  onTap: () {
                    taskProvider.finish();
                  },
                  child: ListTile(
                    title: Text(taskProvider.getTaskList[index].title),
                    subtitle: Text(taskProvider.getTaskList[index].description),
                    trailing: taskProvider.getIsDone
                        ? Icon(Icons.check)
                        : Icon(Icons.error_outline),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        taskProvider.getShowModal ? ModalWidget() : Container(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskProvider.modal();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
