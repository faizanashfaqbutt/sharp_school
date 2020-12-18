class ClassExamName{
  String examName;
  int examId;

  ClassExamName({this.examName, this.examId});

  factory ClassExamName.fromJson(Map<String,dynamic> json){
    return ClassExamName(
      examId: json['exam_id'],
      examName: json['exam_name'],
    );
  }
}

class ClassExamList{

  List<ClassExamName> exams;

  ClassExamList(this.exams);

  factory ClassExamList.fromJson(List<dynamic> json){

    List<ClassExamName> exams = List<ClassExamName>();
    json=[{
    'exam_id':1,
    'exam_name':'Mid Terms'
    },
      {
        'exam_id':2,
        'exam_name':'Finals'
      }];
    exams = json.map((i) => ClassExamName.fromJson(i)).toList();

    return ClassExamList(exams);

  }
}