import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/TeacherSubject.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/TeacherSubjectRow.dart';

class MySubjectScreen extends StatefulWidget {
  @override
  _MySubjectScreenState createState() => _MySubjectScreenState();
}

class _MySubjectScreenState extends State<MySubjectScreen> {
  Future<TeacherSubjectList> subjects;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Utils.getStringValue('id').then((value) {
      setState(() {
        print(value);
        subjects = getAllSubject(int.parse(value));
      });
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
        appBar: AppBarWidget.header(context, 'Subjects'),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0,top: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Subject',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      child: Text('Code',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                    ),
//                    Expanded(
//                      child: Text('Type',
//                          style: Theme.of(context).textTheme.display1.copyWith(
//                              fontSize: 13.0, fontWeight: FontWeight.w500)),
//                    ),
                  ],
                ),
              ),
              FutureBuilder<TeacherSubjectList>(
                future: subjects,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.subjects.length,
                      itemBuilder: (context, index) {
                        return TeacherSubjectRowLayout(snapshot.data.subjects[index]);
                      },
                    );
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

  Future<TeacherSubjectList> getAllSubject(int id) async {
    var token;
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    final response = await http.get(InfixApi.getTeacherSubject(id.toString(),'getTeacherSubject',token));
    print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return TeacherSubjectList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load');
    }
//    return TeacherSubjectList.fromJson([{}]);
  }
}
