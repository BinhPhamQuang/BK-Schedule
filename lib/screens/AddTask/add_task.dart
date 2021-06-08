import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/components/TextBoxContainer.dart';
import 'package:flutter/material.dart';

class AddClass extends StatelessWidget {
  const AddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
 
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              width: size.width,
              decoration: BoxDecoration(
                color: kLabelColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(

                    onPressed: (){print('clicked');},
                      icon: Icon(
                    Icons.keyboard_arrow_left,
                    size: size.height*0.111,
                    color: Colors.white,
                  )
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Create new task",
                    style: TextStyle(
                      fontSize: size.width*0.09,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Text("Title",style: TextStyle(color: Colors.white70, fontSize: size.width*0.055),),
                  TextFiledEdited(labelText:"Title",width: size.width,),
                  //Text("Date",style: TextStyle(color: Colors.white70, fontSize: size.width*0.055),),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFiledEdited(labelText:"Date",width: size.width*0.7),
                      SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),

                        child: IconButton(
                          icon: Icon(Icons.calendar_today,color: kSectionColor,), onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class TextFiledEdited extends StatelessWidget {
  final double width;

  final String labelText;
  const TextFiledEdited({
    Key? key, required this.width, required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(

      width: width,
      child: TextField(
        style: TextStyle(
            fontSize: size.width*0.05 ,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: labelText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(width: 2,color:Colors.white),
          ),
          focusedBorder:UnderlineInputBorder(
            borderSide: BorderSide(width: 2,color:Colors.indigo),
          ),
        ),
      ),
    );
  }
}
