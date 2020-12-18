import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/GlobalClass.dart';
import 'package:sharpschool/utils/modal/Student.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/StudentAttendanceRow.dart';
import 'package:intl/intl.dart';

//typedef void childCallback(String some);

// ignore: must_be_immutable
class StudentListAttendance extends StatefulWidget {
  int classCode;
  int sectionCode;
  String url;
  String date;

  StudentListAttendance({this.classCode, this.sectionCode, this.url, this.date});

  @override
  _StudentListAttendanceState createState() => _StudentListAttendanceState(
      classCode: classCode, sectionCode: sectionCode, date: date, url: url);
}

class _StudentListAttendanceState extends State<StudentListAttendance> {
  String callbackId;
  String callbackAtt;

  List<studentAttendanceToServer> studentAttendanceToServerList = new List();
  int classCode;
  int sectionCode;
  String url;
  Future<StudentList> students;
  List<Student> studentList;

  String date;
  List<String> absent = List<String>();
  int totalStudent = 0;
  var function = GlobalDatae();
  List<Student> StudentListForAttendance;

  _StudentListAttendanceState({this.classCode, this.sectionCode, this.url, this.date});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      function.setZero();
      students = getAllStudent();
    });
  }

  void updateStudentAttendanceListCallback(String id, String atd_status) {
    setState(() {
      callbackId = id;
      callbackAtt=atd_status;
      var index=studentAttendanceToServerList.indexWhere((user) => user.student_id==id);
      studentAttendanceToServerList[index].attendance_status=(atd_status=='A')?'absent':'present';
    });
  }

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));
    print(callbackId);
    print(callbackAtt);

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Student Attendance'),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<StudentList>(
                future: students,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    totalStudent = snapshot.data.students.length;
                    snapshot.data.students;
                    return ListView.builder(
                      itemCount: snapshot.data.students.length,
                      itemBuilder: (context, index) {
                        return StudentAttendanceRow(
                            snapshot.data.students[index],
                            '$classCode',
                            '$sectionCode',
                            date, changeStudentAttendanceStatus: (String id,String atd_status) {
                          updateStudentAttendanceListCallback(id, atd_status);
                        });
                      },
                    );
                  } else {
                    return Center(child: Text("loading..."));
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 15.0, left: 10.0, right: 10.0, top: 5.0),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.purple,
                  ),
                  child: Text(
                    "Save",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                onTap: () {
                  sendAttendance();
                  showAlertDialog(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendAttendance() async {
//    StudentListForAttendance.forEach((element) {
//      print(element.name);
//    });

    print(studentAttendanceToServerList.toString());

    var token;
    await Utils.getStringValue('token').then((value) {
      token = value;
    });
    var url = InfixApi.sendStudentAttendance('sendStudentAttendance', token);
    Map<String, String> headers = {"Content-type": "application/json"};

    var json;
    try{
      json=jsonEncode(studentAttendanceToServerList.map((e) => e.toJson()).toList());
      print(json);
    }catch(e){
      print(e.toString());
    }
    final response = await http.post(url, headers: headers, body: json);
    print(response.body);
  }

  void sentNotificationToSection() async {
    final response = await http.get(InfixApi.sentNotificationToSection(
        'Leave', 'New leave request has come', '$classCode', '$sectionCode'));
    if (response.statusCode == 200) {}
  }

  Future<StudentList> getAllStudent() async {
    var token;
    await Utils.getStringValue('token').then((value) {
      token = value;
    });
    final response = await http.get(InfixApi.getStudentsOfTeacherSearch(
        classCode.toString(),
        sectionCode.toString(),
        '',
        '',
        'getStudentsOfTeacherSearch',
        token));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //print(jsonData.toString());
      print(StudentList.fromJson(jsonData).students.length);
      StudentListForAttendance = StudentList.fromJson(jsonData).students;
      //
      List<CustomStudent> customStudentListForAttendance =
          CustomStudentList.fromJson(jsonData).students;
      customStudentListForAttendance.forEach((s) {
        try {
          final DateTime now = DateTime.now();
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          final String formatted = formatter.format(now);
          studentAttendanceToServerList.add(studentAttendanceToServer(s.uid, s.class_id, s.section_id, formatted, 'present', 'app'));
        } catch (e) {
          print(e.toString());
        }
//        print(studentAttendanceToServerList.indexWhere((user) => user.student_id=='30'));
      });
      return StudentList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load');
    }
  }

  showAlertDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        if (function.getAbsent() == 0) {
          setDefaultAttendance();
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Card(
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.greenAccent.shade700,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                            elevation: 18.0,
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAlias),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Success!',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Total student : $totalStudent',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Total Absent : ${function.getAbsent()}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0, top: 15.0),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.purple,
                            ),
                            child: Text(
                              "OK",
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(
                                      color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          onTap: () {
                            sentNotificationToSection();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void setDefaultAttendance() async {
    final response = await http.get(
        InfixApi.attendanceDefaultSent(date, '$classCode', '$sectionCode'));
    if (response.statusCode == 200) {
      debugPrint('Attendance default successful');
    } else {
      throw Exception('Failed to load');
    }
  }
}

class studentAttendanceToServer {
  String student_id,
      class_id,
      section_id,
      attendance_date,
      attendance_status,
      attendance_trans_type;

  studentAttendanceToServer(this.student_id, this.class_id, this.section_id,
      this.attendance_date, this.attendance_status, this.attendance_trans_type);
  Map<String, dynamic> toJson() => {
    'student_id':student_id,
    'class_id':class_id,
    'section_id':section_id,
    'attendance_date':attendance_date,
    'attendance_status':attendance_status,
    'attendance_trans_type':attendance_trans_type
  };

}

class CustomStudent {
  String id;
  String uid;
  String photo;
  String name;
  String roll;
  String class_id;
  String section_id;

  CustomStudent(
      {this.id,
      this.photo,
      this.name,
      this.roll,
      this.class_id,
      this.section_id,
      this.uid});

  factory CustomStudent.fromJson(Map<String, dynamic> json) {
    return CustomStudent(
      id: json['user_id'].toString(),
      photo: json['student_photo'],
      name: json['full_name'],
      roll: json['roll_no'].toString(),
      class_id: json['class_id'].toString(),
      section_id: json['section_id'].toString(),
      uid: json['id'].toString(),
    );
  }

}

class CustomStudentList {
  List<CustomStudent> students;

  CustomStudentList(this.students);

  factory CustomStudentList.fromJson(List<dynamic> json) {
    List<CustomStudent> studentlist = List<CustomStudent>();

    try {
      studentlist = json.map((i) => CustomStudent.fromJson(i)).toList();
    } catch (e) {
      print(e);
    }
    return CustomStudentList(studentlist);
  }

}
