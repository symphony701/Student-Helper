import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/router/app_routes.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:personal_ui/services/courses_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final courseService = CourseService();
  await courseService.init();
  await Window.initialize();
  await Window.setEffect(
    effect: WindowEffect.aero,
    color: const Color.fromARGB(50, 0, 0, 0),
  );
  runApp(MyApp(
    courseService: courseService,
  ));
  doWhenWindowReady(() {
    var initialSize = const Size(1150, 700);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
  });
}

class MyApp extends StatelessWidget {
  final CourseService courseService;

  const MyApp({super.key, required this.courseService});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => courseService,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Helper',
        initialRoute: AppRoutes.initialRouter,
        routes: AppRoutes.routes,
      ),
    );
  }
}
