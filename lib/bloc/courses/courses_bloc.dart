import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_ui/model/course_model.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(const CoursesInitialState()) {
    on<ChargeCoursesOfDataBase>((event, emit) {
      // TODO: implement event handler
    });
  }
}
