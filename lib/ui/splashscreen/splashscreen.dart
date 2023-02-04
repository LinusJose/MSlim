import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/login/loginscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Get.to(const LoginScreen());
    });
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/splashlogo.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
