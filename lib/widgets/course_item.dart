import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CourseItem extends StatefulWidget {
  Color color;
  String courseName;
  CourseItem({Key? key, required this.color, required this.courseName})
      : super(key: key);

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: widget.color,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: widget.color,
          ),
          const SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: widget.color,
            foregroundColor: Colors.white,
            radius: 35,
            child: Text(
              widget.courseName[0],
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: AutoSizeText(
              textAlign: TextAlign.start,
              widget.courseName,
              style: GoogleFonts.montserrat(
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
            ),
          ),
          FaIcon(
            FontAwesomeIcons.penToSquare,
            color: widget.color,
            size: 35,
          ),
          const SizedBox(width: 45),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _dialogDeleteCourse();
                    });
              },
              child: FaIcon(
                FontAwesomeIcons.trashCan,
                size: 35,
                color: widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dialogDeleteCourse() {
    return AlertDialog(
      title: Text('Delete Course',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          )),
      content: Text('Are you sure you want to delete this course?',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
