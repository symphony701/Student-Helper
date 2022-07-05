import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_ui/bloc/courses/courses_bloc.dart';
import 'package:personal_ui/widgets/side_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CoursesState>(builder: ((context, state) {
      context.read<CoursesBloc>().add(const LoadCoursesEvent());
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: const [SideBar()],
        ),
      );
    }));
  }
}
