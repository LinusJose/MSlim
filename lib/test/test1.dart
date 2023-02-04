import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sslim_mobile/ui/dashboard/components/dashboard_widget.dart';

import 'package:sslim_mobile/ui/dashboard/dashboardcontroller.dart';
import 'package:sslim_mobile/ui/login/loginscreen.dart';

class PullRefreshPage extends StatefulWidget {
  const PullRefreshPage();

  @override
  State<PullRefreshPage> createState() => _PullRefreshPageState();
}

class _PullRefreshPageState extends State<PullRefreshPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _pullRefresh,
      child: const GetDashBoardView(),
    ));
  }

  Future<void> _pullRefresh() async {
    setState(() {
      DashboardController();
    });
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        child: Text("This is the Logout Page"),
      ),
    );
  }
}
