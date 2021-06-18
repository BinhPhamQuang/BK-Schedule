import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/components/TextBoxContainer.dart';
import 'package:bkschedule/screens/components/rounded_button.dart';
import 'package:bkschedule/screens/components/rounded_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Background();
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/photos/logo.png"), width: size.width*0.6,
                    ),
                    SvgPicture.asset(
                      "assets/photos/login.svg",
                      width: size.width*0.7,),
                    RoundedInputField(hintText: "Your username", onChanged: (value){},
                    ),

                    TextBoxContainer(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock,color: kPrimaryColor,
                            ),
                            border: InputBorder.none,
                            //suffixIcon: Icon(Icons.visibility,color: kPrimaryColor,)
                          ),
                        ),
                    ),
                    RoundedButton(
                      text: "LOGIN", color: kPrimaryColor,

                      textcolor: Colors.white,
                    ),
                    TextButton(

                      child: Text("Điều khoản sử dụng"),
                      onPressed: () {  },
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



