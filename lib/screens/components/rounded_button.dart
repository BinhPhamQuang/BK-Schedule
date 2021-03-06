import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/loading/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
class RoundedButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color color,textcolor;
  final String txtUsername;
  final String txtPassword;
  const RoundedButton({Key? key, this.text="LOGIN", this.press, required this.color, required this.textcolor, required this.txtUsername, required this.txtPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      height: size.height*0.08,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: RaisedButton(
          //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          color: color,
          onPressed: () {
            print(txtUsername);
            if(txtUsername.length!=0 && txtPassword.length!=0)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadingScreen(txtUsername,txtPassword)));

            }


            },
          child: Text(
                text,
                style: TextStyle(color: textcolor),
          ),
        ),

      ),
    );
  }
}


Route _createRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
