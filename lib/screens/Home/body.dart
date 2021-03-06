
import 'dart:math';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/DTO/Subject.dart';
import 'package:bkschedule/DTO/Task.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/Schedules/body.dart';
import 'package:bkschedule/screens/Tests/tests.dart';
import 'package:bkschedule/screens/settings/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as dev;
import 'dart:io';
import 'home.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreen createState() => _HomeScreen();
  const HomeScreen({Key? key}) : super(key: key);

}

class _HomeScreen extends State<HomeScreen>
{
  late Future <List<Subject>> futureData;
  late Future <List<Task>> futureTask;
  late Future <int> futureStatusTests;
  int selectedIndex=1;


  @override
  void initState()
  {
    futureData=getTodaySubject();
    futureTask= loadDeadline();
    futureStatusTests= getStatusTests();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    Widget _schedules= SchedulesScreen();
    Widget _home= HomeBody(futureData: futureData,futureTask:futureTask);
    Widget _settings= SettingsScreen();
    Widget tests= TestsScreen(getStatus: futureStatusTests,);

    void onTapHander(int index)
    {
        setState(() {
          this.selectedIndex=index;
        });

    }

    Widget getBody()
    {
      if(selectedIndex==0)
        {
          return _schedules;
        }
      else if (selectedIndex==1)
        {
          return _home;
        }
      else if(selectedIndex==3)
        {
          return _settings;
        }
      return tests;
    }
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items:[
          BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(Icons.schema_outlined),
              title: Text("Timetable")
          ),
          BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(Icons.home),
              title: Text("Home")
          ),
          BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(Icons.school_sharp),
              title: Text("Exams schedule")
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
              icon: Icon(Icons.settings),
                title: Text("Settings"),
          ),
        ],
        onTap: (int index){
          onTapHander(index);
        },
      ),
    );
  }


}











