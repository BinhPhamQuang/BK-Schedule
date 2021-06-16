import 'package:flutter/material.dart';

import '../../constant.dart';
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      type: BottomNavigationBarType.shifting,
      items:[

        BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.schema_outlined),
            title: Text("Schedule")
        ),
        BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.home),
            title: Text("Home")
        ),
        BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: Icon(Icons.school_sharp),
            title: Text("Test Schedule")
        ),
      ],
    );
  }
}