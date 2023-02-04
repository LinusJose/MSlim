//Author: Linus Elias Jose- 16681

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/approval_details/quotation_details/quotationdetails.dart';
import 'package:sslim_mobile/ui/dashboard/bottombar.dart';
// import 'package:sslim_mobile/ui/agent/lofinCredentialModel.dart';
import 'dart:math' as math;

class AgentView extends StatefulWidget {
  const AgentView({super.key});

  @override
  State<AgentView> createState() => _AgentViewState();
}

class Agent {
  String referenceName;
  String referenceNumber;

  Agent({required this.referenceName, required this.referenceNumber});
}

class _AgentViewState extends State<AgentView> {
  bool isLoading = false;
  List<Agent> agentObject = <Agent>[];
  List<dynamic> storedCredentials = <dynamic>[];
  String selectval = '';
  String dropdownValue = '';
  List<dynamic> quotationList = <dynamic>[];
  List<dynamic> storedSelectedQuotationList = <dynamic>[];
  List<dynamic> dropDownMenuItemList = <dynamic>[];

  List<dynamic> initialQuotationList = <dynamic>[];
  List<dynamic> storedInitialQuotationList = <dynamic>[];
  List<dynamic> agentDetails = <dynamic>[];
  bool initialAgentFlag = false;
  String viewValue = '';
  String userName = '';
  String locationId = '';
  // var quotNo;
  final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
    // initialResponse()!.then((value) {
    //   // print('Async done');
    // });
    getitemFromLocalStorage();
    _getDropDownMenuItems();
    _getPrimaryQuotationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomBar()),
                );
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Quotation'),
          backgroundColor: MainTheme.theme2),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * .6,
                height: 35,
                padding: const EdgeInsets.only(left: 24.0, top: 5.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // color:
                    //     MainTheme.white, //background color of dropdown button
                    border: Border.all(
                        // color: MainTheme.black,
                        width: 1), //border of dropdown button
                    borderRadius: BorderRadius.circular(
                        0), //border raiuds of dropdown button
                    // boxShadow: const <BoxShadow>[
                    //   //apply shadow on Dropdown button
                    //   BoxShadow(
                    //       color: MainTheme.black, //shadow for button
                    //       blurRadius: 1) //blur radius of shadow
                    // ]
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue == "" ? null : dropdownValue,

                          // vvaluealue:selectval.toString(),
                          items: agentDetails.map((dynamic itemone) {
                            return DropdownMenuItem(
                                value: itemone["AgentRef"].toString(),
                                child: Text("${itemone["AgentRef"]}"));
                          }).toList(),
                          hint: const Text("ALL"),
                          onChanged: (value) {
                            viewValue = value.toString();
                            setState(() {
                              dropdownValue = value.toString();
                              // selectval = value as String;
                            });
                          },
                          //  value: selectval,

                          icon: const Padding(
                              //Icon at tail, arrow bottom is default icon
                              padding: EdgeInsets.only(left: 1),
                              child: Icon(Icons.arrow_drop_down_rounded)),
                          iconEnabledColor: MainTheme.theme2, //Icon color
                          style: const TextStyle(
                              //te
                              color: Colors.black, //Font color
                              fontSize: 12 //font size on dropdown button
                              ),

                          // dropdownColor:
                          //     MainTheme.white, //dropdown background color
                          // underline: Container(),
                          isExpanded: true,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 19,
              ),
              Container(
                  padding: const EdgeInsets.only(top: 4, left: 5),
                  child: SizedBox(
                    width: 90,
                    height: 32,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MainTheme.theme2,

                          // side: BorderSide(color: Colors.yellow, width: 5),

                          textStyle: const TextStyle(
                              // color: Colors.white,
                              fontSize: 10,
                              fontStyle: FontStyle.normal),

                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                        ),
                        onPressed: () => {
                          quotationList = [],
                          initialQuotationList = [],
                          _getPrimaryQuotationData()
                        },
                        child: const Text('View'),
                      ),
                    ),
                  )
                  // BottomButtonView(),

                  ),
            ]),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .75,
                  width: MediaQuery.of(context).size.width * 1,
                  child: SizedBox(
                    child: Container(
                      child: getBody(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getDropDownMenuItems() async {
    setState(() {
      isLoading = true;
    });

    var dropdownItemModel = (await ApiService().initialResponse(userName))!;
    if (dropdownItemModel.errorCode == 0) {
      dropDownMenuItemList = dropdownItemModel.data!.table!;
      print(dropDownMenuItemList);
      setState(() {
        agentDetails = [];
        for (var e in dropDownMenuItemList) {
          {
            agentDetails
                .add({"AgentName": e.agentName, "AgentRef": e.agentRef});
          }
        }
      });
    } else {
      setState(() {
        initialQuotationList = [];
        isLoading = false;
      });
    }
  }

  _getPrimaryQuotationData() async {
    initialAgentFlag = true;
    setState(() {
      isLoading = true;
    });
    // await initialResponse()!.then((value) {
    //   // loading = false;
    // });
    var QuotListingUserModel =
        (await ApiService().primaryAgentDataFetch(userName, viewValue))!;
    if (QuotListingUserModel.errorCode == 0) {
      storedInitialQuotationList = QuotListingUserModel.data!.table!;
      print(initialQuotationList);
      //  AgentRefResponse dataValue = agentRefResponseFromJson(QuotListingUserModel.data.table.toString());
      // dataValue;
      setState(() {
        for (var e in storedInitialQuotationList) {
          {
            initialQuotationList.add(e.toJson());
          }
        }
        isLoading = false;
      });
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        initialQuotationList = [];
        isLoading = false;
      });
    }
  }

  Widget getBody() {
    if (initialQuotationList.contains(null) ||
        initialQuotationList.length < 0 ||
        isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: initialQuotationList.length,
        itemBuilder: (context, index) {
          return getCard(initialQuotationList[index]);
        });
  }

  Widget getCard(index) {
    var execName = index['Executive'];
    var quotationNo = index['QuotationNo'];
    var quotationRef = index['QuotationRef'];
    var quotationDate = index['QuoteDate'];
    var validity = index['ValidTill'];
    var dicdValue = index['DICD'];
    var agreePartyName = index['AgreementParty'];
    var licdValue = index['LICD'];
    var polValue = index['POL'].replaceAll(' ', '');
    var podValue = index['POD'].replaceAll(' ', '');

    return Container(
      // decoration: new BoxDecoration
      //   boxShadow: [
      //     BoxShadow(
      //       // color: Colors.blue,
      //       blurRadius: 10.0,
      //     ),
      //   ],
      // ),

      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade200))),
        child: Card(
          elevation: 0,
          color: Colors.transparent,

          // shape: RoundedRectangleBorder(
          //   side: BorderSide(
          //     color: Colors.blue,
          //   ),
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: InkWell(
              onTap: () {
                Get.off(QuotationPage(quotationNo));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => QuotationView(quotationNo)),
                // );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                  radius: 22,
                  child: Text(
                    quotationRef.toString()[0],
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                title: Row(
                  children: [
                    Text(quotationRef != null ? "$quotationRef ," : "",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 02,
                    ),
                    Text(validity.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
                subtitle: Row(
                  children: [
                    // const Text(
                    //   "[ ",
                    //   style:
                    //       TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // ),

                    Visibility(
                      visible: licdValue.trim().length != 0 ? true : false,
                      child: Text(
                        licdValue.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 04,
                    // ),
                    Visibility(
                      visible: licdValue.trim().length != 0 ? true : false,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 10,
                      ),
                    ),
                    Visibility(
                      visible: polValue != "" ? true : false,
                      child: Text(
                        polValue.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    Visibility(
                      visible: polValue != "" ? true : false,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 10,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 04,
                    // ),
                    Visibility(
                      visible: podValue != "" ? true : false,
                      child: Text(
                        podValue.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    Visibility(
                      visible: dicdValue != "" ? true : false,
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 10,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 04,
                    // ),
                    Visibility(
                      visible: dicdValue != "" ? true : false,
                      child: Text(
                        dicdValue.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    // const Text(
                    //   " ]",
                    //   style:
                    //       TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
                    // ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),

              // title: Container(
              //   child: Row(
              //     children: [
              //       Column(
              //         children: [
              //           Row(
              //             children: <Widget>[
              //               Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: <Widget>[
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .23,
              //                           child: const Text(
              //                             "Quotation Ref",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $quotationRef",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .23,
              //                           child: const Text(
              //                             "Quotation Date",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $quotationDate",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .23,
              //                           child: const Text(
              //                             "Validity",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $validity",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .23,
              //                           child: const Text(
              //                             "Executive",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $execName",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .23,
              //                           child: const Text(
              //                             "LICD",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $licdValue",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ]
              //                   // width: 60,
              //                   // height: 60,
              //                   // decoration: BoxDecoration(color: Colors.blue),
              //                   ),
              //               const SizedBox(width: 10),
              //               SizedBox(
              //                 height: 92,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: <Widget>[
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .10,
              //                           child: const Text(
              //                             "POL",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $polValue",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .10,
              //                           child: const Text(
              //                             "POD",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $podValue",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                     const SizedBox(
              //                       height: 5,
              //                     ),
              //                     Row(
              //                       children: [
              //                         SizedBox(
              //                           width: MediaQuery.of(context)
              //                                   .size
              //                                   .width *
              //                               .10,
              //                           child: const Text(
              //                             "DICD",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                         Text(
              //                           ": $dicdValue",
              //                           style: const TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),

              //                     // Row(
              //                     //   children: [
              //                     //     const Text(
              //                     //       "Party",
              //                     //       style: TextStyle(
              //                     //           fontSize: 12,
              //                     //           fontWeight: FontWeight.bold),
              //                     //     ),
              //                     //     const SizedBox(
              //                     //       width: 12,
              //                     //     ),
              //                     //     Text(
              //                     //       ": " + agreePartyName.toString(),
              //                     //       style: const TextStyle(fontSize: 12),
              //                     //     ),
              //                     //   ],
              //                     // ),
              //                   ],
              //                 ),
              //               ),

              //               // Container(
              //               //   height: 30,
              //               //   child: Center(
              //               //     child: Column(
              //               //       children: [
              //               //         const Icon(
              //               //             Icons.arrow_forward_ios_outlined,
              //               //             size: 11,
              //               //             color: Colors.black)
              //               //       ],
              //               //     ),
              //               //   ),
              //               // ),
              //             ],
              //           ),
              //           Column(
              //             children: const [
              //               // Row(
              //               //   children: [
              //               //     const Text(
              //               //       "Party",
              //               //       style: TextStyle(
              //               //           fontSize: 12,
              //               //           fontWeight: FontWeight.bold),
              //               //     ),
              //               //   ],
              //               // ),
              //               // Row(
              //               //   children: [
              //               //     Text(
              //               //       ": " + agreePartyName.toString(),
              //               //       style: const TextStyle(fontSize: 12),
              //               //     ),
              //               //   ],
              //               // )
              //             ],
              //           )
              //           // Container(
              //           //   width: 405,
              //           //   child:
              //           //   Text('data'),

              //           // )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ),
        ),
      ),
      // ),
    );
  }

  void getitemFromLocalStorage() {
    Map<String, dynamic> loginCredentials =
        json.decode(storage.getItem('loginCredentials'));
    print(loginCredentials);

    // print(info["UserName"]);
    userName = loginCredentials["UserName"].toString();
    locationId = loginCredentials["LocationId"].toString();
  }
}
