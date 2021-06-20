import 'dart:io';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'dart:developer' as dev;

class LoadingScreen extends StatefulWidget
{

  late String _txtUsername;
  late String _txtPassword;
  LoadingScreen(String txtUsername, String txtPassword)
  {
    _txtUsername=txtUsername;
    _txtPassword=txtPassword;
  }
  @override
  _LoadingScreen createState()=> _LoadingScreen(_txtUsername,_txtPassword);
}

class _LoadingScreen extends State<LoadingScreen> with TickerProviderStateMixin
{
  late String _txtUsername;
  late String _txtPassword;
  _LoadingScreen(String txtUsername, String txtPassword)
  {
    _txtUsername=txtUsername;
    _txtPassword=txtPassword;
  }
  late Future <int> future;
  late GifController controller;

  @override
  void initState()
  {
    future=postFirstRun(_txtUsername, _txtPassword);
    super.initState();
    controller=GifController(vsync: this );
    controller.repeat(min:0,max:29,period:Duration(milliseconds:800));
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    Size size= MediaQuery.of(context).size;
    dev.log("loading screen init");
    return Scaffold(
      body:
          Container(
            alignment: Alignment.center,
            child: FutureBuilder <int>(
              future: future,
              builder: (context,snapshot)
              {
                if(snapshot.hasData)
                  {

                    if ((snapshot.data as int) == -3 )
                    {
                      return AlertDialog(
                        title: Text("Login failed"),
                        content: Text("You must have internet connection !") ,
                        actions: [
                          FlatButton(onPressed: (){    Navigator.pop(context,false);}, child: Text("OK"))
                        ],

                      );
                    }
                    if ((snapshot.data as int) == -2 )
                      {
                        return AlertDialog(
                          title: Text("Login failed"),
                          content: Text("Wrong username, password :(") ,
                          actions: [
                            FlatButton(onPressed: (){    Navigator.of(context).pop(true); }, child: Text("OK"))
                          ],

                        );
                      }
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    return HomeScreen();
                  }


                return Container(
                    alignment: Alignment.center,
                    child:  GifImage(
                      controller: controller,
                      image: AssetImage("assets/photos/loading.gif"),
                    )
                );
              },
            ),
            ),

      );

  }


  //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
}