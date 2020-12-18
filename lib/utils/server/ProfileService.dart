import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/InfixMap.dart';

class ProfileService {
  String username;
  String user_type;
  String token;
  String request_for;
  String id;
//  ProfileService({this.username,this.user_type,this.request_for,this.token});
  ProfileService({this.id,this.user_type,this.request_for,this.token});

  List<InfixMap> infixMap = List();

  Future<List<InfixMap>> fetchPersonalServices(String section) async {

    infixMap.clear();
    //final response = await http.get(id == null ? InfixApi.login(username, password) : InfixApi.getChildren(id));
//    final response = await http.get(InfixApi.profile(username) );

//    final response = await http.get(InfixApi.profile(username, user_type,request_for,token) );
    final response = await http.get(InfixApi.profile(id, user_type,request_for,token) );
//
    var jsonData = json.decode(response.body);


//
//    var details = jsonData['data']['userDetails'];
//    var religion = jsonData['data']['religion'];
//    var blood = jsonData['data']['blood_group'];
//    var transport = jsonData['data']['transport'];


    switch(section){

      case 'personal':
        infixMap.add(InfixMap('Date of birth',jsonData[0]['student_dob']));
        infixMap.add(InfixMap('Religion',jsonData[0]['student_religion']));
        infixMap.add(InfixMap('Phone number',jsonData[0]['student_mobile']));
        infixMap.add(InfixMap('Email address',jsonData[0]['student_email']));
        infixMap.add(InfixMap('Present address',jsonData[0]['student_address']));
        infixMap.add(InfixMap('Parmanent address',jsonData[0]['student_parmanent_address']));
        infixMap.add(InfixMap('Father\'s name',jsonData[0]['student_father_name']));
        infixMap.add(InfixMap('Mother\'s name',jsonData[0]['student_mother_name']));
        infixMap.add(InfixMap('Blood group',jsonData[0]['student_blood_group']));

//        infixMap.add(InfixMap('Date of birth',"1/1/1"));
//        infixMap.add(InfixMap('Religion',"ISlam"));
//        infixMap.add(InfixMap('Phone number',"123456789"));
//        infixMap.add(InfixMap('Email address',"email@email.com"));
//        infixMap.add(InfixMap('Present address',"nekapra "));
//        infixMap.add(InfixMap('Parmanent address',"nka pra"));
//        infixMap.add(InfixMap('Father\'s name',"Father Name"));
//        infixMap.add(InfixMap('Mother\'s name',"Mother Nmae"));
//        infixMap.add(InfixMap('Blood group',"o+"));
        break;
      case 'parents':
//              infixMap.add(InfixMap('Father\'s name',"father Name"));
//        infixMap.add(InfixMap('Father\'s phone',"306540"));
//        infixMap.add(InfixMap('Father\'s occupation',"Ocuu"));
//        infixMap.add(InfixMap('Mother\'s name',"mother"));
//        infixMap.add(InfixMap('Mother\'s phone',"454016"));
//        infixMap.add(InfixMap('Mother\'s occupation',"mocuu"));
//        infixMap.add(InfixMap('Guardian\'s name',"guard"));
//        infixMap.add(InfixMap('Guardian\'s email',"guard ema"));
//        infixMap.add(InfixMap('Guardian\'s occupation',"guad occ"));
//        infixMap.add(InfixMap('Guardian\'s phone',"454041"));
//        infixMap.add(InfixMap('Guardian\'s relation',"guardians_relation"));

        infixMap.add(InfixMap('Father\'s name',jsonData[0]['student_father_name']));
        infixMap.add(InfixMap('Father\'s phone',jsonData[0]['student_father_mobile']));
        infixMap.add(InfixMap('Father\'s NIC',jsonData[0]['student_father_nic']));
        infixMap.add(InfixMap('Father\'s occupation',jsonData[0]['student_father_occupation']));

        infixMap.add(InfixMap('Mother\'s name',jsonData[0]['student_mother_name']));
        infixMap.add(InfixMap('Mother\'s phone',jsonData[0]['student_mother_mobile']));
        infixMap.add(InfixMap('Mother\'s NIC',jsonData[0]['student_mother_nic']));
        infixMap.add(InfixMap('Mother\'s occupation',jsonData[0]['student_mother_occupation']));

        infixMap.add(InfixMap('Guardian',jsonData[0]['student_caretaker']));
        infixMap.add(InfixMap('Guardian\'s name',jsonData[0]['student_caretaker_name']));
        infixMap.add(InfixMap('Guardian\'s occupation',jsonData[0]['student_caretaker_occupation']));
        infixMap.add(InfixMap('Guardian\'s phone',jsonData[0]['student_caretaker_mobile']));
        infixMap.add(InfixMap('Guardian\'s relation',jsonData[0]['student_caretaker_relation']));
        break;
//      case 'transport':
//              infixMap.add(InfixMap('Driver\'s name',"Alex Bhatti"));
//        infixMap.add(InfixMap('Car no',"302"));
//        infixMap.add(InfixMap('Car model',"Boss-101"));
//        infixMap.add(InfixMap('Car info',"Good Car"));

//        infixMap.add(InfixMap('Driver\'s name',transport['driver_name']));
//        infixMap.add(InfixMap('Car no',transport['vehicle_no']));
//        infixMap.add(InfixMap('Car model',transport['vehicle_model']));
//        infixMap.add(InfixMap('Car info',transport['note']));
//        break;
//      case 'others':
//              infixMap.add(InfixMap('Height',"5.9"+'(inch)'));
//        infixMap.add(InfixMap('Weight',"65"+'(kg)'));
//        infixMap.add(InfixMap('Caste',""));
//        infixMap.add(InfixMap('National id',"34603-8965895-9"));
//
//        infixMap.add(InfixMap('Height',details['height']+'(inch)'));
//        infixMap.add(InfixMap('Weight',details['weight']+'(kg)'));
//        infixMap.add(InfixMap('Caste',details['caste']));
//        infixMap.add(InfixMap('National id',details['national_id_no']));
//        break;
      case 'profile':
        infixMap.add(InfixMap('name',jsonData[0]['student_first_name']+' '+jsonData[0]['student_last_name']));
        infixMap.add(InfixMap('section_name',jsonData[0]['section_name'].toString()));
        infixMap.add(InfixMap('class_name',jsonData[0]['class_name'].toString()));
        infixMap.add(InfixMap('roll_no',jsonData[0]['student_roll_no'].toString()));
        infixMap.add(InfixMap('adm',jsonData[0]['student_regno'].toString()));

//        infixMap.add(InfixMap('name',details['full_name']));
//        infixMap.add(InfixMap('section_name',details['section_name']));
//        infixMap.add(InfixMap('class_name',details['class_name']));
//        infixMap.add(InfixMap('roll_no',details['roll_no'].toString()));
//        infixMap.add(InfixMap('adm',details['admission_no'].toString()));
        break;

    }

    //Utils.showToast(infixMap[0].key+' '+infixMap[0].value);

    return infixMap;
  }



}