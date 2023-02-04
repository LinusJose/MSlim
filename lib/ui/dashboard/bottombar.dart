import 'package:flutter/material.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/test/test.dart';
import 'package:sslim_mobile/ui/containar_tracking/container_tracking.dart';
import 'package:sslim_mobile/ui/dashboard/dashboardcontroller.dart';
import 'package:sslim_mobile/ui/settings/home_settings.dart';
import 'package:sslim_mobile/ui/sidebar/sidemenu.dart';
import 'package:sslim_mobile/ui/user/user.dart';

class BottomBar extends StatefulWidget {
  DashboardController? dashboardController;
  BottomBar({super.key, this.dashboardController});

  @override
  State<BottomBar> createState() => _BottomBarState(dashboardController);
}

class _BottomBarState extends State<BottomBar> {
  DashboardController? dashboardController;

  _BottomBarState(this.dashboardController);
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const SizedBox(child: Sidebar()),
    SizedBox(
      child: HomePage2(),
    ),
    const SizedBox(
      child: ContainerTracking(),
    ),
    const SizedBox(child: SettingsScreen()),
    const SizedBox(child: UserWindow()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: MainTheme.theme2,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: MainTheme.canvasColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: 'Tracking',
            backgroundColor: MainTheme.theme2,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: MainTheme.theme2,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'User',
            backgroundColor: MainTheme.theme2,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MainTheme.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
