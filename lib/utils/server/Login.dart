import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sharpschool/utils/FunctinsData.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils.dart';

class Login {
  final String username;
  final String password;
  final String user_type;
  final String request_for;

  Login(this.username, this.password, this.user_type, this.request_for);

  Future<bool> getData(BuildContext context) async {
    bool isSuccessed = false;
    int id;
    int rule;
    String image;
    Response response = await get(InfixApi.login(username, password, user_type, request_for));
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> user = json.decode(response.body) as Map;
        if (user['student_id'] != '' && user['student_id'] != null) {
          //print('in student');
          isSuccessed = true;
          saveBooleanValue('isLogged', isSuccessed);
          saveStringValue('username', username);
          saveStringValue('password', password);
          saveStringValue('id', user['student_id'].toString());
          saveStringValue('student_section', user['student_section'].toString());
          saveStringValue('student_class', user['student_class'].toString());
          saveStringValue('rule', user['rule']);
          saveStringValue('image', user['student_picture']);
          saveStringValue('lang', 'en');
          saveStringValue('user_type', user_type);
          saveStringValue('token', user['token']);
          AppFunction.getFunctions(context, user['rule'].toString(),user['student_id'].toString());
        } else {
          if (user['teacher_id'] != '' && user['teacher_id'] != null) {
            isSuccessed = true;
            saveBooleanValue('isLogged', isSuccessed);
            saveStringValue('id', user['teacher_id'].toString());
            saveStringValue('user_type', user_type);
            saveStringValue('token', user['token']);
            saveStringValue('lang', 'en');
            saveStringValue('rule', user['rule']);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            print(prefs.containsKey('id'));
            AppFunction.getFunctions(context, user['rule'].toString());
          } else {

            if (user['parent'] != '' && user['parent'] != null) {
              isSuccessed = true;
              saveStringValue('id', user['parent'].toString());
              saveBooleanValue('isLogged', isSuccessed);
              saveStringValue('user_type', user_type);
              saveStringValue('token', user['token']);
              saveStringValue('lang', 'en');
              saveStringValue('rule', user['rule'].toString());
              SharedPreferences prefs = await SharedPreferences.getInstance();
              print(prefs.containsKey('id'));


              //print(user['rule']);
               AppFunction.getFunctions(context, user['rule'].toString());
            }
          }
        }
      } catch (e) {
        print(e.toString());
      }
//print(user);

    }
    return isSuccessed;
  }

  Future<bool> saveBooleanValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<bool> saveStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}
