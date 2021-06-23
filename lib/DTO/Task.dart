import 'dart:developer';
class Task
{
    late String title;
   late String course;
    late String time;
    late bool is_online;
    late DateTime date;
    Task(this.title, this.course, this.time, this.is_online, this.date);
    factory Task.convertJsonObject(dynamic json,DateTime date)
    {
      List<String> times=json["time"].split(":");
      return Task(json["title"], json["course"], json["time"], json["is_online"], date.add(Duration(hours: int.parse(times[0]),minutes: int.parse(times[1]) )));
    }
}


