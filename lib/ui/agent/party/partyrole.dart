import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/models/agent/party/partydetailsbylocationrequest.dart';
import 'package:sslim_mobile/models/agent/party/partydetailsbylocationresponse.dart';
import 'package:sslim_mobile/models/agent/quotation/quotationrequest.dart';
import 'package:sslim_mobile/models/agent/quotation/quotationresponse.dart';
import 'package:sslim_mobile/ui/approval_details/party_details/party.dart';
import 'dart:math' as math;

import 'package:sslim_mobile/ui/approval_details/party_details/party.dart';
import 'package:sslim_mobile/ui/dashboard/bottombar.dart';

class PartyRole extends StatefulWidget {
  const PartyRole({super.key});

  @override
  State<PartyRole> createState() => _PartyRoleState();
}

class _PartyRoleState extends State<PartyRole> {
  bool loading = true;
  var pendingPartyList;
  // List<Agent> agentObject = <Agent>[];
  String selectval = '';
  String dropdownValue = '';
  List<dynamic> quotationList = <dynamic>[];
  List<dynamic> initialQuotationList = <dynamic>[];
  List<dynamic> agentDetails = <dynamic>[];
  bool initialAgentFlag = false;
  String viewValue = '';
  bool cardview = true;
  String userName = '';
  List<dynamic> dropDownMenuItemList = <dynamic>[];

  final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
    getitemFromLocalStorage();

    _getDropDownMenuItems();
    // TODO: implement initState
    super.initState();
    _getData();
  }

  _getData() async {
    // await initialResponse()!.then((value) {
    //   // loading = false;
    // });

    var userModel = (await ApiService().PartyRolePendingList(viewValue))!;
    if (userModel.errorCode == 0) {
      setState(() {
        pendingPartyList = userModel.data.table;
        print(pendingPartyList);
        loading = false;
        // loading = false;
      });
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back)),
                  title: const Text('Party'),
                  backgroundColor: Colors.blue),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .6,
                        height: 35,
                        padding: const EdgeInsets.only(left: 24.0, top: 5.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              // color: const Color.fromARGB(255, 237, 245,
                              //     228), //background color of dropdown button
                              border: Border.all(
                                  color: Colors.black38,
                                  width: 1), //border of dropdown button
                              borderRadius: BorderRadius.circular(
                                  0), //border raiuds of dropdown button
                              boxShadow: const <BoxShadow>[
                                //apply shadow on Dropdown button
                                // BoxShadow(
                                //     color: Color.fromRGBO(
                                //         0, 0, 0, 0.57), //shadow for button
                                //     blurRadius: 1) //blur radius of shadow  // REMOVED FOR THEME
                              ]),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue == ""
                                      ? null
                                      : dropdownValue,

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
                                      child:
                                          Icon(Icons.arrow_drop_down_rounded)),
                                  iconEnabledColor:
                                      MainTheme.theme2, //Icon color
                                  style: const TextStyle(
                                      //te
                                      color: Colors.black, //Font color
                                      fontSize:
                                          12 //font size on dropdown button
                                      ),

                                  // dropdownColor: Color.fromARGB(255, 255, 255,
                                  //     255), //dropdown background color
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
                                  backgroundColor: Colors.blue,

                                  // side: BorderSide(color: Colors.yellow, width: 5),

                                  textStyle: const TextStyle(
                                      // color: Colors.white,   //REMOVED FOR THEME
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal),

                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2))),
                                ),
                                onPressed: () => {
                                  // quotationList = [],
                                  _getData(),
                                  setState(() {
                                    cardview = false;
                                    loading = false;
                                  }),
                                },
                                child: const Text('View'),
                              ),
                            ),
                          )
                          // BottomButtonView(),

                          ),
                    ]),
                  ),
                  cardview
                      ? Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.only(left: 6),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(1.0),
                                        radius: 22,
                                        child: Text(
                                          pendingPartyList[index].name[0],
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                      title: Text(
                                        pendingPartyList[index].name,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      trailing: const Icon(Icons.arrow_forward),
                                    ),
                                    onTap: () {
                                      print("hellloooo");
                                      Get.off(
                                        PartyMasterDetailsById(
                                            partyId: pendingPartyList[index]
                                                .partyId),
                                      );
                                    });
                              },
                              itemCount: pendingPartyList != null
                                  ? pendingPartyList.length
                                  : 0,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  // height: 50,
                                  thickness: 1,
                                );
                              }),
                        )
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(1.0),
                                        radius: 28,
                                        child: Text(
                                            pendingPartyList[index].name[0]),
                                      ),
                                      title: Text(pendingPartyList[index].name),
                                      trailing: const Icon(Icons.arrow_forward),
                                    ),
                                    onTap: () {
                                      Get.off(PartyMasterDetailsById(
                                          partyId:
                                              pendingPartyList[index].partyId));
                                    });
                              },
                              itemCount: pendingPartyList != null
                                  ? pendingPartyList.length
                                  : 0,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  // height: 50,
                                  thickness: 1,
                                );
                              }),
                        ),
                ],
              ),
            ),
          );
  }

  _getDropDownMenuItems() async {
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
        print(agentDetails);
      });
    } else {
      setState(() {
        initialQuotationList = [];
      });
    }
  }

  // Future<QuotationListRequest?>? initialResponse() async {
  //   try {
  //     final headers = {"Content-Type": "application/json", "Accept": "/"};
  //     final response = await post(
  //       Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
  //       body: jsonEncode({
  //         "SP_ID": "1005",
  //         "param": {"UserCode": "GIT", "CompanyId": "1"}
  //       }),
  //       headers: headers,
  //     ).timeout(const Duration(seconds: 10));
  //     if (response.statusCode == 200) {
  //       loading = false;
  //       QuotationListResponse dataVal =
  //           quotationListResponseFromJson(response.body);
  //       setState(() {
  //         agentDetails = [];
  //         for (var e in dataVal.data!.table!) {
  //           {
  //             agentDetails
  //                 .add({"AgentName": e.agentName, "AgentRef": e.agentRef});
  //           }
  //         }
  //         loading = false;
  //       });
  //     } else {
  //       print("Login Failed");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }

  void getitemFromLocalStorage() {
    Map<String, dynamic> loginCredentials =
        json.decode(storage.getItem('loginCredentials'));
    print(loginCredentials);

    // print(info["UserName"]);
    userName = loginCredentials["UserName"].toString();
    print(userName);
  }
}
