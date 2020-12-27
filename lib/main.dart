import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sharpschool/screens/SplashScreen.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/theme.dart';
import 'package:sharpschool/utils/Utils.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isRTL;

  @override
  void initState() {
    super.initState();
    Utils.getIntValue('locale').then((value) {
      setState(() {
        isRTL = value == 0 ? true : false;
        //Utils.showToast('$isRTL');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return isRTL != null ? isRTL
        ? MaterialApp(
      title: "infixEdu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.red,
        primaryColor: Color(0xff0361a0),
        accentColor: Color(0xff0098FE),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 26.0, fontStyle: FontStyle.normal),
          headline3: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
          headline4: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
          headline5: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
          headline6: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),

          //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Splash(),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
    )
        : MaterialApp(
      title: "infixEdu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.red,
        primaryColor: Color(0xff0361a0),
        accentColor: Color(0xff0098FE),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 26.0, fontStyle: FontStyle.normal),
          headline3: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
          headline4: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
          headline5: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
          headline6: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),

          //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Splash(),
      ),
    ): Material(child: Directionality(textDirection: TextDirection.ltr,child: Center(child: Text('The Sky School'))));
  }
}
