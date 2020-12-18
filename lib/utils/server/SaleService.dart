import 'package:flutter/material.dart';
import 'package:sharpschool/screens/SaleReceipt.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/Fee.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/modal/SaleReceipt.dart';
import 'package:sharpschool/utils/modal/SaleReceiptDetail.dart';

import '../Utils.dart';

class SaleService{

  int _id;

  SaleService(this._id);

  List<SaleReceiptClass> saleReceiptMap = List();
  List<String> totalMap = List();

  Future<List<SaleReceiptClass>> fetchSale() async {

    saleReceiptMap.clear();

    var user_type,student_id,token;
    // await Utils.getStringValue('user_type').then((value){
    //   user_type = value;
    // });
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    // await Utils.getStringValue('id').then((value){
    //   student_id = value;
    // });
    user_type='student';
    student_id=_id.toString();
    final response = await http.get(InfixApi.getSale(student_id,user_type,'getSale',token));
    //print(response.body);
    var jsonData = json.decode(response.body);
    for(var sale in jsonData){
      List<SaleReceiptDetail> detail=List();
      for (var d in sale['detail']){
           detail.add(SaleReceiptDetail(d['item_name'].toString(),d['item_rate'].toString(),d['item_qty'].toString(),d['item_discount'].toString()));
      }
      saleReceiptMap.add(SaleReceiptClass(sale['bill_no'].toString(),sale['bill_date'].toString(),sale['total_amount'].toString(),sale['total_paid'].toString(),sale['balance'].toString(),detail));
    }

    return saleReceiptMap;

  }

  Future<List<String>> fetchTotalSale() async {

    var user_type,student_id,token;
    // await Utils.getStringValue('user_type').then((value){
    //   user_type = value;
    // });
    await Utils.getStringValue('token').then((value){
      token = value;
    });
    // await Utils.getStringValue('id').then((value){
    //   student_id = value;
    // });



    student_id=_id.toString();
    user_type='student';
    totalMap.clear();
    double _amount = 0;

    double _paid = 0;
    double _balance = 0;

    final response = await http.get(InfixApi.getTotalSale(student_id,user_type,'getTotalSale',token));

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