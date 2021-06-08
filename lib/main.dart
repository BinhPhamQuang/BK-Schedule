import 'package:bkschedule/screens/AddTask/add_task.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/Login/login.dart';
import 'package:bkschedule/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter',
        home: LoginScreen(),
      );
  }
  
}
