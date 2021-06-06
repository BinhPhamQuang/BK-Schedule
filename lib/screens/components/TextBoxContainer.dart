import 'package:flutter/material.dart';

import '../../constant.dart';
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