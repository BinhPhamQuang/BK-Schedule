import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/screens/Home/body.dart';
import 'package:bkschedule/screens/components/TextBoxContainer.dart';
import 'package:bkschedule/screens/components/policidialog.dart';
import 'package:bkschedule/screens/components/rounded_button.dart';
import 'package:bkschedule/screens/components/rounded_input_field.dart';
import 'package:bkschedule/screens/loading/loadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {

  @override
  Background  createState() => Background();
}

class Background extends State<Body > {
  final txtUsername=TextEditingController();
  final txtPassword= TextEditingController();
  bool _isObscure=true;
  @override
  void dispose()
  {
    txtUsername.dispose();
    txtPassword.dispose();
    super.dispose();
  }
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
                    TextBoxContainer(
                      child: TextField(
                        controller: txtUsername,
                        decoration: InputDecoration(
                          hintText: "Username",
                          icon: Icon(Icons.person,color: kPrimaryColor,
                          ),
                          border: InputBorder.none,
                          //suffixIcon: Icon(Icons.visibility,color: kPrimaryColor,)
                        ),
                      ),
                    ),
                    TextBoxContainer(
                        child: TextField(
                          controller: txtPassword,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock,color: kPrimaryColor,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon:Icon( _isObscure ? Icons.visibility : Icons.visibility_off,color: kPrimaryColor),
                              onPressed: (){
                                setState(() {
                                  _isObscure= ! _isObscure;
                                });
                              },
                            )
                          ),
                        ),
                    ),
                    Container(
                      width: size.width*0.8,
                      height: size.height*0.075,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: RaisedButton(
                          //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                          color: kPrimaryColor,
                          onPressed: () {
                            if(txtUsername.text.length!=0 && txtPassword.text.length!=0)
                            {
                              String username= txtUsername.text;
                              String password= txtPassword.text;
                              txtUsername.clear();
                              txtPassword.clear();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadingScreen(username,password)));
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white,fontSize: size.width*0.05 ),
                          ),
                        ),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    TextButton(
                    child: Text("Privacy policy"),
                    onPressed: () {
                      showDialog(context: context, builder: (context)
                      {
                        return PolicyDialog(mdFileName: "privacy.md");
                      });
                    },
                    ),
                        TextButton(
                          child: Text("Terms & Conditions"),
                          onPressed: () {
                            showDialog(context: context, builder: (context)
                            {
                              return PolicyDialog(mdFileName: "term.md");
                            });
                          },
                        ),

                    ]
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



