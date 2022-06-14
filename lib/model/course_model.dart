import 'package:objectbox/objectbox.dart';

@Entity()
class CourseModel {
  int id = 0;
  String name;
  String color;
  String schedule;

  CourseModel(
      {required this.name, required this.color, required this.schedule});
}
