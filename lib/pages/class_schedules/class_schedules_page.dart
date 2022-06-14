import 'package:flutter/material.dart';
import 'package:personal_ui/pages/class_schedules/right_side.dart';
import 'package:personal_ui/widgets/side_bar.dart';

class ClassSchedulesPage extends StatelessWidget {
  const ClassSchedulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: const [SideBar(), RightSide()],
      ),
    );
  }
}
