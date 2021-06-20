import 'dart:io';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/main.dart';
import 'package:bkschedule/screens/components/rounded_button.dart';
import 'package:bkschedule/screens/loading/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: size.width*0.1),
                child: Image(image: AssetImage("assets/photos/logo.png"),width: size.width*0.8,)),

            Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(25, 18, 25, 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisSize:MainAxisSize.min,
                children: [
                   SwitchListTile(
                       value: true,
                       onChanged: (val){},
                       activeColor: kPrimaryColor,
                       title: Text("Hiện deadline các khóa học online"),
                   ),
                  _buildDivicer(),
                  // SwitchListTile(
                  //   value: true,
                  //   onChanged: (val){},
                  //   activeColor: kPrimaryColor,
                  //   title: Text("Tự động cập nhật thời khóa biểu"),
                  // ),
                  // _buildDivicer(),

                  ListTile(
                    title: Text("Refresh thời khóa biểu"),
                    leading: Icon(Icons.refresh,color: kPrimaryColor,),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () async {
                      Map<String,String> load= await loadStateLogin();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadingScreen(load["username"] as String,load["password"] as String)));
                    },
                  ),
                  _buildDivicer(),
                  ListTile(
                    title: Text("Điều khoản sử dụng"),
                    leading: Icon(Icons.info,color: kPrimaryColor,),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                 _buildDivicer(),
                 ListTile(
                   title: Text("App info"),
                   leading: Icon(Icons.info,color: kPrimaryColor,),
                   trailing: Icon(Icons.keyboard_arrow_right),
                   onTap: (){},
                 ),

                ],
              ),
            ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color:Colors.red)
                    ))
                  ),
                  child: Text("Sign out ",style: TextStyle(color: Colors.red,fontSize: size.width*0.05),),
                  onPressed: () async{
                    final directory= await getApplicationDocumentsDirectory();
                    final file = File('${directory.path}/user.txt');
                    if( file.existsSync())
                      {
                        try {
                          await file.delete();
                        }
                        catch(e)
                        {
                        }
                      }
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                  },

                  ),
            ),


          ],

        )

    );
  }
}
Container _buildDivicer()
{
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    width: double.infinity,
    height: 0.3,
    color: Colors.blueGrey,
  );
}
