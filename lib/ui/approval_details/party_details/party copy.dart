// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sslim_mobile/api/api_service.dart';
// import 'package:sslim_mobile/main_theme.dart';
// import 'package:sslim_mobile/ui/agent/party/partyrole.dart';
// import '../quotation_details/components/common_button2.dart';

// class PartyMasterDetailsById extends StatefulWidget {
//   PartyMasterDetailsById({super.key,required this.partyId});

//   int partyId;

//   @override
//   State<PartyMasterDetailsById> createState() => _PartyMasterDetailsByIdState();
// }

// class _PartyMasterDetailsByIdState extends State<PartyMasterDetailsById> {
//   // var partyId = Get.arguments;
//   bool loading = true;
//   var partyMasterDetailsById;

//   var table2;
//   var partyMasterDetailsById1;
//   var id;
//   @override
//   void initState() {
//     // TODO: implement initState    super.initState();
//     _getData();
//   }

//   _getData() async {
//     try {
//       print(widget.partyId);
//       var userModel = (await ApiService().PartyMasterDetailsById(widget.partyId))!;
//       if (userModel.errorCode == 0) {
//         setState(() {
//           partyMasterDetailsById = userModel.data.table;
//           partyMasterDetailsById1 = userModel.data.table1;

//           // id = userModel.data.table1[0].partyId;

//           table2 = userModel.data.table2;
//           print(partyMasterDetailsById);
//           // if (partyMasterDetailsById.length == 0) {          //   return showAboutDialog(context: context);          // }          loading = false;
//           loading = false;
//         });
//       } else {
//         print('error');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? const Center(child: CircularProgressIndicator())
//         : Scaffold(
//             appBar: AppBar(
//                 title: const Text('Party Details'),
//                 backgroundColor: Colors.blue),
//             body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Column(
//                           children: List.generate(
//                               partyMasterDetailsById.element.length, (index) {
//                             return Container(
//                               // color: index % 2 == 0
//                               //     ? Colors.blue.withOpacity(0.4)
//                               //     : white,
//                               child: Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         flex: 5,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(2.0),
//                                               child: Text(
//                                                 partyMasterDetailsById
//                                                     .element[index].title,
//                                                 style: const TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Expanded(
//                                           flex: 1,
//                                           child: Row(
//                                             children: const [Text(" : ")],
//                                           )),
//                                       Expanded(
//                                           flex: 8,
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(2.0),
//                                             child: Text(partyMasterDetailsById
//                                                 .element[index].value),
//                                           ))
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                         ),
//                         const Divider(
//                           thickness: 1,
//                         ),
//                         Column(
//                           children: List.generate(
//                               partyMasterDetailsById1.element1.length, (index) {
//                             return Container(
//                               // color: index % 2 == 0
//                               //     ? Colors.blue.withOpacity(0.4)
//                               //     : white,
//                               child: Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         flex: 5,
//                                         child: Row(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(2.0),
//                                               child: Text(
//                                                 partyMasterDetailsById1
//                                                     .element1[index].title,
//                                                 style: const TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Expanded(
//                                           flex: 1,
//                                           child: Row(
//                                             children: const [Text(" : ")],
//                                           )),
//                                       Expanded(
//                                           flex: 8,
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(2.0),
//                                             child: Text(partyMasterDetailsById1
//                                                 .element1[index].value),
//                                           ))
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                         ),

//                         const SizedBox(
//                           height: 10,
//                         ),
//                         if (table2.isNotEmpty)
//                           Container(
//                             color: MainTheme.white,
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: List.generate(
//                                   table2[0].elements.length,
//                                   (i) => Expanded(
//                                         child: Align(
//                                             alignment: Alignment.centerLeft,
//                                             child: Text(
//                                               table2[0].elements[i].title,
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                             )),
//                                       )),
//                             ),
//                           ),
//                         Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: List.generate(
//                                 table2.length,
//                                 (index) => Container(
//                                       color: index % 2 == 0
//                                           ? Colors.grey.withOpacity(0.4)
//                                           : MainTheme.white,
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: List.generate(
//                                             table2[index].elements.length,
//                                             (i) => Expanded(
//                                                   child: Align(
//                                                       alignment:
//                                                           Alignment.centerLeft,
//                                                       child: Text(table2[index]
//                                                           .elements[i]
//                                                           .value)),
//                                                 )),
//                                       ),
//                                     )))

//                         // Column(
//                         //   crossAxisAlignment: CrossAxisAlignment.stretch,
//                         //   mainAxisAlignment: MainAxisAlignment.start,
//                         //   children: [
//                         //     DataTable(
//                         //         // border: TableBorder.all(                                  //   width: 1.0,                                  //   color: Colors.black,                                  // ),                                  dataRowHeight: 28,
//                         //         headingRowColor: MaterialStateColor.resolveWith(
//                         //             (states) => MainTheme.greywhite),
//                         //         headingRowHeight: 30,
//                         //         columns: List.generate(
//                         //           partyMasterDetailsTable!.element1.length,
//                         //           (index) {
//                         //             return DataColumn(
//                         //                 label: Text(
//                         //                     partyMasterDetailsTable!
//                         //                         .element1[index].title,
//                         //                     style: const TextStyle(
//                         //                         fontWeight: FontWeight.bold,
//                         //                         color: MainTheme.greylight)));
//                         //           },
//                         //         ),
//                         //         rows: List.generate(
//                         //             partyMasterDetailsTable!.element1.length,
//                         //             (index) {
//                         //           return DataRow(
//                         //               cells: List.generate(
//                         //                   partyMasterDetailsTable!
//                         //                       .element1.length, (index) {
//                         //             return DataCell(Text(
//                         //               partyMasterDetailsTable!
//                         //                   .element1[index].value,
//                         //             ));
//                         //           }));
//                         //         }))
//                         //   ],
//                         // )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             bottomNavigationBar: CommonButtontwo(id));
//   }
// }

// showAlertDialogpartymasterapproval(BuildContext context, id) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: const Text("Cancel"),
//     onPressed: () {
//       Navigator.of(context, rootNavigator: true).pop('dialog');
//       // Get.to(PartyMasterDetailsById());
//     },
//   );
//   Widget continueButton = TextButton(
//     child: const Text("Approve"),
//     onPressed: () async {
//       print(id);
//       var approvalResponse = await ApiService().partymasterdetailsapproval(id);
//       if (approvalResponse!.data.table[0].status == "Success") {
//         print(approvalResponse.data.table[0].status);
//         Navigator.of(context, rootNavigator: true).pop('dialog');
//         // Navigator.pushReplacement(
//         //     context, MaterialPageRoute(builder: (context) => PartyRole()));
//         Get.off(const PartyRole());
//       }
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     // title: const Text("AlertDialog"),
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

// showAlertDialogpartymasterreject(BuildContext context, id) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: const Text("Cancel"),
//     onPressed: () async {
//       Navigator.of(context, rootNavigator: true).pop('dialog');
//     },
//   );
//   Widget RejectButton = TextButton(
//     child: const Text("Reject"),
//     onPressed: () async {
//       var approvalResponse = await ApiService().partymasterdetailsreject(id);
//       if (approvalResponse!.data.table[0].status == "Success") {
//         print(approvalResponse.data.table[0].status);
//         Navigator.of(context, rootNavigator: true).pop('dialog');
//         Get.off(const PartyRole());
//       }
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     // title: const Text("AlertDialog"),
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
