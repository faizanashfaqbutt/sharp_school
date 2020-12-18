class Leave{
  int id;
  String type;
  String status;
  String from;
  String to;
  String apply;

  Leave({this.id, this.type, this.status, this.from, this.to, this.apply});

  factory Leave.fromJson(Map<String,dynamic> json){
    return Leave(
      id:json['id'],
      type: json['type'],
      to: json['leave_to'],
      from: json['leave_from'],
      apply: json['apply_date'],
      status: json['approve_status'],
    );
  }
}
class LeaveList{

  List<Leave> leaves;

  LeaveList(this.leaves);

  factory LeaveList.fromJson(List<dynamic> json){

    List<Leave> contentList = List<Leave>();
    json=[{ 'id':12,
      'type':'ll',
      'leave_to':'12/1/18',
      'leave_from':'10/10/20',
      'apply_date':'2/9/12',
      'approve_status':'P'},
      { 'id':13,
        'type':'ll',
        'leave_to':'12/1/18',
        'leave_from':'10/10/20',
        'apply_date':'2/9/12',
        'approve_status':'A'},
      { 'id':13,
        'type':'ll',
        'leave_to':'12/1/18',
        'leave_from':'10/10/20',
        'apply_date':'2/9/12',
        'approve_status':'R'}];
    contentList = json.map((i)=> Leave.fromJson(i)).toList();

    return LeaveList(contentList);
  }

}