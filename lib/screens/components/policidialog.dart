import 'package:bkschedule/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget
{
   final String mdFileName;

  const PolicyDialog({Key? key, required this.mdFileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: rootBundle.loadString('assets/photos/$mdFileName') ,
                builder: (context,snapshot)
                {
                  if (snapshot.hasData)
                    {
                      return Markdown(
                        data: snapshot.data as String,
                      );
                    }
                  return Center( child:CircularProgressIndicator());
                },
              )
          ),
          FlatButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),

              ),
              onPressed: ()=>Navigator.of(context).pop(),
              child: Container(
                alignment: Alignment.center,
                child: Text("Close", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),),
              )
          ),

        ],
      ),
    );
  }
  
}