import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/Fee.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Utils.dart';

class FeeService{

  int _id;

  FeeService(this._id);

  List<Fee> feeMap = List();
  List<String> totalMap = List();

  Future<List<Fee>> fetchFee() async {

    feeMap.clear();

    var student_class,student_section,token,student_id;
    // await Utils.getStringValue('student_class').then((value){
    //   student_class = value;
    // });
    // await Utils.getStringValue('student_section').then((value){
    //   student_section = value;
    // });
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    // await Utils.getStringValue('id').then((value){
    //   student_id = value;
    // });

    // final response = await http.get(InfixApi.getFees(student_id,student_class,student_section,'getFees',token));
    final response = await http.get(InfixApi.getFees(_id.toString(),'getFees',token));

    var jsonData = json.decode(response.body);

    //bool isSuccess = jsonData['success'];
    var data = jsonData;
//
//    if(isSuccess){
      for(var f in data){
          feeMap.add(Fee(f['fees_name'], f['due_date'], f['amount'].toString(), f['paid'].toString(), f['balance'].toString(),f['discount_amount'].toString(), f['fine'].toString(),f['fees_type_id']));
      }
//
//    }else{
//      Utils.showToast('try again later');
//    }

//    feeMap.add(Fee("Tution fee", "12/12/12", 2200.toString(), 2000.toString(), 200.toString(),20.toString(), 120.toString(),0));
//    feeMap.add(Fee("Admission fee", "12/12/12", 2200.toString(), 2000.toString(), 200.toString(),20.toString(), 120.toString(),9879));
//    feeMap.add(Fee("Tution fee", "12/12/12", 2200.toString(), 2000.toString(), 200.toString(),20.toString(), 120.toString(),9879));

    return feeMap;

  }

  Future<List<String>> fetchTotalFee() async {

    var student_class,student_section,token,student_id;
    // await Utils.getStringValue('student_class').then((value){
    //   student_class = value;
    // });
    // await Utils.getStringValue('student_section').then((value){
    //   student_section = value;
    // });
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    // await Utils.getStringValue('id').then((value){
    //   student_id = value;
    // });




    totalMap.clear();
    double _amount = 0;
    double _discount = 0;
    double _fine = 0;
    double _paid = 0;
    double _balance = 0;

    // final response = await http.get(InfixApi.getTotalFees(student_id,student_class,student_section,'getTotalFees',token));
    final response = await http.get(InfixApi.getTotalFees(_id.toString(),'getTotalFees',token));

    var jsonData = json.decode(response.body);

//
//    bool isSuccess = jsonData['success'];
//
    var data = jsonData;

//    if(isSuccess){
//      for(var f in data){
//
//        _amount = _amount + double.parse(f['amount']);
//        _discount = _discount + double.parse(f['discount_amount']);
//        _fine = _fine + double.parse(f['fine']);
//        _paid = _paid + double.parse(f['paid']);
//        _balance = _balance + double.parse(f['balance']);
//
//
//      }
//
//
//    print(data);
    print(data['amount']);

//      totalMap.add(_amount.toString());
//      totalMap.add(_discount.toString());
//      totalMap.add(_fine.toString());
//      totalMap.add(_paid.toString());
//      totalMap.add(_balance.toString());
    totalMap.add(data['amount'].toString());
    totalMap.add(data['discount_amount'].toString());
    totalMap.add(data['fine'].toString());
    totalMap.add(data['paid'].toString());
    totalMap.add(data['balance'].toString());
//
//    }else{
//      Utils.showToast('try again later');
//    }

//    totalMap.add(125.toString());
//    totalMap.add(10.toString());
//    totalMap.add(20.toString());
//    totalMap.add(100.toString());
//    totalMap.add(200.toString());
    return totalMap;

  }


}