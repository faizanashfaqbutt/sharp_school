class Notice {
  String title;
  String date;
  String destails;

  Notice({this.title, this.date, this.destails});

  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
        title: json['notice_title'],
        date: json['notice_date'],
        destails: json['notice_message']);
  }
}

class NoticeList {

  List<Notice> notices;

  NoticeList(this.notices);

  factory NoticeList.fromJson(List<dynamic> json) {
    List<Notice> notices = List<Notice>();
    json=[{'notice_title':"Holiday Notice",
          'notice_date':"12/45/78",
         'notice_message':"Aj sab ko chuti ha moooj krien"},

        {'notice_title':"Parents Meeeting",
        'notice_date':"09/10/2020",
        'notice_message':"Beta "}];
    notices = json.map((i) => Notice.fromJson(i)).toList();

    return NoticeList(notices);
  }
}
