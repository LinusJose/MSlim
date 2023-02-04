import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/waiver/components/button.dart';
import 'package:sslim_mobile/ui/waiver/waiver_dashboard.dart';
import 'package:sslim_mobile/ui/waiver/waiverdashboard.dart';
import '../../models/waiver/waivercontractdetailResponse.dart';

var _data;
// var arrGrid;

class WaiverPage extends StatefulWidget {
  int RequestId;
  WaiverPage(this.RequestId);

  @override
  State<WaiverPage> createState() => _WaiverPageState();
}

class _WaiverPageState extends State<WaiverPage> {
  late WaiverContractDetailsResponse waiverResponse;
  var vWaiverdetailstable;

  bool loading = true;
  var qotNo;
  String userName = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
     getitemFromLocalStorage();
    widget.RequestId;
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    var waiverResponse =
        (await ApiService().waiverServiceIntgration(widget.RequestId,userName));
    // waiverResponse = (await (serviceIntgration()));
    if (waiverResponse.errorCode == 0) {
      setState(() {
        vWaiverdetailstable = waiverResponse.data!.table;

        loading = false;
      });
    } else {
      loading = false;
      print('a');
    }
    // print(_data);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: MainTheme.theme2,
              title: const Text('Waiver Details'),
              toolbarHeight: 50,
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                          vWaiverdetailstable.element.length, (index) {
                        return Container(
                            child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          vWaiverdetailstable
                                              .element[index].title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: const [Text(" : ")],
                                    )),
                                Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(vWaiverdetailstable
                                          .element[index].value),
                                    ))
                              ],
                            ),
                          ],
                        ));
                      }),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: AprveOrRejButton(widget.RequestId),
          );
  }

 void getitemFromLocalStorage() {
    Map<String, dynamic> loginCredentials =
        json.decode(storage.getItem('loginCredentials'));
    print(loginCredentials);

    // print(info["UserName"]);
    userName = loginCredentials["UserName"].toString();
  }

}

showAlertDialog(BuildContext context, RequestId) {
  String userName = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  Map<String, dynamic> loginCredentials =
      json.decode(storage.getItem('loginCredentials'));
  userName = loginCredentials["UserName"].toString();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Approve"),
    onPressed: () async {
      var approvalResponse =
          await ApiService().approveButton(RequestId, userName);
      if (approvalResponse!.data!.table![0].status == "Success") {
        print(approvalResponse.data!.table![0].status);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Get.off(WaiverdashboardView());
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Quotation Approval",
      style: TextStyle(fontSize: 17),
    ),
    content: const Text("Are you sure you want to Approve?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog1(BuildContext context, RequestId) {
  String userName = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  Map<String, dynamic> loginCredentials =
      json.decode(storage.getItem('loginCredentials'));
  userName = loginCredentials["UserName"].toString();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget RejectButton = TextButton(
    child: const Text("Reject"),
    onPressed: () async {
      var approvalResponse = await ApiService().RejButton(RequestId, userName);
      if (approvalResponse!.data!.table![0].status == "Success") {
        print(approvalResponse.data!.table![0].status);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Get.off(WaiverdashboardView());
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Quotation Rejection",
      style: TextStyle(fontSize: 17),
    ),
    content: const Text("Are you sure you want to Reject?"),
    actions: [
      cancelButton,
      RejectButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
