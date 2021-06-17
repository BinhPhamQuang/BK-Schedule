import 'dart:math';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/DTO/Task.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom-navigation.dart';
import 'components.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreen createState() => _HomeScreen();
  const HomeScreen({Key? key}) : super(key: key);

}

class _HomeScreen extends State<HomeScreen>
{
  Future <List<Subject>> futureData=getTodaySubject();

  @override
  void initState()
  {
    super.initState();
    futureData=getTodaySubject();
  }
  @override
  Widget build(BuildContext context) {
    //List<Subject> lst_class=  getTodaySubject();
    var lst_class=[

    ];
    var lst_task=[
      Task("Database system", "MT1005", 1),
      Task("Database system", "MT1005", 1),
      Task("Database system", "MT1005", 1)
    ];
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            TopLabel(size: size),
            Container(

              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical:  0,horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Today classes",
                            style: TextStyle(
                              fontSize: size.width*0.065,
                              fontWeight: FontWeight.bold,
                              color: kSectionColor,
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){print('clicked');}, icon: Icon(
                          Icons.create_sharp,
                          size:size.width*0.065,
                          color: kSectionColor,
                        ),
                        ),
                      ],
                    ),
                  ),
                  Container(

                    child: FutureBuilder <List<Subject>>(
                      future: futureData,
                      builder: (context,snapshot)
                      {
                        if(snapshot.hasData)
                          {
                             List<Subject> data= snapshot.data as List<Subject>;
                             if (data.length==0)
                               {
                                 return Text("Do not need go to school today ^-^", style: TextStyle(fontSize: size.width*0.05, color: Colors.blueGrey),);
                               }
                             return
                                 ListView.builder(
                                   padding: EdgeInsets.zero,
                                   physics: NeverScrollableScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount: data.length,
                                   itemBuilder: (BuildContext context,int index)
                                   {
                                     return ListTile(title:ItemClass(size: size,nameClass: data[index].course_name,timeStart: data[index].time_start,timeEnd: data[index].time_end,room: data[index].room,) ,);
                                   },
                                 );
                          }
                        else if (snapshot.hasError)
                          {
                            return Text("${snapshot.error}");
                          }

                        return CircularProgressIndicator();
                      },
                    ) ,

                    // child: ListView.builder(
                    //   padding: EdgeInsets.zero,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemCount: lst_class.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return ListTile(title:ItemClass(size: size,nameClass: lst_class[index].course_name,timeStart: lst_class[index].time_start,timeEnd: lst_class[index].time_end,room: lst_class[index].room,isAm: "AM",) ,);
                    //   },
                    // ),
                  ),

                  //add data
                  //ItemClass(size: size,nameClass: "Database system",timeStart: "10:00",timeEnd: "20:00",room: "602 H6",isAm: "AM",),
                  //  ItemClass(size: size,nameClass: "Principle programing language",timeStart: "11:20",timeEnd: "20:00",room: "602 H6",isAm: "AM",),
                  //  ItemClass(size: size,nameClass: "Computer networking",timeStart: "10:00",timeEnd: "12:30",room: "602 H6",isAm: "PM",),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Your tasks",
                            style: TextStyle(
                              fontSize: size.width*0.065,
                              fontWeight: FontWeight.bold,
                              color: kSectionColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //return ListTile(title: ItemTask(size: size,nameTask: lst_task[index].name,timeRemaining: lst_task[index].dayRemaining,),);
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        
                        children: [
                          ItemTask(size: size,nameTask: "Principle programing language",timeRemaining: 3,),
                          ItemTask(size: size,nameTask: "Database system",timeRemaining: 4,),
                          ItemTask(size: size,nameTask: "Computer networking",timeRemaining: 5,),
                          ItemTask(size: size,nameTask: "Computer networking",timeRemaining: 5,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

}





