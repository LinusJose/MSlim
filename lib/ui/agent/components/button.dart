import 'package:flutter/material.dart';
import 'package:sslim_mobile/main_theme.dart';

class BottomButtonView extends StatefulWidget {
  // String Verified = '';

  const BottomButtonView({super.key});

  @override
  State<BottomButtonView> createState() => _BottomButtonViewState();
}

class _BottomButtonViewState extends State<BottomButtonView> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: MainTheme.theme2,
        textStyle: const TextStyle(
            color: MainTheme.white, fontSize: 10, fontStyle: FontStyle.normal),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onPressed: () => {},
      child: const Text('View'),
    );
  }
}
