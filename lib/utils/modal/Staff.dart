import 'package:flutter/foundation.dart';

class Staff {
  int id;
  String name;
  String qualification;
  String currentAddress;
  String title;
  String maritalStatus;
  String dateOfJoining;
  String phone;
  String photo;

  Staff(
      {this.id,
      this.name,
      this.qualification,
      this.currentAddress,
      this.title,
      this.maritalStatus,
      this.dateOfJoining,
      this.phone,
      this.photo
      });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'],
      name: json['full_name'],
      qualification: json['qualification'],
      currentAddress: json['current_address'],
      title: json['title'],
      maritalStatus: json['marital_status'],
      dateOfJoining: json['date_of_joining'],
      phone: json['mobile'],
      photo: json['staff_photo'],
    );
  }
}

class StaffList {

  List<Staff> staffs;

  StaffList(this.staffs);

  factory StaffList.fromJson(List<dynamic> json) {
    List<Staff> staffList = List<Staff>();

    json=[{
      'id':12,
      'full_name':'Muaz Mir Saab',
      'qualification':'Bs-cs',
      'current_address':'Patoki Maliyaan',
      'title':'Tiele',
      'marital_status':'Chara',
      'date_of_joining':'10/2/89',
      'mobile':'03054992224',
      'staff_photo':'./asda/asdasd/asd',
    },
      {
        'id':13,
        'full_name':'Ahmed G',
        'qualification':'BS-CS',
        'current_address':'Patoki Maliyaan',
        'title':'Tiele',
        'marital_status':'Chara',
        'date_of_joining':'10/2/89',
        'mobile':'03054992224',
        'staff_photo':'./asda/asdasd/asd',
      }
      ,
      {
        'id':13,
        'full_name':'Faizan Ahmed',
        'qualification':'BS-CS',
        'current_address':'Patoki Maliyaan',
        'title':'Tiele',
        'marital_status':'Chara',
        'date_of_joining':'10/2/89',
        'mobile':'03054992224',
        'staff_photo':'./asda/asdasd/asd',
      }];
    staffList = json.map((i) => Staff.fromJson(i)).toList();
    return StaffList(staffList);
  }
}
