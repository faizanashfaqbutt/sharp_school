class TeacherSubject {
  String subjectName;
  String subjectCode;
  //String subjectType;
  int subjectId;

//  TeacherSubject({this.subjectName, this.subjectCode, this.subjectType,this.subjectId});
  TeacherSubject({this.subjectName, this.subjectCode,this.subjectId});

  factory TeacherSubject.fromJson(Map<String, dynamic> json) {
    return TeacherSubject(
      subjectName: json['subject_name'],
      subjectCode: json['subject_code'],
     // subjectType: json['subject_type'],
      subjectId: json['subject_id'],
    );
  }
}

class TeacherSubjectList {
  List<TeacherSubject> subjects;

  TeacherSubjectList(this.subjects);

  factory TeacherSubjectList.fromJson(List<dynamic> json) {
    List<TeacherSubject> subjects = List<TeacherSubject>();
//    json=[{
//      'subject_name':"Urdu",
//      'subject_code':"41ll",
//      'subject_type':'T',
//      'subject_id':12
//    },{
//      'subject_name':"English",
//      'subject_code':"409i",
//      'subject_type':'L',
//      'subject_id':13
//    }];
    subjects = json.map((i) => TeacherSubject.fromJson(i)).toList();

    return TeacherSubjectList(subjects);
  }
}
