import 'package:sharpschool/screens/admin/ApiProvider/StaffApiProvider.dart';
import 'package:sharpschool/utils/modal/LeaveAdmin.dart';
import 'package:sharpschool/utils/modal/LibraryCategoryMember.dart';
import 'package:sharpschool/utils/modal/Staff.dart';

class StaffRepository{


  StaffApiProvider _provider = StaffApiProvider();

  Future<LibraryMemberList> getStaff(){
    return _provider.getAllCategory();
  }

  Future<StaffList> getStaffList(int id){
    return _provider.getAllStaff(id);
  }

  Future<LeaveAdminList> getStaffLeave(String url , String endPoint){
    return _provider.getAllLeave(url,endPoint);
  }

}