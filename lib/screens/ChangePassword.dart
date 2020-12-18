import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/apis/Apis.dart';

import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/Routine_row.dart';

// ignore: must_be_immutable
class ChangePassword extends StatefulWidget {
  String id;
  ChangePassword(this.id);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> weeks = AppFunction.weeks;

  TextEditingController old_password= new TextEditingController();

  TextEditingController new_password= new TextEditingController();

  TextEditingController new_confirm_password= new TextEditingController();

  bool response=false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    String user_type, token;
    Utils.getStringValue('user_type').then((value){
        user_type=value;
    });
    Utils.getStringValue('token').then((value){
      token=value;
    });
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: <Widget>[
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage('images/login_bg.png'),
                  //           fit: BoxFit.fill,
                  //         )),
                  //     child: Center(
                  //       child: Container(
                  //         height: 150.0,
                  //         width: 150.0,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               image: AssetImage('images/inflex_edu_logo.png'),
                  //             )),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: textStyle,
                               controller: old_password,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Old Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Old Password",
                                  labelText: "Old Password",
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
                              controller: new_password,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter New Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "New Password",
                                  labelText: "New Password",
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
                              controller: new_confirm_password,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter New Password';
                                }
                                if(value!=new_password.text){
                                  return 'Password Does Not Matches!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Confirm New Password",
                                  labelText: "Confirm New Password",
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
                                "Update Password",
                                style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onTap: () async {

                              // setState(() {
                              //   username=username_con.text;
                              //   password=password_con.text;
                              //   res=true;
                              // });


                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  response = true;
                                });
                                final res = await http.get(
                                    InfixApi.changePassword(
                                        widget.id, old_password.text,
                                        new_password.text, user_type,
                                        'changePassword', token));
                                var jsonData = json.decode(res.body);
                                Utils.showToast(jsonData['msg']);
                                if (jsonData['success']) {
                                  old_password.clear();
                                  new_password.clear();
                                  new_confirm_password.clear();
                                }
                                setState(() {
                                  response = false;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: response == true ? LinearProgressIndicator(
                              backgroundColor:Colors.green,
                            ):Text(''),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
    );
  }
}
