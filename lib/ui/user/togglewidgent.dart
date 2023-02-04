import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitchCommon extends StatelessWidget {
  const ToggleSwitchCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ToggleSwitch(
      minHeight: 20,
      minWidth: 20.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [Color.fromARGB(255, 151, 155, 151)],
        [Color.fromARGB(255, 250, 5, 83)]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: const Color.fromARGB(255, 224, 221, 221),
      inactiveFgColor: Colors.white,
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: const ['On', 'Off'],
      fontSize: 5,
      
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    ));
  }
}
