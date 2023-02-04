//Author: Linus Elias Jose- 16681

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/dashboard/bottombar.dart';
import 'package:sslim_mobile/ui/login/logincontroller.dart';
import 'package:sslim_mobile/errorpipes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalStorage storage =
      new LocalStorage('localstorage_app'); //Local storage has been initialized
  final textFieldFocusNode = FocusNode(); //Set initial focus on password field
  bool hideVisibility = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//To hide password field
  void toggleVisibility() {
    setState(() {
      hideVisibility = !hideVisibility;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(Loogincontroller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainTheme.theme2,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Login"),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                height: 100.0,
                alignment: Alignment.center,
                child: Image.asset(
                  "asset/images/MSlim.png",
                  scale: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.man),
                      hintText: "User Code",
                      enabledBorder: OutlineInputBorder()),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: hideVisibility,
                  focusNode: textFieldFocusNode,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: toggleVisibility,
                          child: Icon(
                            hideVisibility
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                          )),
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder()),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: MainTheme.theme2, fontSize: 15),
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  var approvalResponse = await ApiService().loginCall(
                      userIdController.text.toString(),
                      passwordController.text);
                  if (approvalResponse!.errorCode == 0) {
                    if (approvalResponse.data.table[0].loginStatus ==
                        "SUCCESS") {
                      final loginCredentials =
                          json.encode(approvalResponse.data.table1[0]);
                      //  print(loginCredentials);
                      storage.setItem('loginCredentials',
                          loginCredentials); //Login data stored in Mob.Local storage

                      //       // SharedPreferences.setMockInitialValues({});
                      //       // SharedPreferences prefs = await SharedPreferences.getInstance();
                      //       // prefs.setString('loginCredentials', loginCredentials);
                      Get.off(BottomBar());
                    } else {
                      CommonFlushBar(errorConstants.invalidLogin);
                    }
                    return null;
                  }
                } on SocketException {
                  CommonFlushBar(errorConstants.invalidAdminNotif);

                  throw "server lost";
                } on TimeoutException {
                  CommonFlushBar(errorConstants.invalidAdminNotif);
                } catch (e) {
                  CommonFlushBar(errorConstants.invalidAdminNotif);

                  // print(e.toString());
                }
              },
              child: Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    color: MainTheme.theme2,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

//Common Flush bar function

  CommonFlushBar(textBody) {
    Flushbar(
      icon: Icon(
        Icons.warning,
        color: Colors.white,
        size: 30,
      ),
      margin: const EdgeInsets.symmetric(vertical: 160),
      duration: Duration(seconds: 1),
      padding: EdgeInsets.all(10),
      backgroundGradient: LinearGradient(
        colors: [Colors.red.shade500, Colors.red.shade300, Colors.red.shade100],
        stops: [0.4, 0.7, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: textBody,
      messageSize: 17,
    )..show(context);
    return textBody;
  }
}
