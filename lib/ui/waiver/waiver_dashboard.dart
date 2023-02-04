
//Author: Linus Elias Jose- 16681

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:localstorage/localstorage.dart';
import 'package:sslim_mobile/api/api_service.dart';

import 'package:sslim_mobile/main_theme.dart';

import 'package:sslim_mobile/ui/dashboard/bottombar.dart';
// import 'package:sslim_mobile/ui/agent/lofinCredentialModel.dart';
import 'dart:math' as math;


import 'package:sslim_mobile/ui/waiver/waiverdetails.dart';

class WaiverdashboardView extends StatefulWidget {
  const WaiverdashboardView({super.key});

  @override
  State<WaiverdashboardView> createState() => _WaiverdashboardViewState();
}

class Waiver {
  String referenceName;
  String referenceNumber;

  Waiver({required this.referenceName, required this.referenceNumber});
}

class _WaiverdashboardViewState extends State<WaiverdashboardView> {
  bool isLoading = false;
  List<Waiver> agentObject = <Waiver>[];
  List<dynamic> storedCredentials = <dynamic>[];
  String selectval = '';
  String dropdownValue = '';
  List<dynamic> waiverList = <dynamic>[];
  List<dynamic> dropDownMenuItemList = <dynamic>[];

  List<dynamic> initialWaiverList = <dynamic>[];
  List<dynamic> storedInitialWaiverList = <dynamic>[];
  List<dynamic> agentDetails = <dynamic>[];
  bool initialAgentFlag = false;
  String viewValue = '';
  String userName = '';
    String locationId = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
      getitemFromLocalStorage();
    _getDropDownMenuItems();
    print(userName);
    _getPrimaryQuotationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed:(){  Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => BottomBar()),  
  );  } , icon: Icon(Icons.arrow_back)),
          title: const Text('Waiver'),
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
                    border: Border.all(
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
                          waiverList = [],
                          initialWaiverList = [],
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
        initialWaiverList = [];
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
    var WaiverListingUserModel = (await ApiService().primaryWaiverDataFetch(userName,viewValue))!;
    if (WaiverListingUserModel.errorCode == 0) {
      storedInitialWaiverList = WaiverListingUserModel.data!.table!;
      print(initialWaiverList);
      //  AgentRefResponse dataValue = agentRefResponseFromJson(QuotListingUserModel.data.table.toString());
      // dataValue;
      setState(() {
        for (var e in storedInitialWaiverList) {
          {
            initialWaiverList.add(e.toJson());
          }
        }
        isLoading = false;
      });
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        initialWaiverList = [];
        isLoading = false;
      });
    }
  }

  Widget getBody() {
      if (initialWaiverList.contains(null) ||
          initialWaiverList.length < 0 ||
          isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
          itemCount: initialWaiverList.length,
          itemBuilder: (context, index) {
            return getCard(initialWaiverList[index]);
          });

  }

  Widget getCard(index) {
   var RequestId = index['RequestId'];
    var Agent = index['Agent'];
    var JobNo = index['JobNo'];
    var IOrE = index['IOrE'];
    var WaiverType = index['WaiverType'];
    var FrtElement = index['FrtElement'];
    var DefaultWaiver = index['DefaultWaiver'];
    var WaiverValue = index['WaiverValue'];
    

     return Container(
  

      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade200))),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
           
        
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: InkWell(
              onTap: () {
                Get.off(WaiverPage(RequestId));
             
              },
              child: ListTile(
              
                leading: CircleAvatar(
                  
                  backgroundColor:
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                  radius: 22,
                  child: Text(
                    Agent.toString()[0],
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                title: Container(
                  child: Row(
                    children: [
                      Text(Agent != null ? "$Agent ," : "",
                          style: const TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                            //  fontWeight: FontWeight.bold
                          )),
                          
                      const SizedBox(
                        width: 02,
                      ),
                      Text(RequestId.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                             fontWeight: FontWeight.bold
                          )),
                             const SizedBox(
                        width: 02,
                      ),
                       Text(','),
                       
                      Text(WaiverType.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )),
                           const SizedBox(
                        width: 02,
                      ),
                       Text(','),
                      // Text(FrtElement.toString(),
                      //     style: const TextStyle(
                      //       fontSize: 16,
                      //       // fontWeight: FontWeight.bold
                      //     ))
                    ],
                  ),
                ),
                subtitle: Row(
                  children: [
                    // const Text(
                    //   "[ ",
                    //   style:
                    //       TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    // ),

                    const SizedBox(
                      width: 02,
                    ),
                    Text(DefaultWaiver.toString()+" ,",
                        style: const TextStyle(
                        fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                          // fontWeight: FontWeight.bold
                        )),
                         const SizedBox(
                      width: 02,
                    ),
                 

                     const SizedBox(
                      width: 02,
                    ),
                    Text(WaiverValue.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                          // fontWeight: FontWeight.bold
                        )),
                        // Text(']'),
                   
                   
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),

      
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
    locationId=loginCredentials["LocationId"].toString();
  }
}
