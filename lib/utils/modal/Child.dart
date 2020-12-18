class Child{

  String id;
  String photo;
  String name;
  String roll;
  String className;
  String sectionName;
  //to roll back
  String class_id;
  String section_id;

  //
  Child({this.id, this.photo, this.name, this.roll, this.className,
    this.sectionName,this.class_id,this.section_id});


  factory Child.fromJson(Map<String,dynamic> json){
    return Child(
      id: json['user_id'].toString(),
      photo: json['student_photo'].toString(),
      name: json['student_name'].toString(),
      roll: json['roll_no'].toString(),
      className: json['class_name'].toString(),
      sectionName: json['section_name'].toString(),
      class_id: json['class_id'].toString(),
      section_id: json['section_id'].toString(),
    );
  }
}
class ChildList{

  List<Child> students;

  ChildList(this.students);

  factory ChildList.fromJson(List<dynamic> json){

    List<Child> studentlist = List<Child>();
    // json=[{'user_id':10,
    //   'student_photo':'./sdf',
    //   'student_name':'Muaz Mir Saaab!',
    //   'roll_no':120,
    //   'class_name':'10',
    //   'section_name':'Blue'},
    //   {'user_id':11,
    //     'student_photo':'./sdf',
    //     'student_name':'Faizan Ahmed !',
    //     'roll_no':121,
    //     'class_name':'9',
    //     'section_name':'Greeb'}];
    studentlist = json.map((i) => Child.fromJson(i)).toList();

    return ChildList(studentlist);

  }

}