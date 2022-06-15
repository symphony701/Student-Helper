import 'package:hive/hive.dart';

part 'course.g.dart';

@HiveType(typeId: 1)
class Course extends HiveObject {
  @HiveField(0)
  final String courseName;
  @HiveField(1)
  final String color;
  @HiveField(2)
  final List<Map<dynamic, dynamic>> shedule;

  Course(this.courseName, this.shedule, this.color);
}
