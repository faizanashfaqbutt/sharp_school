

class Content{
  int id;
  String title;
  String type;
  String date;
  String mClass;
  String url;

  Content({this.id, this.title, this.type, this.date, this.mClass, this.url});

  factory Content.fromJson(Map<String,dynamic> json){
    return Content(
      id:json['id'],
      title: json['content_title'],
      type: json['content_type'],
      date: json['upload_date'],
      mClass: json['class'],
      url: json['upload_file'],
    );
  }
}
class ContentList{

  List<Content> contents;

  ContentList(this.contents);

  factory ContentList.fromJson(List<dynamic> json){

    List<Content> contentList = List<Content>();
json=[{
  'id':12,
  'content_title':'Book of Adventures',
  'content_type':'as',
  'upload_date':'12/8/20',
  'class':'5th',
  'upload_file':'./filepath',
},
  {
    'id':13,
    'content_title':'Book of Games',
    'content_type':'st',
    'upload_date':'12/8/20',
    'class':'5th',
    'upload_file':'./filepath',
  }];
    contentList = json.map((i)=> Content.fromJson(i)).toList();

    return ContentList(contentList);
  }

}