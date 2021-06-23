import 'dart:developer';
import 'dart:io';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/DTO/Semester.dart';
import 'package:bkschedule/DTO/Subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'components.dart';
class SchedulesScreen extends StatefulWidget {

 _SchedulesScreen createState() => _SchedulesScreen();

}

class _SchedulesScreen extends State<SchedulesScreen>
{
  Future <List<Semester>> futureSemesters=getAllSemester();
  @override
  void initState()
  {
    super.initState();
    futureSemesters=getAllSemester();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  FutureBuilder <List<Semester>> (
        future: futureSemesters,
        builder: (context,snapshot)
        {

          if (snapshot.hasData)
          {
            List <Semester> data= snapshot.data as List<Semester>;
            List <Widget> semesters=[];
            List <Tab> tabs=[];
            data.forEach((element) {
              tabs.add(Tab(text: element.semester,));
              semesters.add(ScheduleSemester(semester: element,));
            });


            return   DefaultTabController(
              length: data.length,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading:false,
                  backgroundColor: kPrimaryColor,
                    // centerTitle: true,
                    // leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () =>Navigator.pop(context,false)  ,),
                    // title: Text("All Schedules", textAlign:TextAlign.center,),
                  title: TabBar(
                    labelStyle: TextStyle(fontSize:  size.width*0.043),
                    indicatorWeight: 5,
                    indicatorColor: kPrimaryLightColor,
                    isScrollable: true,
                    tabs:  tabs,
                  ),
                ),
                body: Container(

                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children:  semesters,

                  ),
                ),
              ),
            );
          }
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                width: size.width*0.1,
                height: size.width*0.1,
                child: CircularProgressIndicator(),
              )]
          );
        }

      ),



    );
  }
}



class ScheduleSemester extends StatelessWidget {
  final Semester semester;


  const ScheduleSemester({
    Key? key, required this.semester,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> subjects=[];
    (semester.subjects as List<Subject>).forEach((element) {
      subjects.add(ItemScheduleSubject(clas: element.clas, course_id: element.course_id, course_name: element.course_name, room: element.room, thu: element.thu, tiet: element.tiet, week:  parseWeek(element.week)));
    });
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children:subjects,
        ),
      ),
    );
  }
}




