import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/InfixMap.dart';

class About {
  List<InfixMap> infixMap = List();

  Future<List<InfixMap>> fetchAboutServices() async {
    infixMap.clear();

//    final response = await http.get(InfixApi.about);
//
//    var jsonData = json.decode(response.body);
//
//    var data = jsonData['data'];

//    infixMap.add(InfixMap('Description', data['main_description']));
//    infixMap.add(InfixMap('Address', data['address']));
//    infixMap.add(InfixMap('Phone', data['phone']));
//    infixMap.add(InfixMap('Email', data['email']));
//    infixMap.add(InfixMap('School Code', data['school_code']));
//    infixMap.add(InfixMap('Session', data['session']));
    infixMap.add(InfixMap('Description', "This is description"));
    infixMap.add(InfixMap('Address', 'Neka pura sialkot py'));
    infixMap.add(InfixMap('Phone', '03054992224'));
    infixMap.add(InfixMap('Email', 'butfaizan1@gmail.com'));
    infixMap.add(InfixMap('School Code', 'SKY-1452'));
    infixMap.add(InfixMap('Session', '2019-2020'));

    return infixMap;
  }

  static Future<int> phonePermission() async{
//    final response = await http.get(InfixApi.currentPermission);
//    var jsonData = json.decode(response.body);
//    int no = jsonData['data']['phone_number_privacy'];
//    return no;
  return 1;
  }

}
