import 'package:bkschedule/constant.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color color,textcolor;
  const RoundedButton({Key? key, this.text="LOGIN", this.press, required this.color, required this.textcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      height: size.height*0.08,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
          color: color,
          onPressed: (){},
          child: Text(
                text,
                style: TextStyle(color: textcolor),
          ),
        ),

      ),
    );
  }
}
