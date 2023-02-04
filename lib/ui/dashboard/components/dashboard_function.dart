import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/agent/agent_dashboard.dart';
import 'package:sslim_mobile/ui/agent/party/partyrole.dart';
import 'package:sslim_mobile/ui/dashboard/dashboardcontroller.dart';
import 'package:sslim_mobile/ui/waiver/waiver_dashboard.dart';

import '../../waiver/waiverdashboard.dart';

var dashboardcontroller = Get.put(DashboardController());

navigationAgent(name) {
  switch (name.toString().toUpperCase()) {
    case "QUOTATION":
      Get.to(AgentView());
      break;
    case "PARTY":
      Get.to(const PartyRole());
      break;
      case "WAIVER":
      Get.to(const WaiverdashboardView());
      break;
    default:
      {
        print("Invalid choice");
      }
      break;
  }
}

dailogBox() {
  Get.defaultDialog(
      title: "Pending Count",
      middleText: 'Pending Count',
      backgroundColor: MainTheme.theme2,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      radius: 30);
}

