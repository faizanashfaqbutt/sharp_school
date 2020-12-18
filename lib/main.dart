import 'package:flutter/material.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:sharpschool/utils/Utils.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:sharpschool/utils/server/Login.dart';

import 'package:sharpschool/screens/Home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharp School',
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
      home: LoginScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username;
  String password;
//  String user_type="student";
  String user_type="teacher";
  bool response=false;
  TextEditingController username_con= new TextEditingController();
  TextEditingController password_con= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    var isLoggedIn=false;
    var loggedInID='';
    var loggedInRule='';
    Utils.getStringValue('id').then((value) {
      value;
      if(value.isNotEmpty){
        isLoggedIn=true;
      }
      loggedInID=value;
    });
    Utils.getStringValue('rule').then((value) {
      loggedInRule=value;
    });

   if(isLoggedIn){
     AppFunction.getFunctions(context,loggedInRule,loggedInID);

   }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/login_bg.png'),
                          fit: BoxFit.fill,
                        )),
                    child: Center(
                      child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(

                              image: AssetImage('images/text_logo.png'),
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    user_type = "student";
                                  });
                                },
                                color: user_type=="student"?
                                      Theme.of(context).primaryColor:
                                      Theme.of(context).accentColor,
                                textColor: Colors.white,
                                child: Text("Student",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    user_type = "teacher";
                                  });
                                },
                                color: user_type=="teacher"?
                                        Theme.of(context).primaryColor:
                                        Theme.of(context).accentColor,
                                textColor: Colors.white,
                                child: Text("Teacher",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {

                                    user_type = "parent";
                                  });
                                },
                                color: user_type=="parent"?
                                        Theme.of(context).primaryColor:
                                        Theme.of(context).accentColor,
                                textColor: Colors.white,
                                child: Text("Parents",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: textStyle,
                            controller: username_con,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "username",
                                labelText: "Username",
                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.pinkAccent, fontSize: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(

                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            style: textStyle,
                            controller: password_con,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'please enter a valid password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "password",
                                labelText: "Password",
                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                    color: Colors.pinkAccent, fontSize: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              "Login",
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              username=username_con.text;
                              password=password_con.text;
                            });
                            if (_formKey.currentState.validate()) {
                              response=true;
                              Login(username, password,user_type,'login').getData(context).then((result)=>{
                              if(!result){
                                setState(() {
                                  response=false;
                                }),
                                Utils.showToast("Invalid Credentials!")
                              }
                              });
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: response == true ? LinearProgressIndicator(
                            backgroundColor: Colors.green,

                          ):Text(''),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));

  }
}

void main() {
  runApp(MyApp());
}
