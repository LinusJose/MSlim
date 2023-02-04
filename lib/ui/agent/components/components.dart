import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sslim_mobile/main_theme.dart';

class DropDownTest extends StatefulWidget {
  const DropDownTest({super.key});

  @override
  State<DropDownTest> createState() => _DropDownTestState();
}

class _DropDownTestState extends State<DropDownTest> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        color: MainTheme.orange,
        height: 20,
        width: 120,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              '',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            buttonHeight: 20,
            buttonWidth: 80,
            itemHeight: 40,
          ),
        ),
      )
    ]);
  }
}
