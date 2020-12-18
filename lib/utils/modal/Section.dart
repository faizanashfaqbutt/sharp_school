class Section {
  String name;
  int id;

  Section({this.name, this.id});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(name: json['section_name'], id: json['section_id']);
  }
}

class SectionList {

  List<Section> sections = List<Section>();

  SectionList(this.sections);

  factory SectionList.fromJson(List<dynamic> json) {
    List<Section> sectionList;
   // print(json);
//    json=[{'section_name':'blue', 'section_id': 14},
//      {'section_name':'red', 'section_id': 15}];
    sectionList = json.map((i) => Section.fromJson(i)).toList();

    return SectionList(sectionList);
  }
}
