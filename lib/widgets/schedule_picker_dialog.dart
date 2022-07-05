import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePickerDialog extends StatefulWidget {
  SchedulePickerDialog({Key? key}) : super(key: key);

  @override
  State<SchedulePickerDialog> createState() => _SchedulePickerDialogState();
}

class _SchedulePickerDialogState extends State<SchedulePickerDialog> {
  String errorMessage = 'The initial hour must be less than the final hour';
  final List<String> _days = const [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  final List<int> _hours = const [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
  ];
  int? _initialHour = 0;
  int? _finalHour = 1;
  String? _selectedDay = 'Sunday';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Schedule',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Text('Select Day', style: GoogleFonts.montserrat(fontSize: 18)),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
                items: _days
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Center(child: Text(e)),
                        ))
                    .toList(),
                onChanged: (item) => {
                  setState(() {
                    _selectedDay = item;
                  })
                },
                value: _selectedDay,
              ),
            ),
            const SizedBox(height: 20),
            Text('Select Time', style: GoogleFonts.montserrat(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                      hint: const Text('Start'),
                      value: _initialHour,
                      items: _hours
                          .map((int e) => DropdownMenuItem<int>(
                              value: e, child: Text('$e:00')))
                          .toList(),
                      onChanged: (item) => {
                            setState(() {
                              _initialHour = item;
                            })
                          }),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                      hint: const Text('Start'),
                      value: _finalHour,
                      items: _hours
                          .map((int e) => DropdownMenuItem<int>(
                              value: e, child: Text('$e:00')))
                          .toList(),
                      onChanged: (item) => {
                            setState(() {
                              _finalHour = item;
                            })
                          }),
                ),
              ],
            ),
            _initialHour! >= _finalHour!
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 200,
                    child: AutoSizeText(
                      errorMessage,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {
                _initialHour! >= _finalHour!
                    ? null
                    : Navigator.pop(context, {
                        'horaInicio': _initialHour,
                        'horaFin': _finalHour,
                        'dia': _selectedDay,
                      })
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minimumSize: const Size(200, 50)),
              child: const Text('Set Schedule', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
