class LeaveAdmin{

  int id;
  String applyDate;
  String leaveFrom;
  String leaveTo;
  String reason;
  String status;
  String type;

  LeaveAdmin({this.id, this.applyDate, this.leaveFrom, this.leaveTo, this.reason,
      this.status,this.type});

  factory LeaveAdmin.fromJson(Map<String,dynamic> json){
    return LeaveAdmin(
      id: json['id'],
      applyDate: json['apply_date'],
      leaveFrom: json['leave_from'],
      leaveTo: json['leave_to'],
      status: json['approve_status'],
      reason: json['reason'],
      type: json['type'],
    );
  }
}

class LeaveAdminList{

  List<LeaveAdmin> leaves;

  LeaveAdminList(this.leaves);
  
  factory LeaveAdminList.fromJson(List<dynamic> json){

    List<LeaveAdmin> leaveList = List<LeaveAdmin>();
    json=[{'id':12,
    'apply_date':'20/8/9',
    'leave_from':'25/9/20',
    'leave_to':'12/8/20',
    'approve_status':'A',
    'reason':"Dill kr rha aj !",
    'type':'F'},
      {'id':12,
        'apply_date':'20/8/9',
        'leave_from':'25/9/20',
        'leave_to':'12/8/20',
        'approve_status':'P',
        'reason':"Dill kr rha aj !",
        'type':'F'},
      {'id':12,
        'apply_date':'20/8/9',
        'leave_from':'25/9/20',
        'leave_to':'12/8/20',
        'approve_status':'R',
        'reason':"Dill kr rha aj !",
        'type':'F'}];
    leaveList = json.map((i) => LeaveAdmin.fromJson(i)).toList();
    
    return LeaveAdminList(leaveList);
    
  }
  
}