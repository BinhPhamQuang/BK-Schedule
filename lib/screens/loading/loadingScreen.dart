import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/Login/login.dart';
import 'package:flutter/material.dart';


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

class _LoadingScreen extends State<LoadingScreen>
{
  late String _txtUsername;
  late String _txtPassword;
  _LoadingScreen(String txtUsername, String txtPassword)
  {
    _txtUsername=txtUsername;
    _txtPassword=txtPassword;
  }
  @override
  void initState()
  {
    super.initState();
  }
  // @override
  // void dispose()
  // {
  //   super.dispose();
  //   _txtPassword.dispose();
  //   _txtUsername.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body:
          Container(
            alignment: Alignment.center,
            child: FutureBuilder <int>(
              future: postFirstRun(_txtUsername, _txtPassword),
              builder: (context,snapshot)
              {
                if(snapshot.hasData)
                  {
                    if ((snapshot.data as int) == -2 )
                      {
                        return AlertDialog(
                          title: Text("Login failed"),
                          content: Text("Wrong username, password :(") ,
                          actions: [
                            FlatButton(onPressed: (){    Navigator.pop(context,false);}, child: Text("OK"))
                          ],

                        );
                      }
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    return HomeScreen();
                  }
                return CircularProgressIndicator();
              },
            ),
            ),

      );

  }


  //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
}