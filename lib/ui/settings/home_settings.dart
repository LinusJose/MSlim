import 'package:flutter/material.dart';
import 'package:sslim_mobile/ui/settings/theme_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Settings'), backgroundColor: Colors.blue),
      body: const ThemeScreen(),

      // ListView(children: const [

      //   // DemoListTile(),
      //   // DemoListTile(),
      //   // DemoListTile(),
      //   // DemoListTile(),
      // ])
    );
  }
}
