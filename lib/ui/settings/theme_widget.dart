import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyTheme with ChangeNotifier {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = Brightness.dark == true;
  ThemeMode currentTheme() {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
