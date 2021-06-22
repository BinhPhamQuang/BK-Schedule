import 'package:bkschedule/DTO/Class.dart';
import 'package:bkschedule/DTO/Tests.dart';
import 'package:bkschedule/screens/Tests/components.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({Key? key}) : super(key: key);

  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  late Future <int> getStatus;
  late Future <List<Tests>> tests;
  @override
  void initState()
  {
    getStatus= getStatusTests();
    tests=loadTests();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: getStatus,
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
            {
              int status= snapshot.data as int;
              if(status==1)
                {
                 return FutureBuilder <List<Tests>>(
                   future: tests,
                   builder: (context,snapshot)
                   {
                     if(snapshot.hasData)
                       {
                         List<Tests> data= snapshot.data as List<Tests>;
                         List<Widget> widgets=[];
                         List<Tab> tabs=[];
                         data.forEach((element) {
                           tabs.add(Tab(text: element.title,));
                           widgets.add(ItemTest(tests: element.tests));
                         });
                         return DefaultTabController(
                             length: data.length,
                             child: Scaffold(
                                appBar: AppBar(
                                  backgroundColor: kPrimaryColor,
                                  title: TabBar(
                                    labelStyle: TextStyle(fontSize:  size.width*0.043),
                                    indicatorWeight: 5,
                                    indicatorColor: kPrimaryLightColor,
                                    isScrollable: true,
                                    tabs:  tabs,
                                  ),
                                ),
                               body: Container(
                                 child: TabBarView(
                                   physics: NeverScrollableScrollPhysics(),
                                   children: widgets,
                                 ),
                               ),
                             ));
                       }
                     return Center(child: CircularProgressIndicator(),);
                   },
                 );
                }
              else if(status==-3)
                {
                  return Center(child: Text("An errors has occurred  \nSign out and try again :(",style: TextStyle(color: Colors.redAccent,fontSize:size.width*0.05 ),),);
                }
            }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
