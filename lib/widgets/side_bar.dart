import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_ui/widgets/option_side_bar.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return ElasticInLeft(
      duration: const Duration(milliseconds: 600),
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.2,
          color: const Color.fromARGB(255, 28, 33, 45),
          child: Column(
            children: [
              WindowTitleBarBox(child: MoveWindow()),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Dashboard',
                        icon: FontAwesomeIcons.layerGroup,
                        route: 'dashboard',
                      ),
                      const SizedBox(height: 25),
                      _dividerText(title: 'SCHEDULES'),
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Class schedules',
                        icon: FontAwesomeIcons.calendar,
                        route: 'class_schedules',
                      ),
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Exams schedules',
                        icon: FontAwesomeIcons.vialCircleCheck,
                        route: 'dashboard',
                      ),
                      const SizedBox(height: 25),
                      _dividerText(title: 'HELPERS'),
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Courses',
                        icon: FontAwesomeIcons.book,
                        route: 'dashboard',
                      ),
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Notes',
                        icon: FontAwesomeIcons.bookBookmark,
                        route: 'dashboard',
                      ),
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Grades',
                        icon: FontAwesomeIcons.userGraduate,
                        route: 'dashboard',
                      ),
                      const SizedBox(height: 20),
                      const OptionSideBar(
                        title: 'Important events',
                        icon: FontAwesomeIcons.solidCalendarDays,
                        route: 'dashboard',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _dividerText({required String title}) {
    return AutoSizeText(
      title,
      style: GoogleFonts.quicksand(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(131, 255, 255, 255),
      ),
    );
  }
}
