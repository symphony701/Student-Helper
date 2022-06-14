import 'package:flutter/material.dart';
import 'package:personal_ui/pages/courses/courses_right_side.dart';
import 'package:personal_ui/widgets/side_bar.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: const [SideBar(), CoursesRightSide()],
      ),
    );
  }
}
