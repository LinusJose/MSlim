import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/models/dashboard/response_model.dart';

class DashboardController extends GetxController {
  RxList<dynamic> griditems = [].obs;
  bool loading = false;
  DashboardController() {
    dashBoardItems();
  }

  dashBoardItems() async {
    String userName = '';

    final LocalStorage storage = LocalStorage('localstorage_app');
    Map<String, dynamic> loginCredentials =
        json.decode(storage.getItem('loginCredentials'));

    userName = loginCredentials["UserName"].toString();
    var QuotListingUserModel = (await ApiService().getDashBoardItems(userName));
    if (QuotListingUserModel.errorCode == 0) {
      griditems.value = QuotListingUserModel.data.table;
    }
    else {
        print('failed');
    }
    // {
    //   final headers = {"Content-Type": "application/json", "Accept": "/"};

    //   print("test");

    //   final response = await post(
    //     Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
    //     body: jsonEncode({
    //       "SP_ID": "1002",
    //       "param": {"UserCode": "GIT", "CompanyId": "1"}
    //     }),
    //     headers: headers,
    //   ).timeout(const Duration(seconds: 30));

    //   if (response.statusCode == 200) {
    //     print('suceess');
    //     DashBoardResponse dashBoardData =
    //         dashBoardResponseFromJson(response.body);

    //     griditems.value = dashBoardData.data.table;

    //     loading = false;

    //     // dashBoardData.data.table![0]!.requestType;
    //     // requestType1 = dashBoardData.data.table![0]!.requestType;
    //     // requestCount1 = dashBoardData.data.table![0]!.requestCount;

    //     // for (var i = 0; i < table!.length; i++) print(table);
    //   } else {
    //     print('failed');
    //   }
    // }
    throw (e) {
      print('exception in test');
    };
  }
}
