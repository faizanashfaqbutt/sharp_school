import 'dart:convert';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sharpschool/screens/ChangePassword.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sharpschool/utils/CardItem.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/widget/ScaleRoute.dart';
//import 'package:rxdart/rxdart.dart';
import '../main.dart';
//import 'Profile.dart';

//notificatiopn handler
//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
//final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
//BehaviorSubject<ReceivedNotification>();

//final BehaviorSubject<String> selectNotificationSubject =
//BehaviorSubject<String>();

// class ReceivedNotification {
//   final int id;
//   final String title;
//   final String body;
//   final String payload;
//
//   ReceivedNotification(
//       {@required this.id,
//         @required this.title,
//         @required this.body,
//         @required this.payload});
// }

// ignore: must_be_immutable
class Home extends StatefulWidget {
  var _id;
  var _titles;
  var _images;
  var section_id;
  var class_id;
  Home(this._titles, this._images, [this._id]);

  @override
  _HomeState createState() => _HomeState(_titles, _images,_id);
}

class _HomeState extends State<Home> {
  bool isTapped;
  int currentSelectedIndex;
  int rtlValue;
  String _username;
  String _user_type;
  String _student_section;
  String _student_class;
  String _password;
  String _rule;
  String _id;
  var _titles;
  var _images;
  var class_id;
  var section_id;
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _HomeState(this._titles, this._images, [this._id]);


  @override
  void dispose() {
//    didReceiveLocalNotificationSubject.close();
//    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // print("dasd");
    // print(class_id);
    // print(section_id);
    saveStringValue('student_section', section_id.toString());
    saveStringValue('student_section', class_id.toString());

    //init settings for android
//    var initializationSettingsAndroid = AndroidInitializationSettings('launcher');
//    var initializationSettingsIOS = IOSInitializationSettings(
//        onDidReceiveLocalNotification:
//            (int id, String title, String body, String payload) async {
//          didReceiveLocalNotificationSubject.add(ReceivedNotification(
//              id: id, title: title, body: body, payload: payload));
//        });
//    var initializationSettings = InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//        flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: (String payload) async {
//          if (payload != null) {
//            debugPrint('notification payload: ' + payload);
//          }
//          selectNotificationSubject.add(payload);
//        });
//
//    didReceiveLocalNotificationSubject.stream
//        .listen((ReceivedNotification receivedNotification) async {
//      await showDialog(
//        context: context,
//        builder: (BuildContext context) => CupertinoAlertDialog(
//          title: receivedNotification.title != null
//              ? Text(receivedNotification.title)
//              : null,
//          content: receivedNotification.body != null
//              ? Text(receivedNotification.body)
//              : null,
//          actions: [
//            CupertinoDialogAction(
//              isDefaultAction: true,
//              child: Text('Ok'),
//              onPressed: () async {
////                Navigator.of(context, rootNavigator: true).pop();
////                await Navigator.push(
////                  context,
////                  MaterialPageRoute(
////                    builder: (context) =>
////                        SecondScreen(receivedNotification.payload),
////                  ),
////                );
//              },
//            )
//          ],
//        ),
//      );
//    });
    //selectNotificationSubject.stream.listen((String payload) async {
//      await Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => SecondScreen(payload)),
//      );
   // });

//    _firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);
//    _firebaseMessaging.getToken();

//    _firebaseMessaging.configure(
//        onMessage: (Map<String,dynamic> message)async{
//          print('onMessage: $message');
//          final notification = message['notification'];
//          setState(() {
//            //messages.add(Message(title: notification['title'],body: notification['body']));
//            //Utils.showToast(notification['title']);
//            _showNotification(notification['title'],notification['body']);
//          });
//        },
//        onLaunch: (Map<String,dynamic> message) async{
//          print('onLaunch: $message');
//        },
//        onResume: (Map<String,dynamic> message) async{
//          print('onResume: $message');
//        }
//    );
//    _firebaseMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true,badge: true,alert: true)
//    );



    isTapped = false;
    Utils.getStringValue('username').then((value) {
      _username = value;
    });
    Utils.getStringValue('password').then((value) {
      _password = value;
    });
    Utils.getStringValue('rule').then((value){
      _rule = value;
    });
    Utils.getStringValue('id').then((value){
      _id = value;
    });
    Utils.getStringValue('user_type').then((value){
      _user_type = value;
    });
    // Utils.getStringValue('student_class').then((value){
    //   _student_class=value;
    // });
    // Utils.getStringValue('student_section').then((value){
    //   _student_section=value;
    // });
    Utils.getIntValue('locale').then((value) {
      setState(() {
        rtlValue = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Theme.of(context).primaryColor, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(

        appBar: AppBar(
          primary: false,
          centerTitle: false,
          title:Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Image.asset(
                    'images/inflex_edu_logo.png',
                    width: 80.0,
                  ),
                ),
                Expanded(child: Container()),
                FutureBuilder(
                  future: Utils.getStringValue('username'),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    return getProfileImage(context, _username, _password, _rule);
                  },
                ),
              ],
            ),
          flexibleSpace: Image(
            image: AssetImage('images/tool_bar_bg.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,

          elevation: 0.0,
        ),
        body:
            Container(decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/homeBackground.png"),
                fit: BoxFit.cover,

              ),
            ),
            child:  GridView.builder(



              itemCount: _titles.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 5,
                  mainAxisSpacing: 10),

              itemBuilder: (context, index) {


                return CustomWidget(

                  index: index,
                  isSelected: currentSelectedIndex == index,
                  onSelect: () {
                    setState(() {
                      currentSelectedIndex = index;
                      if(_rule == '2'){
                        AppFunction.getDashboardPage(context, _titles[index],id:_id,classCode: class_id,sectionCode: section_id);
                      }else if(_rule == '4'){
                        AppFunction.getTeacherDashboardPage(context, _titles[index]);
                      }else if(_rule == '3'){

                        AppFunction.getParentDashboardPage(context, _titles[index]);
                      }else if(_rule == '1'){
                        AppFunction.getAdminDashboardPage(context, _titles[index]);
                      }
                    });
                  },
                  headline: _titles[index],
                  icon: _images[index],
                );
              },
            ),
            )

      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = FlatButton(
      child: Text("yes"),
      onPressed: () {
        Utils.clearAllValue();
//        Utils.saveBooleanValue('isLogged', false);
        Utils.saveIntValue('locale', rtlValue);
        Route route = MaterialPageRoute(builder: (context) => MyApp());
        Navigator.pushAndRemoveUntil(context, route,ModalRoute.withName('/'));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: Theme.of(context).textTheme.headline,
      ),
      content: Text("Would you like to logout?"),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showStudentProfileDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                      //color: const Color(0xFF66BB6A),
                      boxShadow: [BoxShadow(
                        color: Colors.deepPurple,
                        blurRadius: 20.0,
                      ),]
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0,right: 15.0),
                      child: ListView(
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "Profile",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: () {
                              //Navigator.push(context, ScaleRoute(page: Profile()));
                            },
                          ),
                          GestureDetector(
                            child:Text(
                              "Change Password",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,

                            ),
                              onTap:(){
                                Navigator.push(context,
                                    ScaleRoute(page: ChangePassword(_id)));
                              }


                          ),
                          GestureDetector(
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: (){
                              showAlertDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showOhtersProfileDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                      //color: const Color(0xFF66BB6A),
                      boxShadow: [BoxShadow(
                        color: Colors.deepPurple.shade300,
                        blurRadius: 20.0,
                      ),]
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0,right: 15.0),
                      child: ListView(
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "Change Password",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap:(){
                              Navigator.push(context,
                                  ScaleRoute(page: ChangePassword(_id)));
                            },
                          ),
                          SizedBox(height: 10.0,),
                          GestureDetector(
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            onTap: (){
                              showAlertDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }


  Widget getProfileImage(
      BuildContext context, String username, String password, String rule) {
    return FutureBuilder(
      future: getImageUrl(username, password, rule),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          Utils.saveStringValue('image', snapshot.data);
          return GestureDetector(
            onTap: () {
              rule == '2' ? showStudentProfileDialog(context) : showOhtersProfileDialog(context);
            },
            child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: CircleAvatar(
                  radius: 22.0,
                  backgroundImage: NetworkImage(snapshot.data),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              rule == '2' ? showStudentProfileDialog(context) : showOhtersProfileDialog(context);
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('https://via.placeholder.com/150/000000/FFFFFF/?text=User Image'),
                backgroundColor: Colors.transparent,
              ),
            ),
          );
        }
      },
    );
  }

  Future<String> getImageUrl(String username, String password, String rule) async {
    var image = 'https://via.placeholder.com/150/000000/FFFFFF/?text=User Image';

//    var response = await http.get(InfixApi.login(username, password,_user_type,'login'));
//
//    if (response.statusCode == 200) {
//      Map<String, dynamic> user = jsonDecode(response.body) as Map;
//      if (rule == '2')
//        image = InfixApi.root + user['data']['userDetails']['student_photo'];
//      else if (rule == '3')
//        image = InfixApi.root + user['data']['userDetails']['fathers_photo'];
//      else
//        image = InfixApi.root + user['data']['userDetails']['staff_photo'];
//    }
    //return '$image';
      return image;
  }

  void navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context);
  }
  void sendTokenToServer(String token) async{
    // final response = await http.get(InfixApi.setToken(_id,token));
    // if (response.statusCode == 200) {
    //   print('token updated : $token');
    // } else {
    //   throw Exception('Failed to load');
    // }
  }
  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: body != null ? Text(body) : null,
        actions: [
//          CupertinoDialogAction(
//            isDefaultAction: true,
//            child: Text('Ok'),
//            onPressed: () async {
//              Navigator.of(context, rootNavigator: true).pop();
//              await Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => Home(payload),
//                ),
//              );
//            },
//          )
        ],
      ),
    );
  }
  static Future<void> _showNotification(String title,String body) async {
//    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//        'infixEdu', 'infix', 'this channel description',
//        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
//    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//    var platformChannelSpecifics = NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//        0, '$title', '$body', platformChannelSpecifics,
//        payload: 'infixEdu');
  }
}

Future<bool> saveStringValue(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}