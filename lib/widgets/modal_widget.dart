import 'package:AppCloudComputing/model/taskModel.dart';
import 'package:AppCloudComputing/provider/taskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModalWidget extends StatefulWidget {
  @override
  _ModalWidgetState createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  String _title = '';
  String _description = '';
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    final _screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.shade200,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: _screenSize.width * 0.85,
            height: _screenSize.height * 0.6,
            child: Card(
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Crear tarea',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre Tarea',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _title = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Tarea',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _description = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          taskProvider.createTak(Task(
                              title: _title,
                              description: _description,
                              status: 'do'));
                          taskProvider.modal();
                        },
                        child: Text('Guardar'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
