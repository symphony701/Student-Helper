import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_ui/widgets/windows_buttons.dart';

class RightSide extends StatefulWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  var hoursContainers = List<int>.generate(25, (i) => i * 8);
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  final List<String> hours = [
    '0:00 - 1:00',
    '1:00 - 2:00',
    '2:00 - 3:00',
    '3:00 - 4:00',
    '4:00 - 5:00',
    '5:00 - 6:00',
    '6:00 - 7:00',
    '7:00 - 8:00',
    '8:00 - 9:00',
    '9:00 - 10:00',
    '10:00 - 11:00',
    '11:00 - 12:00',
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17:00 - 18:00',
    '18:00 - 19:00',
    '19:00 - 20:00',
    '20:00 - 21:00',
    '21:00 - 22:00',
    '22:00 - 23:00',
    '23:00 - 24:00',
  ];
  @override
  Widget build(BuildContext context) {
    return ElasticInUp(
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  const WindowsButtons()
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Class schedules',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          '06/06/2022 - 12/06/2022',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 200,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 8, childAspectRatio: 200 / 125),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  right: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (index > 0 && index <= 7) {
                            return Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  days[index - 1],
                                  maxLines: 1,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (hoursContainers.contains(index)) {
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    width: 1,
                                  ),
                                  right: BorderSide(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  hours[((index / 8) - 1).toInt()],
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (index == 9) {
                            return _class(curseName: 'Complejidad Algoritmica');
                          }
                          if (index == 17) {
                            return _class(curseName: 'Complejidad Algoritmica');
                          }
                          if (index == 27) {
                            return _class(
                                curseName:
                                    'Aplicaciones para dispositivos moviles');
                          }
                          return Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(118, 0, 0, 0),
                                  width: 1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _class({required String curseName}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(174, 0, 0, 0),
            width: 1,
          ),
        ),
      ),
      child: Container(
        width: double.infinity - 10,
        height: double.infinity - 1,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 32, 194, 127),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: AutoSizeText(
            curseName,
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
