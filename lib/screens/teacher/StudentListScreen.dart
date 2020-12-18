import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/modal/Student.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/StudentSearchRow.dart';
import 'package:sharpschool/utils/apis/Apis.dart';

// ignore: must_be_immutable
class StudentListScreen extends StatefulWidget {
  int classCode;
  int sectionCode;
  String name;
  String roll;
  String url;
  String status;

  StudentListScreen(
      {this.classCode, this.sectionCode, this.name, this.roll, this.url,this.status});

  @override
  _StudentListScreenState createState() => _StudentListScreenState(
      classCode: classCode,
      sectionCode: sectionCode,
      name: name,
      roll: roll,
      url: url,
      status: status
  );
}

class _StudentListScreenState extends State<StudentListScreen> {
  int classCode;
  int sectionCode;
  String name;
  String roll;
  String url;
  Future<StudentList> students;
  String status;

  _StudentListScreenState(
      {this.classCode, this.sectionCode, this.name, this.roll, this.url,this.status});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      students = getAllStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Student List'),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: FutureBuilder<StudentList>(
          future: students,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.students.length,
                itemBuilder: (context, index) {
                  return StudentRow(snapshot.data.students[index],status: status,);
                },
              );
            } else {
              return Center(child: Text("loading..."));
            }
          },
        ),
      ),
    );
  }

  Future<StudentList> getAllStudent() async {
    var token;
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    final response = await http.get(InfixApi.getStudentsOfTeacherSearch(classCode.toString(),sectionCode.toString(),name,roll,'getStudentsOfTeacherSearch',token));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //print(jsonData.toString());
      return StudentList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load');
    }
    //return StudentList.fromJson([{}]);
  }
}
