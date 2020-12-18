import 'package:flutter/material.dart';
import 'package:sharpschool/screens/SaleReceipt.dart';
import 'package:sharpschool/utils/modal/ClassExamList.dart';
import 'package:sharpschool/utils/widget/ScaleRoute.dart';
//import 'package:sharpschool/screens/ActiveOnlineExamScreen.dart';
//import 'package:sharpschool/screens/BookIssuedScreen.dart';
//import 'package:sharpschool/screens/BookListScreen.dart';
import 'package:sharpschool/screens/ClassExamResult.dart';
//import 'package:sharpschool/screens/Dormitory.dart';
import 'package:sharpschool/screens/ExaminationScreen.dart';
import 'package:sharpschool/screens/Fees.dart';
import 'package:sharpschool/screens/Home.dart';
//import 'package:sharpschool/screens/LibraryScreen.dart';
import 'package:sharpschool/screens/NoticeScreen.dart';
//import 'package:sharpschool/screens/OnlineExamResultScreen.dart';
//import 'package:sharpschool/screens/OnlineExamScreen.dart';
import 'package:sharpschool/screens/Profile.dart';
import 'package:sharpschool/screens/Routine.dart';
import 'package:sharpschool/screens/ScheduleScreen.dart';
import 'package:sharpschool/screens/SettingsScreen.dart';
import 'package:sharpschool/screens/StudentAttendance.dart';
import 'package:sharpschool/screens/StudentHomework.dart';
import 'package:sharpschool/screens/StudentTeacher.dart';
import 'package:sharpschool/screens/SubjectScreen.dart';
//import 'package:sharpschool/screens/TimeLineScreen.dart';
//import 'package:sharpschool/screens/TransportScreen.dart';
import 'package:sharpschool/screens/admin/AddFeeType.dart';
//import 'package:sharpschool/screens/admin/AddLibraryBook.dart';
//import 'package:sharpschool/screens/admin/AddRouteScreen.dart';
//import 'package:sharpschool/screens/admin/AdminAddDormitory.dart';
//import 'package:sharpschool/screens/admin/AdminAddMember.dart';
//import 'package:sharpschool/screens/admin/AdminAddRoom.dart';
//import 'package:sharpschool/screens/admin/AdminAddVehicle.dart';
//import 'package:sharpschool/screens/admin/AdminDormitoryScreen.dart';
import 'package:sharpschool/screens/admin/AdminFeeList.dart';
import 'package:sharpschool/screens/admin/AdminFeesHome.dart';
import 'package:sharpschool/screens/admin/AdminLeaveHomeScreen.dart';
//import 'package:sharpschool/screens/admin/AdminLibraryScreen.dart';
import 'package:sharpschool/screens/admin/AdminSettings.dart';
import 'package:sharpschool/screens/admin/AdminStuffList.dart';
//import 'package:sharpschool/screens/admin/AdminTransportScreen.dart';
import 'package:sharpschool/screens/parent/ChildListScreen.dart';
import 'package:sharpschool/screens/teacher/AboutScreen.dart';
import 'package:sharpschool/screens/teacher/AcademicsScreen.dart';
import 'package:sharpschool/screens/teacher/AddContentScreen.dart';
import 'package:sharpschool/screens/teacher/AddHomeworkScreen.dart';
import 'package:sharpschool/screens/teacher/ApplyLeaveScreen.dart';
import 'package:sharpschool/screens/teacher/AttendanceScreen.dart';
import 'package:sharpschool/screens/teacher/ClassAttendanceHome.dart';
import 'package:sharpschool/screens/teacher/ContentListScreen.dart';
import 'package:sharpschool/screens/teacher/ContentScreen.dart';
import 'package:sharpschool/screens/teacher/HomeworkScreen.dart';
import 'package:sharpschool/screens/teacher/LeaveListScreen.dart';
import 'package:sharpschool/screens/teacher/LeaveScreen.dart';
import 'package:sharpschool/screens/teacher/MySubjectScreen.dart';
import 'package:sharpschool/screens/teacher/SearchClassRoutine.dart';
import 'package:sharpschool/screens/teacher/StudentSearch.dart';
import 'package:sharpschool/screens/teacher/TeacherHomeworkListScreen.dart';
import 'package:sharpschool/screens/teacher/TeacherMyAttendance.dart';
import 'package:sharpschool/screens/teacher/TeacherRoutineScreen.dart';

import 'Utils.dart';
//import 'package:sharpschool/utils/widget/ScaleRoute.dart';

class AppFunction {
  static var students = [
    'Profile',
    'Fees',
    'Sale Receipt',
    'Routine',
    'Homework',
    // 'Timeline',
    'Attendance',
    // 'Examination',
    // 'Online Exam',
    // 'Notice',
    'Subjects',
    'Teacher',
    // 'Library',
    // 'Transport',
    // 'Dormitory',
    'Settings',
  ];
  static var studentIcons = [
    'images/profile.png',
    'images/fees_icon.png',
    'images/fees_icon.png',
    'images/routine.png',
    // 'images/homework.png',
    // 'images/timeline.png',
    'images/attendance.png',
    // 'images/examination.png',
    // 'images/onlineexam.png',
    // 'images/notice.png',
    'images/subjects.png',
    'images/teacher.png',
    // 'images/library.png',
    // 'images/transport.png',
    // 'images/dormitory.png',
    'images/addhw.png',
  ];

  static var teachers = [
    'Students',
    'Academic',
    'Attendance',
    'Leave',
    // 'Contents',
    // 'Notice',
    // 'Library',
    // 'Homework',
    'About',
    'Settings',
  ];

  static var teachersIcons = [
    'images/students.png',
    'images/academics.png',
    'images/attendance.png',
    'images/leave.png',
    // 'images/contents.png',
    // 'images/notice.png',
    // 'images/library.png',
    // 'images/homework.png',
    'images/about.png',
    'images/addhw.png',
  ];

  static var admins = [
    'Students',
    'Leave',
    'Stuff',
    'Dormitory',
    'Attendance',
    'Fees',
    'Library',
    'Transport',
    'Settings',
  ];
  static var adminIcons = [
    'images/students.png',
    'images/leave.png',
    'images/staff.png',
    'images/dormitory.png',
    'images/attendance.png',
    'images/fees_icon.png',
    'images/library.png',
    'images/transport.png',
    'images/addhw.png',
  ];

  static var parent = [
    'Child',
    'About',
    'Settings',
  ];
  static var parentIcons = [
    'images/mychild.png',
    'images/fees_icon.png',
    'images/addhw.png',
  ];

  static var adminTransport = [
    'Add Route',
    'Add Vehicle',
    'Transport',
  ];
  static var adminTransportIcons = [
    'images/addhw.png',
    'images/addhw.png',
    'images/transport.png',
  ];

  static var adminDormitory = [
    'Add Room',
    'Add Dormitory',
    'Room List',
  ];
  static var adminDormitoryIcons = [
    'images/addhw.png',
    'images/addhw.png',
    'images/dormitory.png',
  ];

  static var librarys = [
    'Book List',
    'Books Issued',
  ];
  static var libraryIcons = [
    'images/fees_icon.png',
    'images/fees_icon.png',
  ];
  static var examinations = [
    'Schedule',
    'Result',
  ];
  static var examinationIcons = [
    'images/fees_icon.png',
    'images/fees_icon.png',
  ];

  static var onlineExaminations = [
    'Active Exam',
    'Exam Result',
  ];
  static var onlineExaminationIcons = [
    'images/fees_icon.png',
    'images/fees_icon.png',
  ];

  static var homework = [
    'Add HW',
    'HW List',
  ];
  static var homeworkIcons = [
    'images/addhw.png',
    'images/hwlist.png',
  ];

  static var contents = [
    'Add Content',
    'Content List',
  ];
  static var contentsIcons = [
    'images/addhw.png',
    'images/hwlist.png',
  ];

  static var leaves = [
    'Apply Leave',
    'Leave List',
  ];
  static var leavesIcons = [
    'images/hwlist.png',
    'images/addhw.png',
  ];

  static var adminFees = [
    'Add Fee',
    'Fee List',
  ];
  static var adminFeeIcons = [
    'images/fees_icon.png',
    'images/addhw.png',
  ];

  static var adminLibrary = [
    'Add Book',
    'Book List',
    'Add Member',
  ];
  static var adminLibraryIcons = [
    'images/addhw.png',
    'images/hwlist.png',
    'images/addhw.png',
  ];

  static var academics = [
    'My Routine',
    'Class Routine',
    'Subjects',
  ];
  static var academicsIcons = [
    'images/myroutine.png',
    'images/classroutine.png',
    'images/subjects.png',
  ];

  static var attendance = [
    'Class Atten',
    'Search Atten',
    'My Atten',
  ];
  static var attendanceIcons = [
    'images/classattendance.png',
    'images/searchattendance.png',
    'images/myattendance.png',
  ];

    static void getFunctions(BuildContext context, String rule,[String id]) {

    print(rule);
    Route route;

    switch (rule) {
      case '1':
        route =
            MaterialPageRoute(builder: (context) => Home(admins, adminIcons));
        Navigator.pushReplacement(context, route);
        break;
      case '2':

        print(students);
        route = MaterialPageRoute(
            builder: (context) => Home(students, studentIcons,id));
        Navigator.pushReplacement(context, route);
        break;
      case '3':
        route =
            MaterialPageRoute(builder: (context) => Home(parent, parentIcons));
        Navigator.pushReplacement(context, route);
        break;
      case '4':
        route = MaterialPageRoute(
            builder: (context) => Home(teachers, teachersIcons));
        Navigator.pushReplacement(context, route);
        break;
    }
  }

  static void getDashboardPage(BuildContext context, String title,
      {var id, String image,String classCode,String sectionCode}) {

    switch (title) {
      case 'Profile':
        Navigator.push(
            context,
            ScaleRoute(
                page: Profile(
              id: id,
              image: image,
            )));
        break;
      case 'Fees':
        Navigator.push(context, ScaleRoute(page: FeeScreen(id:id)));
        break;
      case 'Sale Receipt':
        Navigator.push(context, ScaleRoute(page: SaleReceipt(id: id)));
        break;
      case 'Routine':
        Navigator.push(context, ScaleRoute(page: Routine(id: id,classCode:classCode.toString(),sectionCode:sectionCode.toString())));
        break;
      case 'Homework':
        Navigator.push(context, ScaleRoute(page: StudentHomework(id: id)));
        break;
//      case 'Dormitory':
//        Navigator.push(context, ScaleRoute(page: DormitoryScreen()));
//        break;
//      case 'Transport':
//        Navigator.push(context, ScaleRoute(page: TransportScreen()));
//        break;
      case 'Subjects':
        Navigator.push(
            context,
            ScaleRoute(
                page: SubjectScreen(
              id: id,
            )));
        break;
      case 'Teacher':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentTeacher(
              id: id,
            )));
        break;
//      case 'Library':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: LibraryHome(
//              librarys,
//              libraryIcons,
//              id: id,
//            )));
//        break;
      case 'Notice':
        Navigator.push(context, ScaleRoute(page: NoticeScreen()));
        break;
//      case 'Timeline':
//        Navigator.push(context, ScaleRoute(page: TimelineScreen(id: id)));
//        break;
      case 'Examination':
        Navigator.push(
            context,
            ScaleRoute(
                page: ExaminationHome(
              examinations,
              examinationIcons,
              id: id,
            )));
        break;
//      case 'Online Exam':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: OnlineExaminationHome(
//              onlineExaminations,
//              onlineExaminationIcons,
//              id: id,
//            )));
//        break;
      case 'Attendance':
        Navigator.push(
            context, ScaleRoute(page: StudentAttendanceScreen(id: id)));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
    }
  }

  static void getAdminDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Students':
        Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Fees':
        Navigator.push(
            context, ScaleRoute(page: AdminFeesHome(adminFees, adminFeeIcons)));
        break;
//      case 'Library':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: AdminLibraryHome(adminLibrary, adminLibraryIcons)));
//        break;
      case 'Attendance':
        Navigator.push(
            context,
            ScaleRoute(
                page: AttendanceHomeScreen(attendance, attendanceIcons)));
        break;
//      case 'Transport':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: AdminTransportHome(adminTransport, adminTransportIcons)));
//        break;
      case 'Stuff':
        Navigator.push(context, ScaleRoute(page: AdminStuffList()));
        break;
//      case 'Dormitory':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: AdminDormitoryHome(adminDormitory, adminDormitoryIcons)));
//        break;
      case 'Leave':
        Navigator.push(context, ScaleRoute(page: LeaveAdminHomeScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: AdminSettings()));
        break;
    }
  }

  static void getAdminFeePage(BuildContext context, String title) {
    switch (title) {
      case 'Add Fee':
        Navigator.push(context, ScaleRoute(page: AddFeeType()));
        break;
      case 'Fee List':
        Navigator.push(context, ScaleRoute(page: AdminFeeListView()));
        break;
//    }
  }
//
//  static void getAdminLibraryPage(BuildContext context, String title) {
//    switch (title) {
//      case 'Add Book':
//        Navigator.push(context, ScaleRoute(page: AddAdminBook()));
//        break;
//      case 'Add Member':
//        Navigator.push(context, ScaleRoute(page: AddMember()));
//        break;
//      case 'Book List':
//        Navigator.push(context, ScaleRoute(page: BookListScreen()));
//        break;
//    }
//  }
//
//  static void getAdminDormitoryPage(BuildContext context, String title) {
//    switch (title) {
//      case 'Room List':
//        Navigator.push(context, ScaleRoute(page: DormitoryScreen()));
//        break;
//      case 'Add Room':
//        Navigator.push(context, ScaleRoute(page: AddRoom()));
//        break;
//      case 'Add Dormitory':
//        Navigator.push(context, ScaleRoute(page: AddDormitory()));
//        break;
//    }
//  }
//
//  static void getAdminTransportPage(BuildContext context, String title) {
//    switch (title) {
//      case 'Add Route':
//        Navigator.push(context, ScaleRoute(page: AddRoute()));
//        break;
//      case 'Add Vehicle':
//        Navigator.push(context, ScaleRoute(page: AddVehicle()));
//        break;
//      case 'Transport':
//        Navigator.push(context, ScaleRoute(page: TransportScreen()));
//        break;
//    }
  }
//
  static void getTeacherDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Students':
        Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Academic':
        Navigator.push(context,
            ScaleRoute(page: AcademicHomeScreen(academics, academicsIcons)));
        break;
      case 'Attendance':
        Navigator.push(
            context,
            ScaleRoute(
                page: AttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Homework':
        Navigator.push(context,
            ScaleRoute(page: HomeworkHomeScreen(homework, homeworkIcons)));
        break;
      case 'Contents':
        Navigator.push(context,
            ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Leave':
        Navigator.push(
            context, ScaleRoute(page: LeaveHomeScreen(leaves, leavesIcons)));
        break;
//      case 'Library':
//        Navigator.push(context, ScaleRoute(page: BookListScreen()));
//        break;
      case 'Notice':
        Navigator.push(context, ScaleRoute(page: NoticeScreen()));
        break;
      case 'About':
        Navigator.push(context, ScaleRoute(page: AboutScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
    }
  }

  static void getParentDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Child':
        Navigator.push(context, ScaleRoute(page: ChildListScreen()));
        break;
      case 'About':
        Navigator.push(context, ScaleRoute(page: AboutScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
    }
  }

  static void getAttendanceDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Class Atten':
        Navigator.push(context, ScaleRoute(page: StudentAttendanceHome()));
        break;
      case 'Search Atten':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentSearch(
              status: 'attendance',
            )));
        break;
      case 'My Atten':
        Navigator.push(context, ScaleRoute(page: TeacherAttendanceScreen()));
        break;
    }
  }
//
  static void getAcademicDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Subjects':
        Navigator.push(context, ScaleRoute(page: MySubjectScreen()));
        break;
      case 'Class Routine':
        Navigator.push(context, ScaleRoute(page: SearchRoutineScreen()));
        break;
      case 'My Routine':
        Navigator.push(context, ScaleRoute(page: TeacherMyRoutineScreen()));
        break;
    }
  }
//
  static void getLibraryDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
//      case 'Book List':
//        Navigator.push(context, ScaleRoute(page: BookListScreen()));
//        break;
//      case 'Books Issued':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: BookIssuedScreen(
//              id: id,
//            )));
//        break;
    }
  }
//
  static void getHomeworkDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'HW List':
        Navigator.push(context, ScaleRoute(page: TeacherHomework()));
        break;
      case 'Add HW':
        Navigator.push(context, ScaleRoute(page: AddHomeworkScrren()));
        break;
    }
  }
//
  static void getContentDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Content List':
        Navigator.push(context, ScaleRoute(page: ContentListScreen()));
        break;
      case 'Add Content':
        Navigator.push(context, ScaleRoute(page: AddContentScreeen()));
        break;
    }
  }
//
  static void getLeaveDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Leave List':
        Navigator.push(context, ScaleRoute(page: LeaveListScreen()));
        break;
      case 'Apply Leave':
        Navigator.push(context, ScaleRoute(page: ApplyLeaveScreen()));
        break;
    }
  }
//
  static void getExaminationDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Schedule':
        Navigator.push(
            context,
            ScaleRoute(
                page: ScheduleScreen(
              id: id,
            )));
        break;
      case 'Result':
        Navigator.push(
            context,
            ScaleRoute(
                page: ClassExamResultScreen(
              id: id,
            )));
        break;
    }
  }

  static void getOnlineExaminationDashboardPage(
      BuildContext context, String title,
      {var id}) {
    switch (title) {
//      case 'Active Exam':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: ActiveOnlineExamScreen(
//              id: id,
//            )));
//        break;
//      case 'Exam Result':
//        Navigator.push(
//            context,
//            ScaleRoute(
//                page: OnlineExamResultScreen(
//              id: id,
//            )));
//        break;
    }
  }

  static String getContentType(String ctype) {
    String type = '';
    switch (ctype) {
      case 'as':
        type = 'assignment';
        break;
      case 'st':
        type = 'study material';
        break;
      case 'sy':
        type = 'syllabus';
        break;
      case 'ot':
        type = 'others download';
        break;
    }
    return type;
  }

  static var weeks = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'thursday',
    'Friday',
  ];

  static String getAmPm(String time) {
    var parts = time.split(":");
    String part1 = parts[0];
    String part2 = parts[1];

    int hr = int.parse(part1);
    int min = int.parse(part2);

    if (hr <= 12) {
      return "$hr:$min AM ";
    } else {
      return "$hr:$min PM ";
    }
  }

  static String getExtention(String url) {
    var parts = url.split("/");
    return parts[parts.length - 1];
  }

  static String getDay(String date) {
//    print(date);
    var parts = date.split("-");
    return parts[0];
    //return parts[parts.length - 1];
  }
}
