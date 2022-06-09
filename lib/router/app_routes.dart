import 'package:flutter/material.dart';
import 'package:personal_ui/pages/class_schedules/class_schedules_page.dart';
import 'package:personal_ui/pages/dashboard/dashboard_page.dart';

class AppRoutes {
  static const initialRouter = 'dashboard';
  static Map<String, Widget Function(BuildContext)> routes = {
    'dashboard': (BuildContext context) => const DashboardPage(),
    'class_schedules': (BuildContext context) => const ClassSchedulesPage(),
  };
  static onGeneratedRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const DashboardPage());
  }
}
