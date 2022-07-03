//part 'course.g.dart';

import 'package:objectbox/objectbox.dart';
import 'package:personal_ui/model/schedule.dart';

@Entity()
class Course {
  int id = 0;
  String courseName;
  String color;

  @Backlink()
  final schedules = ToMany<Schedule>();

  Course(this.courseName, this.color);
}
