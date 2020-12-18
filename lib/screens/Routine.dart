import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/Routine_row.dart';

// ignore: must_be_immutable

class Routine extends StatelessWidget {

  List<String> weeks = AppFunction.weeks;
  String id;
  String classCode;
  String sectionCode;
  Routine({this.id,this.classCode,this.sectionCode});

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

//    print(classCode);
//    print(sectionCode);
//    print("Yo yo Honey Singh");

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
          appBar: AppBarWidget.header(context, 'Routine'),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: weeks.length,
              itemBuilder: (context,index){
                return RoutineRow(id:id,title:weeks[index],classCode: 12,sectionCode: 12);
              },
            ),
          ),
        ),
    );
  }

}
