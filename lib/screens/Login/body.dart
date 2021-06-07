import 'package:bkschedule/constant.dart';
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
            left: 0,
            top: 0,
            child:  Image(image: AssetImage("assets/photos/main_top.png"), width: size.width*0.35,),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image(image: AssetImage("assets/photos/login_bottom.png"),width: size.width*0.3,)
          ),


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
                            suffixIcon: Icon(Icons.visibility,color: kPrimaryColor,)
                          ),
                        ),
                    ),
                    RoundedButton(
                      text: "LOGIN", color: kPrimaryColor,
                      press: (){

                      },
                      textcolor: Colors.white,
                    ),

                  ],
                ),
              ),),
        ],
      ),
    );
  }
}



