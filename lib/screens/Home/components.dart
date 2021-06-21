
import 'dart:developer';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/DTO/Task.dart';
import 'package:bkschedule/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ItemTask extends StatelessWidget {

  final Task task;

   ItemTask({
    Key? key,
    required this.size, required this.task
  }) : super(key: key);

  final Size size;
  late var color;
  late var background= kPrimaryLightColor;
  late var borderColor= kPrimaryColor;
  late int time_remaining;
  int caculateTimeRemaining()
  {
    DateTime now= DateTime.now();
    int between= (task.date.difference(now).inHours/24).round();

    if (between<=1)
      {
        background= Color(0xFFFFDEDC);
        color=Colors.redAccent;
        borderColor=Color(0xFFFF9C96);
      }
    else if(between>1 && between<=3)
      {
        color=Colors.deepOrange;
        borderColor=Color(0xFFF9D350);
        background=Color(0xFFFFF7DB);
      }
    else
      {
        color=Colors.green;
      }
    return between;
  }
  @override
  Widget build(BuildContext context) {
    time_remaining=caculateTimeRemaining();
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor,width: 3),
          borderRadius: BorderRadius.circular(20),
          color: background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deadline",style: TextStyle(fontSize: size.height*0.023,color: Colors.blueGrey,fontWeight: FontWeight.normal),),
          SizedBox(height: 5,),
          Row(
            children: [
              Container(
                width: size.height*0.02,
                height: size.height*0.02,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(width: 10,),
              Text(DateFormat.yMMMd().format(task.date),style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Text(task.time,style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 20,),
          Container(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(task.title,style: TextStyle(fontSize: size.height*0.03,color: Colors.black,fontWeight: FontWeight.bold),)
              )
          ),
          SizedBox(height: 5,),
        Container(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Text(task.course,style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.normal),))),
        ],
      ),
    );
  }
}

class ItemClass extends StatelessWidget {
  final String nameClass;
  final String room;
  final String timeStart;
  final String timeEnd;


  const ItemClass({
    Key? key,
    required this.size, required this.nameClass, required this.room, required this.timeStart, required this.timeEnd  ,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {


    return Container(
      width: size.width,
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(
        color: kTextBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: size.width*0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(timeStart,
                  style: TextStyle(fontSize: size.height*0.031,color: Colors.black,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:10,right: 10),
            width: 1,
            height: size.height*0.1,
            decoration: BoxDecoration(color: Colors.blueGrey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                 Container(
                   width: size.width*0.58,
                   child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                            child: Text(nameClass,style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.bold) )
                        ),
                 ),

                ],
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: kSectionColor,
                    size: size.height*0.023,
                  ),
                  Text("Room: ",style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.normal),),
                  Text(room,style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.normal),),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: kSectionColor,
                    size: size.height*0.023,

                  ),
                  Text(timeStart,style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.normal),),
                  Text(" - ",style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.normal),),
                  Text(timeEnd,style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.normal),),
                ],
              )
            ],

          ),

        ],
      ),
    );
  }
}

class TopLabel extends StatelessWidget {
  const TopLabel({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String date= DateFormat("EEEE").format(now).toString()+" ";
    String day=DateFormat("d").format(now).toString()+" "+DateFormat("MMM").format(now).toString();
    return Container(
      padding: EdgeInsets.only(top: 35,bottom: 15,left: 20,right: 20),
      width: double.infinity,

      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  Text("Hello ",style: TextStyle(fontSize: size.width*0.07,color: Colors.white,fontWeight: FontWeight.normal),),
                  Text("",style: TextStyle(fontSize: size.width*0.07,color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: date,
                  style: TextStyle(
                      fontSize: size.width*0.05,
                      fontWeight: FontWeight.w900
                  ),
                  children: [
                    TextSpan(
                      text: day,
                      style: TextStyle(
                        fontSize: size.width*0.05,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),

    );
  }
}