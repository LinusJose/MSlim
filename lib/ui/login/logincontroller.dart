import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
// import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/models/login/loginModel.dart';
import 'package:sslim_mobile/models/login/loginResponsemodal.dart';
import 'package:sslim_mobile/ui/dashboard/bottombar.dart';
import 'package:sslim_mobile/ui/sidebar/sidemenu.dart';

class Loogincontroller extends GetxController {
  // final LocalStorage storage = new LocalStorage('localstorage_app');
  Future<LoginModel?>? loginCall(String userName, password) async {
    try {
      final headers = {"Content-Type": "application/json", "Accept": "/"};
      print("test");

      final response = await post(
        Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
        body: jsonEncode({
          "SP_ID": "1001",
          "param": {
            "UserCode": userName,
            "CompanyId": "1",
            "Password": password
          }
        }),
        headers: headers,
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        LoginModelResponse dataVal = loginModelResponseFromJson(response.body);
        // String loginCredentials = "";
        // var data = jsonDecode(response.body.toString());
        dataVal.data.table[0].loginMsg;
        // loginCredentials = dataVal.data.table1[0].toJson().toString();
        if (dataVal.data.table[0].loginStatus == "SUCCESS") {

          final loginCredentials = json.encode(dataVal.data.table1[0]);
          // storage.setItem('loginCredentials', loginCredentials);  
          
          // SharedPreferences.setMockInitialValues({});
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('loginCredentials', loginCredentials);
          Get.off(BottomBar());
        }
      } else {
        print("Login Failed");
        alertBox();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

alertBox() {
  AlertDialog(
    actions: [Title(color: MainTheme.theme2, child: Text('Failed'))],
  );
}
