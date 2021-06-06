import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/components/rounded_button.dart';
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
            child:  Image(image: AssetImage("assets/photos/main_top.png"), width: size.width*0.2,),
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
                    RoundedButton(text: "LOGIN", color: kPrimaryColor,press: (){},textcolor: Colors.white,),

                  ],
                ),
              ),),
        ],
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key, required this.hintText,  this.icon=Icons.person, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBoxContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
                icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextBoxContainer extends StatelessWidget {
  final Widget child;
  const TextBoxContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,),
      width: size.width*0.8,
      height: size.height*0.08,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}