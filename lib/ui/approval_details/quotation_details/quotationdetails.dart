import 'dart:convert';
// import 'dart:ffi';
// import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/models/approval/quotation_details/Quotationresponse.dart';
import 'package:sslim_mobile/ui/approval_details/quotation_details/components/common_button.dart';
import 'package:sslim_mobile/ui/approval_details/quotation_details/components/widgets.dart';

import '../../agent/agent_dashboard.dart';

var _data;
// var arrGrid;

class QuotationPage extends StatefulWidget {
  int quotationNo;
  QuotationPage(this.quotationNo);

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  late QuotationResponse quotationResponse;
  Table1? data1;
  bool loading = true;
  List<Rows1> datatable1 = [];
  List<Rows2> datatable2 = [];
  // List<dynamic> qtnDetails = <dynamic>[];
  // List<dynamic> qtndata = <dynamic>[];
  String qotNo = '';
  String? userName;
  final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
    getitemFromLocalStorage();
    widget.quotationNo;
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    var quotationResponse = (await ApiService()
        .selectedQuotationDetails(userName, widget.quotationNo));
    // quotationResponse = (await (serviceIntgration()));
    if (quotationResponse.errorCode == 0) {
      qotNo = quotationResponse.data.table1[0].elements[0].value.toString();

      setState(() {
        datatable1 = quotationResponse.data.table1;
        datatable2 = quotationResponse.data.table2;
        data1 = quotationResponse.data.table;
        loading = false;

        // print(qtnDetails);
      });
    } else {
      loading = false;
    }
    // print(_data);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quotation Details'),
            backgroundColor: Colors.blue,
            bottom: const TabBar(
              unselectedLabelStyle: TextStyle(color: Colors.black),
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  // icon: Icon(Icons.my_library_books),
                  text: "Primary",
                ),
                Tab(
                  // icon: Icon(Icons.book_rounded),
                  text: "Charges",
                ),
                Tab(
                  // icon: Icon(Icons.table_bar),
                  text: "Waiver",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              QuotationDetails(data1: data1!),
              QuotationDetailsGrid1(datatable1: datatable1),
              QuotationDetailsGrid2(datatable2: datatable2),
            ],
          ),
          bottomNavigationBar: CommonButton(qotNo),
        ));
  }

  void getitemFromLocalStorage() {
    Map<String, dynamic> loginCredentials =
        json.decode(storage.getItem('loginCredentials'));
    userName = loginCredentials["UserName"].toString();
  }
}

showAlertDialog(BuildContext context, qotNo) {
  String userName = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  Map<String, dynamic> loginCredentials =
      json.decode(storage.getItem('loginCredentials'));

  userName = loginCredentials["UserName"].toString();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      // AgentView();
      // Navigator.of(context).pop();
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Approve"),
    onPressed: () async {
      var approvalResponse =
          await ApiService().approvOrRejectButton(qotNo, userName);
      if (approvalResponse!.data!.table![0].status == "Success") {
        print(approvalResponse.data!.table![0].status);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Get.off(const AgentView());
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

showAlertDialog1(BuildContext context, qotNo) {
  // set up the buttons
  String userName;
  String locationId = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  Map<String, dynamic> loginCredentials =
      json.decode(storage.getItem('loginCredentials'));
  userName = loginCredentials["UserName"].toString();
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget RejectButton = TextButton(
    child: const Text("Reject"),
    onPressed: () async {
      var approvalResponse =
          await ApiService().QuotationDetailReject(qotNo, userName);
      if (approvalResponse!.data!.table![0].status == "Success") {
        print(approvalResponse.data!.table![0].status);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Get.off(const AgentView());
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
