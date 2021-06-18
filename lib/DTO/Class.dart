import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

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


String parseWeek(List<int> weeks)
{
  String result="|";
  if (weeks.length==0)
    {
      return "|--|";
    }
  if(weeks.length==1)
    {
      return "|${weeks[0]}|";
    }
  for(var i= weeks.reduce(min); i< weeks.reduce(max);i++)
    {
      String temp;
      if(weeks.contains(i))
        {
          temp= "$i|";
        }
      else
        {
          temp="--|";
        }
      result+=temp;
    }
  return result;
}

// List<Subject> getSubjectForToday(Semester semester)
// {
//   current_week=14;
//
//   List<Subject> result=[];
//   semester.subjects.forEach((element) {
//     if (element.thu==dates[DateFormat('EEEE').format(DateTime.now())].toString())
//     {
//       if (element.week.contains(current_week) )
//       {
//         result.add(element);
//       }
//     }
//   });
//   return result;
// }

List<Subject> getSubjectByWeek(Semester semester,int week)
{
  List<Subject> result=[];
  semester.subjects.forEach((element) {
    if (1==1 || element.thu==dates[DateFormat('EEEE').format(DateTime.now())].toString())
    {
      if (element.week.contains(week) )
      {
        result.add(element);
      }
    }
  });
  return result;
}

final run="tSi6NcXaY5Rf";
Future<List<Subject>> getTodaySubject() async {

  // List<Semester> lst= await getRun(run) ;
  List<Semester> lst= await loadData() ;
  List<Subject> result=[];
  var t=dates[DateFormat('EEEE').format(DateTime.now())];
  result=getSubjectByWeek(lst[1],14);
  // List<Subject> result1= getSubjectForToday(lst[1]);
  // if (result1.length!=0)
  // {
  //     result1.forEach((element) {
  //       result.add(element);
  //     });
  // }

  return result;
}

Future<List<Semester>> getAllSemester() async
{
  return loadData();
}

Future<List<Semester>> getRun(String run) async
{
  String url="https://bk-schedule.herokuapp.com/get-run/"+run;
  List<Semester> result= [];
  Response response= await get(url);
  int statusCode=response.statusCode;
  String body= response.body;
  final jsonData=  jsonDecode(body);


  (jsonData["result"] as List).forEach((element) {
    result.add(Semester.convertJsonObject(element));
  });
  current_week=int.parse(jsonData["current_week"]);
  return result;
}


Future<List<Semester>> loadData() async
{
  List<Semester> result= [];
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/amy_file.txt');
  String text = await file.readAsString();
  final jsonData=  jsonDecode(text);
  (jsonData["result"] as List).forEach((element) {
    result.add(Semester.convertJsonObject(element));
  });
  return result;
}
//
// getApplicationDocumentsDirectory().then((Directory directory){
// dir=directory;
// jsonFile= new File(dir.path+"/"+fileName);
// fileExists= jsonFile.existsSync();

// final String fileName = "bkschedule.json";
// dynamic readData(Directory dir, File jsonFile)
// {
//   bool fileExists= jsonFile.existsSync();
//   if (fileExists) {
//     return jsonDecode(jsonFile.readAsStringSync());
//   }
//   return -1;
// }
// void createFile(dynamic content,Directory dir,String fileName)
// {
//   File file= new File(dir.path+"/"+fileName);
//   file.createSync();
//   file.writeAsString(jsonEncode(content));
// }


_read() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/amy_file.txt');
    final String text = await file.readAsString();
    return text;
  } catch (e) {
    print("Couldn't read file");
  }
  return "-1";
}


_save(String jsonData) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/amy_file.txt');
  await file.writeAsString(jsonData);
  print('saved');
}

