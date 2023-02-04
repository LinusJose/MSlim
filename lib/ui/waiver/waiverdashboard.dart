// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
// import 'package:sslim_mobile/main_theme.dart';
// import 'dart:math' as math;
// import 'package:sslim_mobile/ui/approval_details/quotation_details/quotationdetails.dart';
// import 'package:sslim_mobile/ui/waiver/waiverdetails.dart';
// import '../../models/waiver/waivercontractRequest.dart';
// import '../../models/waiver/waivercontractResponse.dart';
// import '../../models/waiver/waivercontractlocationrequest.dart';
// import '../../models/waiver/waivercontractlocationresponse.dart';

// class WaiverView extends StatefulWidget {
//   const WaiverView({super.key});

//   @override
//   State<WaiverView> createState() => _WaiverViewState();
// }

// class Waiver {
//   String referenceName;
//   String referenceNumber;

//   Waiver({required this.referenceName, required this.referenceNumber});
// }

// class _WaiverViewState extends State<WaiverView> {
//   bool isLoading = false;
//   List<Waiver> agentObject = <Waiver>[];
//   List<dynamic> storedCredentials = <dynamic>[];
//   String selectval = '';
//   String dropdownValue = '';
//   List<dynamic> waiverList = <dynamic>[];
//   List<dynamic> initialwaiverList = <dynamic>[];
//   List<dynamic> agentDetails = <dynamic>[];
//   bool initialAgentFlag = false;
//   String viewValue = '';
//   String userName = 'GIT';
//   @override
//   void initState() {
//     initialResponse()!.then((value) {
//     });
//     print(userName);
//     primaryAgentDataFetch();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('Waiver Contract'), backgroundColor: MainTheme.theme2),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 15.0),
//         child: Column(
//           children: [
//             Row(children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * .6,
//                 height: 35,
//                 padding: const EdgeInsets.only(left: 24.0, top: 5.0),
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                         width: 1),
//                     borderRadius: BorderRadius.circular(
//                         0), 
//                   ),
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 5, right: 5),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           value: dropdownValue == "" ? null : dropdownValue,
//                           items: agentDetails.map((dynamic itemone) {
//                             return DropdownMenuItem(
//                                 value: itemone["RequestId"].toString(),
//                                 child: Text("${itemone["Agent"]}"));
//                           }).toList(),
//                           hint: const Text("All"),
//                           onChanged: (value) {
//                             viewValue = value.toString();
//                             setState(() {
//                               dropdownValue = value.toString();
//                             });
//                           },

//                           icon: const Padding(
//                               padding: EdgeInsets.only(left: 1),
//                               child: Icon(Icons.arrow_drop_down_rounded)),
//                           iconEnabledColor: MainTheme.theme2, 
//                           style: const TextStyle(
                              
//                               color: Colors.black, 
//                               fontSize: 12 
//                               ),
//                           isExpanded: true,
//                         ),
//                       )),
//                 ),
//               ),
//               const SizedBox(
//                 width: 19,
//               ),
//               Container(
//                   padding: const EdgeInsets.only(top: 4, left: 5),
//                   child: SizedBox(
//                     width: 90,
//                     height: 32,
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: MainTheme.theme2,

//                           textStyle: const TextStyle(
                              
//                               fontSize: 10,
//                               fontStyle: FontStyle.normal),

//                           shape: const BeveledRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(2))),
//                         ),
//                         onPressed: () => {
//                           waiverList = [],
//                           secondaryAgentDataFetch(),
//                         },
//                         child: const Text('View'),
//                       ),
//                     ),
//                   )
                 

//                   ),
//             ]),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height * .75,
//                   width: MediaQuery.of(context).size.width * 1,
//                   child: SizedBox(
//                     child: Container(
//                       child: getBody(),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<WaiverContractRequest?>? initialResponse() async {
//     try {
//       final headers = {"Content-Type": "application/json", "Accept": "/"};
//       final response = await post(
//         Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
//         body: jsonEncode({
//           "SP_ID": "1009",
//           "param": {"UserCode": userName, "CompanyId": "1"}
//         }),
//         headers: headers,
//       ).timeout(const Duration(seconds: 10));
//       if (response.statusCode == 200) {
//         WaiverContractResponse dataVal =
//             waiverContractResponseFromJson(response.body);
//         setState(() {
//           agentDetails=[];
//           for (var e in dataVal.data!.table!) {
//             {
//               agentDetails
//                   .add({"RequestId": e.requestId, "Agent": e.agent});
//             }
//           }
//           print(agentDetails.length);
//         });
//       } else {
//         print("Login Failed");
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     return null;
//   }

//   Future<WaiverContractlocationRequest?>? secondaryAgentDataFetch() async {
//     initialAgentFlag = false;
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       final headers = {"Content-Type": "application/json", "Accept": "/"};
//       final response = await post(
//         Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
//         body: jsonEncode({ "SP_ID": "1009", "param":{"UserCode":"GIT","Agent":"INBOM01","Status":"P","RequestId":""}}),
//         headers: headers,
//       ).timeout(const Duration(seconds: 10));
//       if (response.statusCode == 200) {
      
//         WaiverContractlocationResponse dataVal = waiverContractlocationResponseFromJson(response.body);
//         dataVal;
       

//         setState(() {
         
//           for (var e in dataVal.data!.table!) {
//             {
//               waiverList.add(e.toJson());
//             }
//           }
          
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           waiverList = [];
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     return null;
//   }

//   Future<WaiverContractlocationRequest?>? primaryAgentDataFetch() async {
//     initialAgentFlag = true;
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       final headers = {"Content-Type": "application/json", "Accept": "/"};
//       final response = await post(
//         Uri.parse('https://liner.monterglobal.com/SLIMRestServiceDev/api'),
//         body: jsonEncode({ "SP_ID": "1009", "param":{"UserCode":"GIT","Agent":"","Status":"P","RequestId":""}}),
//         headers: headers,
//       ).timeout(const Duration(seconds: 10));
//       if (response.statusCode == 200) {
//         WaiverContractlocationResponse dataValue = waiverContractlocationResponseFromJson(response.body);
//         dataValue;

//         setState(() {
//           for (var e in dataValue.data!.table!) {
//             {
//               initialwaiverList.add(e.toJson());
//             }
//           }
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           initialwaiverList = [];
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     return null;
//   }

//   Widget getBody() {
//     if (initialAgentFlag == true) {
//       if (initialwaiverList.contains(null) ||
//           initialwaiverList.length < 0 ||
//           isLoading) {
//         return const Center(child: CircularProgressIndicator());
//       }
//       return ListView.builder(
//           itemCount: initialwaiverList.length,
//           itemBuilder: (context, index) {
//             return getCard(initialwaiverList[index]);
//           });
//     } else {
//       if (waiverList.contains(null) ||
//           waiverList.length < 0 ||
//           isLoading) {
//         return const Center(child: CircularProgressIndicator());
//       }
//       return ListView.builder(
//           itemCount: waiverList.length,
//           itemBuilder: (context, index) {
//             return getCard(waiverList[index]);
//           });
//     }
//   }

//   Widget getCard(index) {
//     var RequestId = index['RequestId'];
//     var Agent = index['Agent'];
//     var JobNo = index['JobNo'];
//     var IOrE = index['IOrE'];
//     var WaiverType = index['WaiverType'];
//     var FrtElement = index['FrtElement'];
//     var DefaultWaiver = index['DefaultWaiver'];
//     var WaiverValue = index['WaiverValue'];
//     // var polValue = index['POL'].replaceAll(' ', '');
//     // var podValue = index['POD'].replaceAll(' ', '');
 

//     return Container(
  

//       child: Container(
//         decoration: BoxDecoration(
//             border: Border(
//                 bottom: BorderSide(width: 1, color: Colors.grey.shade200))),
//         child: Card(
//           elevation: 0,
//           color: Colors.transparent,
           
        
//           child: Padding(
//             padding: const EdgeInsets.all(0.0),
//             child: InkWell(
//               onTap: () {
//                 Get.off(WaiverPage(RequestId));
             
//               },
//               child: ListTile(
              
//                 leading: CircleAvatar(
                  
//                   backgroundColor:
//                       Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
//                           .withOpacity(1.0),
//                   radius: 22,
//                   child: Text(
//                     Agent.toString()[0],
//                     style: const TextStyle(fontSize: 22),
//                   ),
//                 ),
//                 title: Row(
//                   children: [
//                     Text(Agent != null ? "$Agent ," : "",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           //  fontWeight: FontWeight.bold
//                         )),
                        
//                     const SizedBox(
//                       width: 02,
//                     ),
//                     Text(RequestId.toString(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           // fontWeight: FontWeight.bold
//                         )),
//                            const SizedBox(
//                       width: 02,
//                     ),
//                      Text(','),
                     
//                     Text(WaiverType.toString(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           // fontWeight: FontWeight.bold
//                         )),
//                          const SizedBox(
//                       width: 02,
//                     ),
//                      Text(','),
//                     Text(FrtElement.toString(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           // fontWeight: FontWeight.bold
//                         ))
//                   ],
//                 ),
//                 subtitle: Row(
//                   children: [
//                     const Text(
//                       "[ ",
//                       style:
//                           TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                     ),

//                     const SizedBox(
//                       width: 02,
//                     ),
//                     Text(DefaultWaiver.toString(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           // fontWeight: FontWeight.bold
//                         )),
//                          const SizedBox(
//                       width: 02,
//                     ),
//                     Text('|'),

//                      const SizedBox(
//                       width: 02,
//                     ),
//                     Text(WaiverValue.toString(),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           // fontWeight: FontWeight.bold
//                         )),
//                         Text(']'),
                   
                   
//                   ],
//                 ),
//                 trailing: const Icon(Icons.arrow_forward),
//               ),

      
//             ),
//           ),
//         ),
//       ),
//       // ),
//     );
//   }


// }
