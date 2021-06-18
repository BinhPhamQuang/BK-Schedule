import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/DTO/Subject.dart';
import 'package:bkschedule/screens/Home/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,

    required this.futureData,
  }) : super(key: key);

  final Future<List<Subject>> futureData;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return
      SingleChildScrollView(
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
                            return Text("Hôm nay được nghỉ ^-^", style: TextStyle(fontSize: size.width*0.05, color: Colors.blueGrey),);
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
                  ),

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
      );


  }
}