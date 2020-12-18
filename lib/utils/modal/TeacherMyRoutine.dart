class TeacherMyRoutine {
  final String startTime;
  final String endTime;
  final String subject;
  //final String room;
  final String mClass;
 // final String mSection;

//  TeacherMyRoutine({this.startTime, this.endTime, this.subject, this.room,this.mClass,this.mSection});
  TeacherMyRoutine({this.startTime, this.endTime, this.subject, this.mClass});

  factory TeacherMyRoutine.fromJson(Map<String, dynamic> json) {
    return TeacherMyRoutine(
        startTime: json['start_time'],
        endTime: json['end_time'],
        subject: json['subject_name'],
        //room: json['room_no'],
        mClass: json['class_name']
        //mSection: json['section_name']
    );
  }
}
class TeacherMyRoutineList{

  final List<TeacherMyRoutine> schedules;

  TeacherMyRoutineList(this.schedules);


  factory TeacherMyRoutineList.fromJson(List<dynamic> parsedJson) {

    List<TeacherMyRoutine> routines = List<TeacherMyRoutine>();
//    parsedJson=[{
//      'start_time':'12:45',
//      'end_time':"1:30",
//      'subject_name':'urdu',
//      'room_no':'12',
//      'class_name':'10th',
//      'section_name':'red'
//    },
//      {
//        'start_time':'12:45',
//        'end_time':"1:30",
//        'subject_name':'English',
//        'room_no':'12',
//        'class_name':'10th',
//        'section_name':'red'
//      }];
    routines = parsedJson.map((i) => TeacherMyRoutine.fromJson(i)).toList();

    return TeacherMyRoutineList(routines);
  }

}