class Subject {
  String subjectName;
  String teacherName;
  String subjectCode;

  Subject({this.subjectName, this.teacherName, this.subjectCode});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectName: json['subject_name'],
      teacherName: json['teacher_name'],
      subjectCode: json['subject_code'],
    );
  }
}

class SubjectList {
  List<Subject> subjects;

  SubjectList(this.subjects);

  factory SubjectList.fromJson(List<dynamic> json) {
    List<Subject> subjects = List<Subject>();

//    json=[{
//      'subject_name':"Chemistry",
//      'teacher_name':"Muaz Mir",
//      'subject_type':"T",
//    },{
//      'subject_name':"Physics",
//      'teacher_name':"Muaz saaab",
//      'subject_type':"L",
//    },
//      {
//        'subject_name':"Maths",
//        'teacher_name':"Muaz Mir Saab",
//        'subject_type':"T",
//      }];
    subjects = json.map((i) => Subject.fromJson(i)).toList();

    return SubjectList(subjects);
  }
}
