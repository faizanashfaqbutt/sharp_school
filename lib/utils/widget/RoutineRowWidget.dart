import 'package:flutter/material.dart';

// ignore: must_be_immutable
class  RoutineRowDesign extends StatelessWidget {

  String time;
  String subject;
  String teacher;


  RoutineRowDesign(this.time, this.subject, this.teacher);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(

            child:  Text(time,style:Theme.of(context).textTheme.headline5.copyWith(fontSize: 17)),
          ),
          Expanded(
            child:  Text(subject,style:Theme.of(context).textTheme.headline5),
          ),
          Expanded(
            child:  Text(teacher,style:Theme.of(context).textTheme.headline5),
          ),
        ],
      ),
    );
  }
}
