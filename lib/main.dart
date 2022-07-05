import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_ui/bloc/courses/courses_bloc.dart';
import 'package:personal_ui/router/app_routes.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  await Window.initialize();
  await Window.setEffect(
    effect: WindowEffect.aero,
    color: const Color.fromARGB(50, 0, 0, 0),
  );
  runApp(MyApp());
  doWhenWindowReady(() {
    var initialSize = const Size(1150, 700);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
  });
}

class MyApp extends StatelessWidget {
  //final CourseDatabase courseDatabase;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoursesBloc>(
          create: (context) => CoursesBloc()..add(LoadStoreEvent()),
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
