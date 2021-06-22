import 'package:bkschedule/DTO/Tests.dart';
import 'package:bkschedule/screens/Schedules/components.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';


class LayoutTests extends StatelessWidget {
  final List<Test> tests;
  final bool is_midterm;
  const LayoutTests({Key? key, required this.tests,required this.is_midterm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> examDetails= [];
    tests.forEach((element) {
      examDetails.add(ExamDetail(test: element, is_midterm: is_midterm));
    });
    return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            children: examDetails,
          ),
        ),
    );
  }
}


class ExamDetail extends StatelessWidget {
  final Test test;
  final bool is_midterm;
  const ExamDetail({Key? key, required this.test,required this.is_midterm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date=test.finalterm.date;
    String room=test.finalterm.room;
    String hour=test.finalterm.hour;
    if (is_midterm)
      {
          date=test.midterm.date;
          room=test.midterm.room;
          hour=test.midterm.hour;
      }
    if(date=='/'|| date=='--')
      {
        return Container();
      }
    Size size= MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kPrimaryColor, width: 2),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                test.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width*0.05,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                test.clas,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width*0.042,
                ),
              ),
              Text(
                test.id,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width*0.042,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelDate(text: date),
              LabelDate(text: room),
              LabelDate(text: hour),
            ],
          ),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}



class ItemTest extends StatelessWidget {
  final List<Test> tests;
  const ItemTest({Key? key,required this.tests}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: DefaultTabController(
          length: 2,
          child:  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: TabBar(
                isScrollable: true,
                unselectedLabelColor: kPrimaryColor,
                indicator: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kPrimaryColor,width: 3 )
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Mid term"),
                      ),
                    ),
                    ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kPrimaryColor,width: 3 ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Final term"),
                      ),
                    ),
                  ),],

              ),
            ),
            body: Container(
              child: TabBarView(
                children: [
                  LayoutTests(tests: tests, is_midterm: true),
                 LayoutTests(tests: tests, is_midterm: false)
                ],

              ),
            ),
          )

        ),
    );

  }
}
