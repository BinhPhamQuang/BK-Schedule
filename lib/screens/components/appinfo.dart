import 'package:bkschedule/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AppInfo extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 200,
          padding: EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/photos/logo.png"),),
                    SizedBox(height: 50,),
                    Text("version 1.01",style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blueGrey ),),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text("Author",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.05, color: Colors.blueGrey ),),
                    SizedBox(height: 10,),
                    Text("Lie",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.06  ),),
                    SizedBox(height: 50,),
                    Text("Contact",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.05, color: Colors.blueGrey ),),
                    SizedBox(height: 10,),
                    Text("liebkschedule@gmail.com",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.06  ),),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Text("All rights reserved",style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blueGrey ),),

              FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: ()=>Navigator.of(context).pop(),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Close", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}