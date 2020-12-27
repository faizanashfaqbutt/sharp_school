import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sharpschool/localization/app_translations.dart';
import 'package:sharpschool/localization/app_translations_delegate.dart';
import 'package:sharpschool/localization/application.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AppTranslationsDelegate _newLocaleDelegate;
  AppTranslations appTranslations;
  Animation animation;
  AnimationController controller;
  Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;

    //getting language code from memory and using this code we fetch translated data from asset/locale
    Utils.getStringValue('lang').then((value) {
      if (value != null) {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale(value));
        _newLocaleDelegate.load(Locale(value)).then((val) {
          if (!mounted) return;
          setState(() {
            appTranslations = val;
          });
        });
      }
    });

    Route route;
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    offsetAnimation = Tween<Offset>(
      begin: Offset(0,-1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    ));

    Future.delayed(Duration(seconds: 3), () {
      getBooleanValue('isLogged').then((value) {
        if (value) {
//        route = MaterialPageRoute(builder: (context) => Home());
        var id;
          Utils.getStringValue('id').then((value) {
            id=value;
          });
           Utils.getStringValue('rule').then((rule) {
            AppFunction.getFunctions(context, rule, id.toString());
          });
        } else {
          route = MaterialPageRoute(builder: (context) => LoginScreen());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/splash_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    height: 10.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/line.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            appTranslations != null ? appTranslations.text('Welcome to') : 'Welcome to',
                            style: TextStyle(
                              color: Color(0xFF727FC8),
                              fontSize: 20.0,
                              fontFamily: 'popins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SlideTransition(
                        position: offsetAnimation,
                           child:  Padding(
                            padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                  width: 150,
                                  padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit:BoxFit.contain,
                                            image:
                                            ExactAssetImage('images/text_logo.png'),
                                          ),
                                        ),
                              ),
                            ),
                            ),

                        // AnimatedBuilder(
                        //   animation: animation,
                        //   builder: (context, child) {
                        //     return Container(
                        //       margin:EdgeInsets.fromLTRB(0, animation.value, 0, 0),
                        //       height: 100,
                        //       width: 100,
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //           image:
                        //           ExactAssetImage('images/text_logo.png'),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: Text(
                            appTranslations != null ? appTranslations.text('Learn to Live') : 'Learn to Live',
                            style: TextStyle(
                                color: Color(0xFF727FC8),
                                fontSize: 10.0,
                                fontFamily: 'popins',
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 80.0, left: 40, right: 40),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> getBooleanValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  void onLocaleChange(Locale locale) {
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
  }
}
