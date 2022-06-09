import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';

class WindowsButtons extends StatelessWidget {
  const WindowsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton(),
      ],
    );
  }
}
