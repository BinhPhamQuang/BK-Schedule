
class DateTest
{
  String date;
  String hour;
  String room;


  DateTest(this.date, this.hour, this.room);

  factory DateTest.convertJsonObject(dynamic json)
  {
    return DateTest(json["date"], json["hour"], json["room"]);
  }
}
class Test
{
  String id;
  String name;
  String clas;
  DateTest midterm;
  DateTest finalterm;

  Test(this.id, this.name, this.clas, this.midterm, this.finalterm);

  factory Test.convertJsonObject(dynamic json)
  {
    return Test(json["id"], json["name"], json["class"], DateTest.convertJsonObject(json["midterm"]), DateTest.convertJsonObject(json["finalterm"]));
  }
}

class Tests
{
  String title;
  List<Test> tests;

  Tests(this.title, this.tests);
  factory Tests.convertJsonObject(dynamic json)
  {
    String _title=json["title"];
    List<Test> _tests=[];
    (json["tests"] as List<dynamic>).forEach((element) {
      _tests.add(Test.convertJsonObject(element));
    });
    return Tests(_title, _tests);
  }
}