class Student{

//  int id;
//  int uid;
//  String photo;
//  String name;
//  int roll;
//  String className;
//  String sectionName;
  String id;
  String uid;
  String photo;
  String name;
  String roll;
  String className;
  String sectionName;

  Student({this.id, this.photo, this.name, this.roll, this.className,
      this.sectionName,this.uid});


  factory Student.fromJson(Map<String,dynamic> json){
    return Student(
      id: json['user_id'].toString(),
      photo: json['student_photo'],
      name: json['full_name'],
      roll: json['roll_no'].toString(),
      className: json['class_name'],
      sectionName: json['section_name'],
      uid: json['id'].toString(),
    );
  }
}
class StudentList{

  List<Student> students;

  StudentList(this.students);

  factory StudentList.fromJson(List<dynamic> json){
    List<Student> studentlist = List<Student>();
//    json=[
//      {'user_id':12,
//            'student_photo':'',
//            'full_name':'Faizan Ahmed',
//            'roll_no':1213,
//            'class_name':'10th',
//            'section_name':'Red',
//            'id':10},
//
//      {'user_id':13,
//              'student_photo':'',
//              'full_name':'Muaz Mir',
//              'roll_no':15,
//              'class_name':'10th',
//              'section_name':'Red',
//              'id':11}];
    try{
      studentlist = json.map((i) => Student.fromJson(i)).toList();
    }catch(e) {
      print(e);
    }
    return StudentList(studentlist);

  }

}