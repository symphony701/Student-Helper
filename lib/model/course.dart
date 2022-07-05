//part 'course.g.dart';

import 'package:personal_ui/model/schedule.dart';

class Course {
  int? id;
  String? courseName;
  String? color;

  Course({this.id, this.courseName, this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courseName': courseName,
      'color': color,
    };
  }

  Course.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    courseName = map['courseName'];
    color = map['color'];
  }
}
