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