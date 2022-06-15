part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();
}

class CoursesInitial extends CoursesState {
  @override
  List<Object> get props => [];
}

class CoursesLoadedState extends CoursesState {
  final List<Course> courses;

  const CoursesLoadedState(this.courses);
  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}
