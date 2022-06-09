import 'package:flutter/material.dart';
import 'package:personal_ui/widgets/side_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [SideBar()],
      ),
    );
  }
}
