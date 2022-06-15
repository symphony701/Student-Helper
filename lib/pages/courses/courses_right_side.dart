import 'package:animate_do/animate_do.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_ui/bloc/courses/courses_bloc.dart';
import 'package:personal_ui/services/courses_service.dart';
import 'package:personal_ui/widgets/add_course_dialog.dart';
import 'package:personal_ui/widgets/course_item.dart';
import 'package:personal_ui/widgets/windows_buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesRightSide extends StatefulWidget {
  const CoursesRightSide({Key? key}) : super(key: key);

  @override
  State<CoursesRightSide> createState() => _CoursesRightSideState();
}

class _CoursesRightSideState extends State<CoursesRightSide> {
  @override
  Widget build(BuildContext context) {
    return ElasticInUp(
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  const WindowsButtons()
                ],
              ),
            ),
            Text(
              'Courses',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 28, 33, 45)),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AddCourseDialog();
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: Text(
                          'Add Course',
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocProvider(
                create: (context) =>
                    CoursesBloc(RepositoryProvider.of<CourseService>(context))
                      ..add(const LoadCoursesEvent()),
                child: BlocBuilder<CoursesBloc, CoursesState>(
                  builder: (context, state) {
                    if (state is CoursesLoadedState) {
                      if (state.courses.isEmpty) {
                        return Center(
                          child: Text(
                            'No courses yet :(',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }

                      return ListView(
                        shrinkWrap: true,
                        children: [
                          ...state.courses
                              .map((e) => CourseItem(
                                  color: Colors.amber,
                                  courseName: e.courseName))
                              .toList(),
                        ],
                      );
                    }
                    if (state is CoursesInitial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  },
                ),
/*
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CourseItem(
                      color: Colors.amber,
                      courseName: 'Course $index',
                    );
                  },
                  itemCount: 10,
                ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
