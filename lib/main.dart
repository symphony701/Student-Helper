import 'package:flutter/material.dart';
import 'package:personal_ui/pages/class_schedules/right_side.dart';
import 'package:personal_ui/router/app_routes.dart';
import 'package:personal_ui/widgets/side_bar.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    var initialSize = const Size(1150, 700);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Helper',
      initialRoute: AppRoutes.initialRouter,
      routes: AppRoutes.routes,
    );
  }
}
