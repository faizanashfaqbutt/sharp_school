import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/Teacher.dart';
import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/server/About.dart';
import 'dart:convert';

import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/Student_teacher_row_layout.dart';
// ignore: must_be_immutable
class StudentTeacher extends StatefulWidget {
  String id;

  StudentTeacher({this.id});

  @override
  _StudentTeacherState createState() => _StudentTeacherState(id:id);
}

class _StudentTeacherState extends State<StudentTeacher> with SingleTickerProviderStateMixin{
  String id;
  _StudentTeacherState({this.id});
  Future<TeacherList> teachers;
  int mId;
  int perm = -1;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();


      setState(() {
        mId = widget.id != null ? int.parse(widget.id):int.parse(id);
        teachers = getAllTeacher(mId);
      });


    controller = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo,
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Teacher'),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context,child){
                    return Container(
                      transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('Teacher Name',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                            child: Text('Email',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                            child: Text('Phone',
                                style: Theme.of(context).textTheme.headline4.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              FutureBuilder<TeacherList>(
                future: teachers,
                builder: (context,snapshot){
                  if(snapshot.hasData){

                    About.phonePermission().then((val){
                      if(mounted){
                        setState(() {
                          perm = val;
                        });
                      }
                    });
                    return perm != -1 ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.teachers.length,
                      itemBuilder: (context, index) {
                        return StudentTeacherRowLayout(snapshot.data.teachers[index],perm);
                      },
                    ):Container();
                  }else{
                    return Center(child: Text("Loading..."));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<TeacherList> getAllTeacher(int id) async {
    var student_class,student_section,token;
    // await Utils.getStringValue('student_class').then((value){
    //   student_class = value;
    // });
    // await Utils.getStringValue('student_section').then((value){
    //   student_section = value;
    // });
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    // print(InfixApi.getTeacherOfStudent(student_class,student_section,'getTeacherOfStudent',token));
    final response = await http.get(InfixApi.getTeacherOfStudent(id.toString(),'getTeacherOfStudent',token));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return TeacherList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load');
    }
    //return TeacherList.fromJson([{}]);
  }
}
