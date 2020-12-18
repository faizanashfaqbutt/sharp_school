// ignore: camel_case_types
class classExam {
  String subjectName;
  String date;
  String roomNo;
  String startTime;
  String endTime;

  classExam(
      {this.subjectName, this.date, this.roomNo, this.startTime, this.endTime});

  factory classExam.fromJson(Map<String, dynamic> json) {
    return classExam(
        subjectName: json['subject_name'],
        date: json['date'],
        roomNo: json['room_no'],
        startTime: json['start_time'],
        endTime: json['end_time']);
  }
}

// ignore: camel_case_types
class classExamScheduleList {

  List<classExam> exams;

  classExamScheduleList(this.exams);

  factory classExamScheduleList.fromJson(List<dynamic> json) {
    List<classExam> examList;
    json=[{
    'subject_name':'Urdu',
    'date':'12/8/9',
    'room_no':'12',
    'start_time':'1:30',
    'end_time':'2:30'
    },
      {
        'subject_name':'ENglish',
        'date':'12/5/8',
        'room_no':'11',
        'start_time':'12:30',
        'end_time':'5:55'
      }];
    examList = json.map((i) => classExam.fromJson(i)).toList();

    return classExamScheduleList(examList);
  }
}
