part of 'courses_bloc.dart';

@immutable
abstract class CoursesEvent {}

class ChargeCoursesOfDataBase extends CoursesEvent {
  final List<CourseModel> coursesCharged;
  ChargeCoursesOfDataBase(this.coursesCharged);
}

class AddCourse extends CoursesEvent {
  final CourseModel course;
  AddCourse(this.course);
}
