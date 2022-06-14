part of 'courses_bloc.dart';

@immutable
abstract class CoursesState {
  final List<CourseModel>? courses;

  const CoursesState({this.courses});
}

class CoursesInitialState extends CoursesState {
  const CoursesInitialState() : super(courses: null);
}

class CoursesChargeData extends CoursesState {
  final List<CourseModel> coursesCharged;
  const CoursesChargeData(this.coursesCharged) : super(courses: coursesCharged);
}
