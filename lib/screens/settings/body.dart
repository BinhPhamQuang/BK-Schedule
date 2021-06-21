import 'dart:io';

import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/constant.dart';
import 'package:bkschedule/main.dart';
import 'package:bkschedule/screens/components/appinfo.dart';
import 'package:bkschedule/screens/components/policidialog.dart';
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
                child: Image(image: AssetImage("assets/photos/logo.png"),width: size.width*0.6,)),
            Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(25, 18, 25, 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize:MainAxisSize.min,
                children: [
                  SwitchListTile(
                    value: false,
                    onChanged: (val){},
                    activeColor: kPrimaryColor,
                    title: Text("Automatic update timetable"),
                  ),
                  _buildDivicer(),
                  SwitchListTile(
                    value: true,
                    onChanged: (val){},
                    activeColor: kPrimaryColor,
                    title: Text("Show deadline for online courses"),
                  ),

                ],
              ),
            ),

            Card(
              elevation: 4,
              margin: EdgeInsets.fromLTRB(25, 18, 25, 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisSize:MainAxisSize.min,
                children: [

                  ListTile(
                    title: Text("Update timetable"),
                    leading: Icon(Icons.update,color: kPrimaryColor,),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () async {
                      Map<String,String> load= await loadStateLogin();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadingScreen(load["username"] as String,load["password"] as String)));
                    },
                  ),
                  _buildDivicer(),
                  ListTile(
                    title: Text("Terms & Conditions"),
                    leading: Icon(Icons.policy,color: kPrimaryColor,),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      showDialog(context: context, builder: (context)
                      {
                        return PolicyDialog(mdFileName: "term.md");
                      });
                    },
                  ),
                 _buildDivicer(),
                  ListTile(
                    title: Text("Privacy policy"),
                    leading: Icon(Icons.privacy_tip,color: kPrimaryColor,),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      showDialog(context: context, builder: (context)
                      {
                        return PolicyDialog(mdFileName: "privacy.md");
                      });
                    },
                  ),
                  _buildDivicer(),
                 ListTile(
                   title: Text("App info"),
                   leading: Icon(Icons.info_rounded,color: kPrimaryColor,),
                   trailing: Icon(Icons.keyboard_arrow_right),
                   onTap: (){
                     // showDialog(context: context, builder: (context)
                     // {
                     //   return AppInfo();
                     // });

                     showAboutDialog(context: context,applicationVersion: "1.01",  applicationName: "BKSchedule", children: [
                       Container(
                         child: Column(
                           children: [
                             //Image(image: AssetImage("assets/photos/logo.png"),),
                             Text("From HCMUT K18 with love !", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.pinkAccent ),),
                             SizedBox(height: 50,),
                             Text("Developed by",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.05, color: Colors.blueGrey ),),
                             SizedBox(height: 10,),
                             Text("Lie",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.07  ),),
                             SizedBox(height: 50,),
                             Text("Contact",style: TextStyle(fontWeight: FontWeight.normal,fontSize:size.width*0.05, color: Colors.blueGrey ),),
                             SizedBox(height: 10,),
                             Text("liebkschedule@gmail.com",style: TextStyle(fontWeight: FontWeight.normal,  ),),
                             SizedBox(height: 50,),
                             Text("All rights reserved !",style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blueGrey ),),
                           ],
                           mainAxisAlignment: MainAxisAlignment.start,
                         ),

                       ),




                     ]);

                   },
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
                    runApp(new MaterialApp(home: new MyApp(),));
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
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
