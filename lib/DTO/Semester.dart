import 'Subject.dart';

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