import 'package:flutter/material.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sharpschool/utils/modal/ScheduleList.dart';
import '../Utils.dart';
import 'RoutineRowWidget.dart';

// ignore: must_be_immutable
class RoutineRow extends StatefulWidget {

  String title;
  int classCode;
  int sectionCode;
  String id;


  RoutineRow({this.id,this.title, this.classCode, this.sectionCode});

  @override
  _ClassRoutineState createState() => _ClassRoutineState(id,title,classCode,sectionCode);
}

class _ClassRoutineState extends State<RoutineRow> {

  String title;
  String id;
  int classCode;
  int sectionCode;
  Future<ScheduleList> routine;


  _ClassRoutineState(this.id,this.title, this.classCode, this.sectionCode);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//      print(this.classCode);
//      print(this.sectionCode);
//    Utils.getStringValue('id').then((value) {
      setState(() {
        // if(classCode == null && sectionCode == null){
          // routine = fetchRoutine(int.parse(widget.id!= null ? widget.id : value), title);
          //title is the day of the week
          // routine = fetchRoutine(title);
        // }else{
        //
        //   routine = fetchRoutine(title);

          //routine = fetchRoutineByClsSec(int.parse(value), title);
       // }
        routine=fetchRoutine(id.toString(), title);
        print(routine);
      });

//    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,left: 10.0,right: 10.0),
      child: FutureBuilder<ScheduleList>(
        future: routine,
        builder: (context,snapshot){
         if(snapshot.hasData){
           if(snapshot.data.schedules.length > 0){
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(bottom:8.0),
                   child: Text(title,style:Theme.of(context).textTheme.headline4.copyWith(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black)),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(bottom:5.0),
                   child: Row(
                     children: <Widget>[
                       Expanded(
                         child:  Text('Time',style:Theme.of(context).textTheme.headline3.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                       ),
                       Expanded(
                         child:  Text('Subject',style:Theme.of(context).textTheme.headline3.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                       ),
                       Expanded(
                         child:  Text('Teacher',style:Theme.of(context).textTheme.headline3.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
                       ),
                     ],
                   ),
                 ),
                 ListView.builder(
                   itemCount: snapshot.data.schedules.length,
                   shrinkWrap: true,
                   itemBuilder: (context,index){
                     return RoutineRowDesign(AppFunction.getAmPm(snapshot.data.schedules[0].startTime)+' - '+AppFunction.getAmPm(snapshot.data.schedules[0].endTime),
                     snapshot.data.schedules[index].subject, snapshot.data.schedules[index].teacher
                     );
                   },
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top:8.0),
                   child: Container(
                     height: 0.5,
                     decoration: BoxDecoration(
                       color: Color(0xFF415094),
                     ),
                   ),
                 )
               ],
             );

               //Text(AppFunction.getAmPm(snapshot.data.schedules[0].startTime)+' - '+AppFunction.getAmPm(snapshot.data.schedules[0].endTime));

           }else{
             return Text("");
           }

         }else{
           return Center(child: Text("....."));
         }
        },
      ),
    );
  }

  Future<ScheduleList> fetchRoutine(String id,String day) async {

    print(title);
  var student_class,student_section,token;
//  await Utils.getStringValue('student_class').then((value){
//    student_class = value;
//  });
//  await Utils.getStringValue('student_section').then((value){
//    student_section = value;
//  });
    try{
      // student_class=classCode.toString();
      // student_section=sectionCode.toString();
      await Utils.getStringValue('token').then((value){
        token = value;
      });
      final response = await http.get(InfixApi.getStudentRoutine(id,day,'getStudentRoutine',token));
      if (response.statusCode == 200) {

        var jsonData = json.decode(response.body);
        // If server returns an OK response, parse the JSON.
        return ScheduleList.fromJson(jsonData);
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    }catch(e){
      print(e.toString());
    }

  //print("in fetch routine");
    //return ScheduleList.fromJson([{}]);
  }

  Future<ScheduleList> fetchRoutineByClsSec(int id,String title) async {
//    final response =
//    await http.get(InfixApi.getRoutineByClassAndSection(id,classCode,sectionCode));
//
//    if (response.statusCode == 200) {
//      var jsonData = json.decode(response.body);
//      // If server returns an OK response, parse the JSON.
//      return ScheduleList.fromJson(jsonData['data'][title]);
//    } else {
//      // If that response was not OK, throw an error.
//      throw Exception('Failed to load post');
//    }
    return ScheduleList.fromJson([{}]);
  }
}

