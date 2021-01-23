import 'package:AppCloudComputing/pages/mainScreen.dart';
import 'package:AppCloudComputing/provider/taskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'homeScreen': (context) => HomeScreen()},
        initialRoute: 'homeScreen',
      ),
    );
  }
}
