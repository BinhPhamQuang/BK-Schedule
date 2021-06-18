import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

import 'Semester.dart';
import 'Subject.dart';







dynamic dates={"Monday":2,"Tuesday":3,"Wednesday":4,"Thursday":5,"Friday":6,"Satuday":7,"Sunday":8};

int current_week=-1;
var date;

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


int caculateCurrentWeek()
{
  int result=0;
  DateTime now= DateTime.now();
  date="1/6/2021";
  DateTime from= new DateFormat('dd/MM/yyyy').parse(date);
  from= DateTime(from.year,from.month,from.day);
  DateTime to= DateTime(now.year,now.month,now.day);

  var between= (to.difference(from).inHours/24).round();

  return result;
}
final run="tSi6NcXaY5Rf";
Future<List<Subject>> getTodaySubject() async {

  List<Semester> lst= await loadData() ;
  List<Subject> result=[];
  var t=dates[DateFormat('EEEE').format(DateTime.now())];
  result=getSubjectByWeek(lst[0],14);
  List<Subject> result1= getSubjectByWeek(lst[1],14);
  if (result1.length!=0)
  {
      result1.forEach((element) {
        result.add(element);
      });
  }
  caculateCurrentWeek();
  return result;
}

Future<List<Semester>> getAllSemester() async
{
  return loadData();
}

Future<int> getRun(String run) async
{
  print("get run running..");
  String url="https://bk-schedule.herokuapp.com/get-run/"+run;
  //List<Semester> result= [];
  Response response= await get(url);
  int statusCode=response.statusCode;
  String body= response.body;
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/amy_file.txt');
  await file.writeAsString(body);
  print('saved');
  final jsonData=  jsonDecode(body);

  //
  // (jsonData["result"] as List).forEach((element) {
  //   result.add(Semester.convertJsonObject(element));
  // });

  return 1;
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
  current_week=int.parse(jsonData["current_week"]);
  date= jsonData["date"];
  return result;
}

_save(String jsonData) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/amy_file.txt');
  await file.writeAsString(jsonData);
  print('saved');
}

