import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/Subject.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/SubjectRowLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore: must_be_immutable
class SubjectScreen extends StatefulWidget {
  String id;

  SubjectScreen({this.id});

  @override
  _SubjectScreenState createState() => _SubjectScreenState(id:id);
}
// Future<String> getFutureId(String id) async {
//   return id;
// }
class _SubjectScreenState extends State<SubjectScreen> {
  String id;
  _SubjectScreenState({this.id});
  Future<SubjectList> subjects;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   
      setState(() {
        subjects = getAllSubject(widget.id != null ? int.parse(widget.id):int.parse(id));
     
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
                padding: const EdgeInsets.only(bottom: 10.0,top:5),
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
                    Expanded(
                      child: Text('Teacher',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              FutureBuilder<SubjectList>(
                future: subjects,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.subjects.length,
                      itemBuilder: (context, index) {
                        return SubjectRowLayout(snapshot.data.subjects[index]);
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

  Future<SubjectList> getAllSubject(int id) async {
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
    final response = await http.get(InfixApi.getSubjects(id.toString(),'getSubjects',token));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return SubjectList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load');
    }
    //return SubjectList.fromJson([{}]);
  }
}
