import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class LabelDate extends StatelessWidget {
  final String text;
  const LabelDate({
    Key? key, required this.text,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      width: size.width*0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          text,
          style: TextStyle(
            fontSize: size.width*0.045,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


class ItemScheduleSubject extends StatelessWidget {
  final String clas;
  final String course_id;
  final String course_name;

  final String room;
  final String thu;
  final String tiet;
  final String week;

  const ItemScheduleSubject({
    Key? key, required this.clas, required this.course_id, required this.course_name,  required this.room, required this.thu, required this.tiet, required this.week,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                course_name,
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
                clas,

                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width*0.042,
                ),
              ),
              Text(
                course_id,
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
              LabelDate(text: "Thứ "+thu),
              LabelDate(text: room),
              LabelDate(text: tiet),
            ],
          ),
          SizedBox(height: 10,),
          Text(
            week,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey,
              fontSize: size.width*0.042,
            ),
          ),
        ],
      ),
    );
  }
}