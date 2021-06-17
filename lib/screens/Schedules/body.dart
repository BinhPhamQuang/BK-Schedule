import 'dart:io';

import 'package:flutter/material.dart';

import '../../constant.dart';
import 'components.dart';
class SchedulesScreen extends StatelessWidget {
  const SchedulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.pop(context,false)  ,),
            title: Text("All Schedules", textAlign:TextAlign.center,),
            bottom: TabBar(
              labelStyle: TextStyle(fontSize:  size.width*0.043),
              indicatorWeight: 5,
              indicatorColor: kPrimaryLightColor,
              isScrollable: true,
              tabs: [
                Tab(text: "111111111111111111",),
                Tab(text: "2222222222222222222",),
                Tab(text: "333333333333333",),
                Tab(text: "544444444444",),
                Tab(text: "555555555555",),
                Tab(text: "6666666666",),
              ],
            ),
          ),
      body: Container(
        child: TabBarView(
          children: [
           ScheduleSemester(),
            ScheduleSemester(),
            ScheduleSemester(),
            ScheduleSemester(),
            ScheduleSemester(),
            ScheduleSemester(),
          ],

        ),
      ),
        ),
      ),
    );
  }
}

class ScheduleSemester extends StatelessWidget {
  const ScheduleSemester({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ItemScheduleSubject(clas: "L01", course_id: "CO1005", course_name: "Principle programing language",room: "602H1",thu: "2",tiet: "2-5",week: "--|01|02|03|04|--|06",),
            ItemScheduleSubject(clas: "L01", course_id: "CO1005", course_name: "Principle programing language",room: "602H1",thu: "2",tiet: "2-5",week: "--|01|02|03|04|--|06",),
            ItemScheduleSubject(clas: "L01", course_id: "CO1005", course_name: "Principle programing language",room: "602H1",thu: "2",tiet: "2-5",week: "--|01|02|03|04|--|06",),
            ItemScheduleSubject(clas: "L01", course_id: "CO1005", course_name: "Principle programing language",room: "602H1",thu: "2",tiet: "2-5",week: "--|01|02|03|04|--|06",),
            ItemScheduleSubject(clas: "L01", course_id: "CO1005", course_name: "Principle programing language",room: "602H1",thu: "2",tiet: "2-5",week: "--|01|02|03|04|--|06",),
            ItemScheduleSubject(clas: "L01", course_id: "CO1005", course_name: "Principle programing language",room: "602H1",thu: "2",tiet: "2-5",week: "--|01|02|03|04|--|06",),

          ],
        ),
      ),
    );
  }
}




