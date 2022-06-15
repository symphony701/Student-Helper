part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();
}

class LoadCoursesEvent extends CoursesEvent {
  const LoadCoursesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
