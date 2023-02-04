import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/login/loginscreen.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: SizedBox(
              width: 30,
              child: FloatingActionButton(
                onPressed: () {
                  Get.off(const LoginScreen());
                },
                backgroundColor: MainTheme.togglered,
                child: const Icon(
                  Icons.logout_rounded,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
