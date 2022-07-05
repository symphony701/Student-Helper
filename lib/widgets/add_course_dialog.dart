import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_ui/bloc/courses/courses_bloc.dart';
import 'package:personal_ui/model/course.dart';
import 'package:personal_ui/widgets/schedule_picker_dialog.dart';

class AddCourseDialog extends StatefulWidget {
  AddCourseDialog({Key? key}) : super(key: key);

  @override
  State<AddCourseDialog> createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  Color pickerColor = const Color.fromARGB(255, 255, 82, 70);
  Color currentColor = const Color.fromARGB(255, 255, 82, 70);
  String courseName = '';
  List<Color> avalibleColors = const [
    Color.fromARGB(255, 255, 82, 70),
    Colors.orange,
    Color.fromARGB(255, 255, 59, 92),
    Colors.green,
    Colors.blue,
    Colors.amber,
  ];

  List<Map<dynamic, dynamic>> schedules = [];
  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      duration: const Duration(milliseconds: 600),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Course',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: TextField(
                  onChanged: (value) => courseName = value,
                  decoration: InputDecoration(
                    hintText: 'Course Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: BlockPicker(
                    availableColors: avalibleColors,
                    pickerColor: pickerColor,
                    onColorChanged: (color) {
                      setState(() {
                        pickerColor = color;
                        currentColor = color;
                      });
                    }),
              ),
              Text('Select Schedule',
                  style: GoogleFonts.montserrat(fontSize: 20)),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        width: 400,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${schedules[index]["dia"]}   ${schedules[index]["horaInicio"]}:00 - ${schedules[index]["horaFin"]}:00',
                                style: GoogleFonts.montserrat(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    schedules.removeAt(index);
                                  });
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: schedules.length,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SchedulePickerDialog();
                        }).then((value) {
                      if (value != null) {
                        setState(() {
                          schedules.add(value);
                        });
                      }
                    });
                  },
                  child: Container(
                    width: 400,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(FontAwesomeIcons.plus, size: 27),
                        const SizedBox(width: 10),
                        Text('Add Schedule',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<CoursesBloc, CoursesState>(builder: (context, state) {
                if (state is CoursesLoadedState) {
                  return ElevatedButton(
                    onPressed: () {
                      if (courseName.isNotEmpty && schedules.isNotEmpty) {
                        String colorString = currentColor
                            .toString()
                            .split('(0x')[1]
                            .split(')')[0];
                        context.read<CoursesBloc>().add(AddCourseEvent(
                            Course(color: colorString, courseName: courseName),
                            schedules));
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(400, 60),
                      primary: Colors.white,
                      side: BorderSide(
                        color: currentColor,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.check, color: currentColor),
                          const SizedBox(width: 10),
                          Text(
                            'Save Course',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              }),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(400, 60),
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.xmark, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        'Cancel',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
