import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/services/course_db.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CourseDatabase courseDatabase;
  CoursesBloc(this.courseDatabase) : super(CoursesInitial()) {
    on<LoadCoursesEvent>(((event, emit) {
      //emit(CoursesLoadedState(courseDatabase.loadCourses()));
    }));
  }
}
