import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionSideBar extends StatefulWidget {
  final String title;
  final IconData icon;
  final String route;
  const OptionSideBar(
      {Key? key, required this.title, required this.icon, required this.route})
      : super(key: key);

  @override
  State<OptionSideBar> createState() => _OptionSideBarState();
}

class _OptionSideBarState extends State<OptionSideBar> {
  Color normalColor = const Color.fromARGB(216, 255, 255, 255);
  Color selectedColorBackground = const Color.fromARGB(255, 28, 33, 45);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent hover) {
        normalColor = const Color.fromARGB(255, 28, 33, 45);
        selectedColorBackground = const Color.fromARGB(255, 255, 216, 49);
        setState(() {});
      },
      onExit: (PointerExitEvent hover) {
        normalColor = const Color.fromARGB(216, 255, 255, 255);
        selectedColorBackground = const Color.fromARGB(255, 28, 33, 45);
        setState(() {});
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.route);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: selectedColorBackground,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(widget.icon, color: normalColor),
              const SizedBox(width: 20),
              Expanded(
                child: AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  widget.title,
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    color: normalColor,
                    fontWeight: FontWeight.w500,
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
