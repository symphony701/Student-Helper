part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();
}

class LoadStoreEvent extends CoursesEvent {
  @override
  List<Object> get props => [];
}

class LoadCoursesEvent extends CoursesEvent {
  const LoadCoursesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCourseEvent extends CoursesEvent {
  final Course course;
  final List<Map<dynamic, dynamic>> schedules;
  const AddCourseEvent(this.course, this.schedules);
  @override
  List<Object?> get props => [];
}
