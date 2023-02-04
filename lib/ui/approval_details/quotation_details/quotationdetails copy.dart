// import 'dart:convert';
// // import 'dart:ffi';
// // import 'dart:math';

// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
// import 'package:sslim_mobile/api/api_service.dart';
// import 'package:sslim_mobile/main_theme.dart';
// import 'package:sslim_mobile/models/approval/quotation_details/Quotationresponse.dart';
// import 'package:sslim_mobile/ui/approval_details/quotation_details/components/common_button.dart';

// import '../../agent/agent_dashboard.dart';

// var _data;
// // var arrGrid;

// class QuotationPage extends StatefulWidget {
//   int? quotationNo;
//   QuotationPage(this.quotationNo);

//   @override
//   State<QuotationPage> createState() => _QuotationPageState();
// }

// class _QuotationPageState extends State<QuotationPage> {
//   late QuotationResponse quotationResponse;
//   var vQuotationResponse;
//   bool loading = true;
//   List<Table1> arrGrid = [];
//   List<Table2> datatable = [];
//   List<dynamic> qtnDetails = <dynamic>[];
//   List<dynamic> qtndata = <dynamic>[];
//   var qotNo;
//   @override
//   void initState() {
//     widget.quotationNo;
//     // TODO: implement initState
//     super.initState();
//     _getData();
//   }

//   void _getData() async {
//     quotationResponse = (await (serviceIntgration()));
//     if (quotationResponse.errorCode == 0) {
//       arrGrid = quotationResponse.data.table1;

//       datatable = quotationResponse.data.table2;
//       qotNo = quotationResponse.data.table1[0].quotationNo;

//       setState(() {
//         vQuotationResponse = quotationResponse.data.table;
//         loading = false;
//         for (var e in datatable) {
//           {
//             print(e.expImp.toString());
//             qtnDetails.add({
//               "Exp/Imp": e.expImp,
//               "FrtElement": e.frtElement,
//               "Def.Waiver": e.defWaiver,
//               "Add.Waiver": e.addWaiver,
//             });
//           }
//         }
//         for (var e in arrGrid) {
//           {
//             // print(e!.quotationNo.toString()),
//             qtndata.add({
//               "CType": e.cType,
//               "Haz": e.haz,
//               "Surch": e.surch,
//               "Boxes": e.boxes,
//               "FrtElement": e.frtElement,
//               "Flag": e.flag,
//               "Currency": e.currency,
//               "Tariff": e.tariff,
//               "QtdRate": e.qtdRate,
//               "CollectAgent": e.collectAgent,
//               "FrtType": e.frtElement
//             });
//           }
//         }
//         print(qtnDetails);
//       });
//     } else {
//       loading = false;
//       print('a');
//     }
//     // print(_data);
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? const Center(child: CircularProgressIndicator())
//         : Scaffold(
//             appBar: AppBar(
//               backgroundColor: MainTheme.theme2,
//               title: const Text('Quotation Details'),
//               toolbarHeight: 50,
//             ),
//             body: SingleChildScrollView(
//               physics: const ScrollPhysics(),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: List.generate(vQuotationResponse.element.length,
//                           (index) {
//                         return Container(
//                             child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   flex: 5,
//                                   child: Row(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(2.0),
//                                         child: Text(
//                                           vQuotationResponse
//                                               .element[index].title,
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(
//                                     flex: 1,
//                                     child: Row(
//                                       children: const [Text(" : ")],
//                                     )),
//                                 Expanded(
//                                     flex: 8,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: Text(vQuotationResponse
//                                           .element[index].value),
//                                     ))
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         ));
//                       }),
//                     ),
//                   ),
//                   const Divider(thickness: 1),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(left: 15, top: 1),
//                         child: const Text(
//                           'Charges',
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: MainTheme.greydark),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Container(
//                       padding: const EdgeInsets.all(5.0),
//                       child: DataTable(
//                         dataRowHeight: 25,
//                         decoration: BoxDecoration(
//                           // color: MainTheme.nearlyWhite,
//                           // border: Border.all(color: MainTheme.nearlyWhite),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         headingRowColor: MaterialStateColor.resolveWith(
//                             (states) => MainTheme.greywhite),
//                         headingRowHeight: 30,
//                         columns: const [
//                           DataColumn(
//                               label: Text('CType',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Haz',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Surch',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Boxes',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('FrtElement',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Flag',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Currency',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Tariff',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('QtdRate',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('CollectAgent',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('FrtType',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                         ],
//                         rows: qtndata
//                             .map(
//                               (p) => DataRow(cells: [
//                                 DataCell(
//                                   Text(p["CType"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Haz"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Surch"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Boxes"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["FrtElement"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Flag"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Currency"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Tariff"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["QtdRate"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["CollectAgent"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["FrtType"].toString()),
//                                 ),
//                               ]),
//                             )
//                             .toList(),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(left: 15, top: 10),
//                         child: const Text(
//                           'Waiver',
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: MainTheme.greydark),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Container(
//                       padding: const EdgeInsets.all(5.0),
//                       child: DataTable(
//                         //   columnSpacing: 9,
//                         dataRowHeight: 25,
//                         decoration: BoxDecoration(
//                           // color: MainTheme.nearlyWhite,
//                           // border: Border.all(color: MainTheme.nearlyWhite),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         headingRowColor: MaterialStateColor.resolveWith(
//                             (states) => MainTheme.greywhite),
//                         headingRowHeight: 30,
//                         columns: const [
//                           DataColumn(
//                               label: Text('Exp/Imp',
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('FrtElement',
//                                   softWrap: true,
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Def.Waiver',
//                                   softWrap: true,
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                           DataColumn(
//                               label: Text('Add.Waiver',
//                                   softWrap: true,
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: MainTheme.greylight))),
//                         ],
//                         rows: qtnDetails
//                             .map(
//                               (p) => DataRow(cells: [
//                                 DataCell(
//                                   Text(p["Exp/Imp"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["FrtElement"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Def.Waiver"].toString()),
//                                 ),
//                                 DataCell(
//                                   Text(p["Add.Waiver"].toString()),
//                                 ),
//                               ]),
//                             )
//                             .toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // backgroundColor: MainTheme.blue1,
//             bottomNavigationBar: CommonButton(qotNo),
//           );
//   }

//   Future<QuotationResponse> serviceIntgration() async {
//     final headers = {"Content-Type": "application/json", "Accept": "/"};
//     final response = await post(
//       Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
//       body: jsonEncode({
//         "SP_ID": "1004",
//         "param": {
//           "UserCode": "GIT",
//           "Status": "P",
//           "Agent": "",
//           "QuotationNo": widget.quotationNo
//         }
//       }),
//       headers: headers,
//     ).timeout(const Duration(seconds: 10));

//     // print(response.body);
//     QuotationResponse dataval = quotationResponseFromJson(response.body);

//     //  var pary_name=dataval!.data!.table![0]!.agentName;
//     return dataval;
//   }
// }

// showAlertDialog(BuildContext context, qotNo) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: const Text("Cancel"),
//     onPressed: () {
//       // AgentView();
//       // Navigator.of(context).pop();
//       Navigator.of(context, rootNavigator: true).pop('dialog');
//     },
//   );
//   Widget continueButton = TextButton(
//     child: const Text("Approve"),
//     onPressed: () async {
//       var approvalResponse = await ApiService().approvOrRejectButton(qotNo);
//       if (approvalResponse!.data!.table![0].status == "Success") {
//         print(approvalResponse.data!.table![0].status);
//         Navigator.of(context, rootNavigator: true).pop('dialog');
//         Get.off(const AgentView());
//       }
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: const Text(
//       "Quotation Approval",
//       style: TextStyle(fontSize: 17),
//     ),
//     content: const Text("Are you sure you want to Approve?"),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// showAlertDialog1(BuildContext context, qotNo) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: const Text("Cancel"),
//     onPressed: () {
//       Navigator.of(context, rootNavigator: true).pop('dialog');
//     },
//   );
//   Widget RejectButton = TextButton(
//     child: const Text("Reject"),
//     onPressed: () async {
//       var approvalResponse = await ApiService().QuotationDetailReject(qotNo);
//       if (approvalResponse!.data!.table![0].status == "Success") {
//         print(approvalResponse.data!.table![0].status);
//         Navigator.of(context, rootNavigator: true).pop('dialog');
//         Get.off(const AgentView());
//       }
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: const Text(
//       "Quotation Rejection",
//       style: TextStyle(fontSize: 17),
//     ),
//     content: const Text("Are you sure you want to Reject?"),
//     actions: [
//       cancelButton,
//       RejectButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
