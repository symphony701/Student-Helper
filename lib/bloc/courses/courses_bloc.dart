import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_ui/helper/db_helper.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/model/schedule.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  late DbHelper dbHelper;
  CoursesBloc() : super(CoursesInitial()) {
    on<LoadStoreEvent>(((event, emit) async {
      dbHelper = DbHelper();
    }));

    on<LoadCoursesEvent>(((event, emit) async {
      final List<Course> courses = await dbHelper.getCourses();
      emit(CoursesLoadedState(courses));
    }));

    on<AddCourseEvent>(((event, emit) async {
      final int id = await dbHelper.insertCourse(event.course);
      for (var e in event.schedules) {
        e['courseId'] = id;
      }
      for (var element in event.schedules) {
        await dbHelper.insertSchedule(Schedule(
          horaInicio: element['horaInicio'],
          horaFin: element['horaFin'],
          dia: element['dia'],
          courseId: element['courseId'],
        ));
      }
      List<Course> courses = await dbHelper.getCourses();
      emit(CoursesLoadedState(courses));
    }));
  }
}
