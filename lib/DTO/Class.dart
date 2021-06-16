import 'dart:developer';
import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

class Semester
{
  late String last_update;
  late String semester;
  late List<Subject> subjects;

  Semester(this.last_update, this.semester, this.subjects);
  
  factory Semester.convertJsonObject(dynamic json)
  {
    List<Subject> lst= [];
    (json["subjects"] as List).forEach((element) {
      lst.add(Subject.convertJsonObject(element));
    });
    return Semester(json["last_update"], json["semester"], lst);
  }

}
class Subject
{
  late String clas;
  late String course_id;
  late String course_name;
  late String location;
  late String room;
  late String tc;
  late String thu;
  late String tiet;
  late String time_end;
  late String time_start;
  late List<int> week;

  Subject(this.clas, this.course_id, this.course_name, this.location, this.room,
      this.tc, this.thu, this.tiet, this.time_end, this.time_start, this.week);

  factory Subject.convertJsonObject(dynamic json)
  {
    return Subject(json["class"], json["course_id"], json["course_name"], json["location"], json["room"], json["tc"], json["thu"], json["tiet"], json["time_end"], json["time_start"], json["week"].cast<int>());
  }
}


dynamic dates={"Monday":2,"Tuesday":3,"Wednesday":4,"Thursday":5,"Friday":6,"Satuday":7,"Sunday":8};

var current_week=-1;


List<Subject> getSubjectForToday(Semester semester)
{
  current_week=14;

  List<Subject> result=[];
  semester.subjects.forEach((element) {
    if (element.thu==dates[DateFormat('EEEE').format(DateTime.now())].toString())
    {
      if (element.week.contains(current_week) )
      {
        result.add(element);
      }
    }
  });


  return result;
}

Future<List<Subject>> getTodaySubject()
async {

  List<Semester> lst= await getRun("tSi6NcXaY5Rf") ;
  List<Subject> result=[];
  var t=dates[DateFormat('EEEE').format(DateTime.now())];
  result=getSubjectForToday(lst[1]);
  // List<Subject> result1= getSubjectForToday(lst[1]);
  // if (result1.length!=0)
  // {
  //     result1.forEach((element) {
  //       result.add(element);
  //     });
  // }

  return result;
}

Future<List<Semester>> getRun(String run) async
{
  String url="https://bk-schedule.herokuapp.com/get-run/"+run;
  List<Semester> result= [];
  Response response= await get(url);
  int statusCode=response.statusCode;
  String body= response.body;
  final json=  jsonDecode(body);
  (json["result"] as List).forEach((element) {
    result.add(Semester.convertJsonObject(element));
  });
  current_week=int.parse(json["current_week"]);
  return result;
}

