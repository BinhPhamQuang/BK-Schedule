
import 'dart:io';

import 'package:bkschedule/DTO/encrypt.dart';
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


Future<int> getLastReady() async
{
  print("get last ready run running..");
  String url="https://bk-schedule.herokuapp.com/get-last-ready/";
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


Future<int> getRun(String run) async
{
  dev.log("get run running..");
  String url="https://bk-schedule.herokuapp.com/get-run/"+run;
  //List<Semester> result= [];
  Response response= await get(url);
  int statusCode=response.statusCode;
  String body= response.body;
  final jsonData=  jsonDecode(body);
  final ta= jsonData["result"];
  dev.log("jsonData: $ta");
  if(jsonData["result"]==-2)
    {
      return -2;
    }
  else if(jsonData["result"]==-1)
    {
      return -1;
    }
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/amy_file.txt');
  await file.writeAsString(body);
  dev.log("get run status: saved");


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
  if (file.existsSync()==false)
    {
      await getLastReady();
    }
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


Future<Map<String,String>> loadStateLogin() async
{
  final directory= await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/user.txt');
  String data_file= await file.readAsString();
  final json_data= jsonDecode(data_file);

  var result=
      {
        "username": decryptFernet(json_data["djlkasjdczx"]),
        "password": decryptFernet(json_data["da;xzcmzxcoiz"]),
        "run":decryptFernet(json_data["mzcnzxueiqwe"])
      };
  print(result);
  return result;
}

Future<int> savedStateLogin(String username,String password, String run) async
{
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/user.txt');
  var body={
    "djlkasjdczx":encryptFernet(username), //username
    "da;xzcmzxcoiz":encryptFernet(password), //password
    "mzcnzxueiqwe":encryptFernet(run) // run
  };
  await file.writeAsString(jsonEncode(body));
  dev.log("Write file finished");
  return 1;
}


Future<int> postFirstRun(String username,String password) async
{
  dev.log("running first run");
  String run_token= await postRun(username, password);
  dev.log("run token: $run_token");
  int status=-1;
  while(true)
    {
      dev.log("looping: $status");
      status= await getRun(run_token);
      if(status==-2)
        {
          return -2;
        }
      else if(status==1)
        {
          break;
        }
      await Future.delayed(Duration(seconds: 1));
    }
  await savedStateLogin(username, password, run_token);
  return 1;
}


Future<String> postRun(String username,String password)
// return the run token
async {
  var client= new Client();
  dev.log("starting post ...");
  String url="https://bk-schedule.herokuapp.com/post-run/";
  var body= {"username":username,"password":password};
  Response response= await client.post(
      url,
      headers: <String, String>{
        "Accept": "application/json",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body));
  var result=response.body;
  dev.log("post finished");
  final jsonData=  jsonDecode(result);
  client.close();
  return jsonData["result"];
}