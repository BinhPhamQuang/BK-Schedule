
// @dart=2.9
import 'dart:io';

import 'package:bkschedule/screens/AddTask/add_task.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/Login/login.dart';
import 'package:bkschedule/screens/Schedules/body.dart';
import 'package:bkschedule/screens/loading/loadingScreen.dart';
import 'package:bkschedule/test.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());

}

Future<Widget> getWidget()
async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/user.txt');
  final file1= File('${directory.path}/amy_file.txt');
  if (file.existsSync()&& file1.existsSync())
    {
      return HomeScreen();
    }
  return LoginScreen();
}
class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'bkSchedule',
        home: FutureBuilder <Widget>(
          future: getWidget(),
          builder: (context,snapshot)
          {
            if (snapshot.hasData)
              {
                return snapshot.data as Widget;
              }

            return CircularProgressIndicator();
          },
        ),
      );
  }
  
}
