import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopLabel(size: size),

            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Column(
                  children: [
                    Row(
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
                        IconButton(onPressed: (){}, icon: Icon(
                          Icons.create_sharp,
                          size:size.width*0.065,
                          color: kSectionColor,
                        ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),

                    //add data
                    ItemClass(size: size,nameClass: "Database system",timeStart: "10:00",timeEnd: "20:00",room: "602 H6",isAm: "AM",),
                    ItemClass(size: size,nameClass: "Principle programing language",timeStart: "11:20",timeEnd: "20:00",room: "602 H6",isAm: "AM",),
                    ItemClass(size: size,nameClass: "Computer networking",timeStart: "10:00",timeEnd: "12:30",room: "602 H6",isAm: "PM",),
                    SizedBox(height: 20,),
                    Row(
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
                        // Text("Button edit",style: TextStyle(
                        //   fontSize: size.width*0.07,
                        //   fontWeight: FontWeight.normal,
                        //   color: kSectionColor,
                        // ),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ItemTask(size: size,nameTask: "Principle programing language",timeRemaining: 3,),
                          ItemTask(size: size,nameTask: "Database system",timeRemaining: 4,),
                          ItemTask(size: size,nameTask: "Computer networking",timeRemaining: 5,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class ItemTask extends StatelessWidget {
  final int timeRemaining;
  final String nameTask;
  const ItemTask({
    Key? key,
    required this.size, required this.timeRemaining, required this.nameTask,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      width: size.width*0.38,
      height: size.width*0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kTextBoxColor
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
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(width: 5,),
              Text(timeRemaining.toString(),style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Text("days left",style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 20,),
          Text(nameTask,style: TextStyle(fontSize: size.height*0.03,color: Colors.black,fontWeight: FontWeight.bold),),
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

  final String isAm;
  const ItemClass({
    Key? key,
    required this.size, required this.nameClass, required this.room, required this.timeStart, required this.timeEnd , required this.isAm,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      height: size.height*0.14,
      decoration: BoxDecoration(
        color: kTextBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(timeStart,
              style: TextStyle(fontSize: size.height*0.031,color: Colors.black,fontWeight: FontWeight.bold),),
              Text(isAm,style: TextStyle(fontSize: size.height*0.025,color: Colors.black,fontWeight: FontWeight.bold),),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left:10,right: 10),
            width: 1,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameClass,style: TextStyle(fontSize: size.height*0.023,color: Colors.black,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 35),
      width: double.infinity,
      height: size.height*0.18,
      decoration: BoxDecoration(
        color: kLabelColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                text: "Wed",
                style: TextStyle(
                  fontSize: size.width*0.04,
                  fontWeight: FontWeight.w900
                ),
                children: [
                  TextSpan(
                    text: " 10 Oct",
                    style: TextStyle(
                      fontSize: size.width*0.04,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

          ),

        ],
      ),

    );
  }
}



