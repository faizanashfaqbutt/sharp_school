class StudentAttendance{
  String type;
  String date;

  StudentAttendance({this.type, this.date});

  factory StudentAttendance.fromJson(Map<String , dynamic> json){
    return StudentAttendance(
    type: json['attendance_type'],
    date: json['attendance_date'],
    );
  }
}

class StudentAttendanceList{

  List<StudentAttendance> attendances;

  StudentAttendanceList(this.attendances);

  factory StudentAttendanceList.fromJson(List<dynamic> json){
//    json=[{
//      'attendance_type': 'P',
//      'attendance_date': "9-10-2020",
//    },{
//      'attendance_type': 'P',
//      'attendance_date': "10-10-2020"
//    },{
//      'attendance_type': 'A',
//      'attendance_date': "11-10-2020"
//    }];

    List<StudentAttendance> studentAttendanceList = List<StudentAttendance>();
//    print(studentAttendanceList.toString());
    studentAttendanceList = json.map((i) => StudentAttendance.fromJson(i)).toList();
    //print(studentAttendanceList[0].date);
    //return null;
    print(studentAttendanceList.toString());
    return StudentAttendanceList(studentAttendanceList);
  }

}