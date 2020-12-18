import 'Schedule.dart';

class ScheduleList{

  final List<ClassRoutine> schedules;

  ScheduleList(this.schedules);


  factory ScheduleList.fromJson(List<dynamic> parsedJson) {

    List<ClassRoutine> routines = List<ClassRoutine>();
//    parsedJson= [{"start_time":"12:30","end_time":"1:30","subject_name":"chemsitry","room_no":"12"},
//      {"start_time":"12:30","end_time":"1:30","subject_name":"physics","room_no":"12"},
//      {"start_time":"12:30","end_time":"1:30","subject_name":"maths","room_no":"12"}];

    routines = parsedJson.map((i) => ClassRoutine.fromJson(i)).toList();


    return ScheduleList(routines);
  }

}