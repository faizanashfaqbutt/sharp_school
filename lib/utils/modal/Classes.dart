class Classes {
  String name;
  int id;

  Classes({this.name, this.id});

  factory Classes.fromJson(Map<String, dynamic> json) {
    return Classes(name: json['class_name'], id: json['class_id']);
  }
}

class ClassList {

  List<Classes> classes = List<Classes>();

  ClassList(this.classes);

  factory ClassList.fromJson(List<dynamic> json) {
    List<Classes> classList;
//    json=[{'class_name':"5th ", 'id': 12},
//      {'class_name':"10th ", 'id': 13}];
    //print(json);
//    json=[{'class_name':'Pre Nursery','id':2},
//      {'class_name':'Pre Nursery','id':2}];

    classList = json.map((i) => Classes.fromJson(i)).toList();

    return ClassList(classList);
  }
}
