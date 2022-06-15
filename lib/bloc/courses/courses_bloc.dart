import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/services/courses_service.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CourseService _courseService;

  CoursesBloc(this._courseService) : super(CoursesInitial()) {
    on<LoadCoursesEvent>(((event, emit) {
      final courses = _courseService.getCourses();
      emit(CoursesLoadedState(courses));
    }));
  }
}
