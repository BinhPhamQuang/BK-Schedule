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
      return Task(json["title"], json["course"], json["time"], json["is_online"], date);
    }
}


