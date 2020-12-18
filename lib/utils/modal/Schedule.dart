class ClassRoutine {
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;

  ClassRoutine({this.startTime, this.endTime, this.subject, this.teacher});

  factory ClassRoutine.fromJson(Map<String, dynamic> json) {
    return ClassRoutine(
        startTime: json['start_time'],
        endTime: json['end_time'],
        subject: json['subject_name'],
        teacher: json['teacher']);
  }
}
