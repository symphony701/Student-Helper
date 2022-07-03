import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_ui/bloc/courses/courses_bloc.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/router/app_routes.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:personal_ui/services/course_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final courseDatabase = CourseDatabase();
  await courseDatabase.loadStore();
  await Window.initialize();
  await Window.setEffect(
    effect: WindowEffect.aero,
    color: const Color.fromARGB(50, 0, 0, 0),
  );
  runApp(MyApp(courseDatabase));
  doWhenWindowReady(() {
    var initialSize = const Size(1150, 700);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
  });
}

class MyApp extends StatelessWidget {
  final CourseDatabase courseDatabase;
  const MyApp(this.courseDatabase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => courseDatabase),
      ],
      child: BlocProvider(
        create: (context) =>
            CoursesBloc(courseDatabase)..add(const LoadCoursesEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Student Helper',
          initialRoute: AppRoutes.initialRouter,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
