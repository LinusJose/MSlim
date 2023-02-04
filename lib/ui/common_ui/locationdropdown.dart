// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:sslim_mobile/api/api_service.dart';

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'DropdownButton2 Demo',
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var table2;
//   bool isLoading = true;
//   final List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//     'Item5',
//     'Item6',
//     'Item7',
//     'Item8',
//   ];
//   String? selectedValue;
//   @override
//   void initState() {
//     _getData();
//     // TODO: implement initState
//     super.initState();
//   }

//   _getData() async {
//     try {
//       var userModel = (await ApiService().AgentRef());
//       print(userModel?.data);
//       print("hi");
//       if (userModel?.errorCode == 0) {
//         setState(() {
//           table2 = userModel?.data?.table;
//           print(table2);
//           isLoading = false;
//         });
//       } else {
//         print('error');
//         // log(userModel.errorMessage.toString());
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(child: CircularProgressIndicator())
//         : Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               // width: 300,
//               child: DropdownButtonHideUnderline(
//                 child: ButtonTheme(
//                   alignedDropdown: true,
//                   child: DropdownButton2(
//                     isExpanded: true,
//                     hint: Row(
//                       children: const [
//                         Icon(
//                           Icons.location_city,
//                           size: 16,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                         SizedBox(
//                           width: 4,
//                         ),
//                         Expanded(
//                           child: Text(
//                             'Select Location',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     items: table2
//                         .map((table2) => DropdownMenuItem<dynamic>(
//                               value: table2.agentRef,
//                               child: Text(
//                                 table2.agentRef,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color.fromARGB(255, 10, 10, 10),
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ))
//                         .toList(),
//                     value: selectedValue,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedValue = value as String;
//                       });
//                     },
//                     icon: const Icon(
//                       Icons.arrow_forward_ios_outlined,
//                     ),
//                     iconSize: 14,
//                     iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
//                     iconDisabledColor: Colors.grey,
//                     buttonHeight: 50,
//                     buttonWidth: 400,
//                     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//                     buttonDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(
//                         color: Colors.black26,
//                       ),
//                       color: Color.fromARGB(255, 255, 255, 255),
//                     ),
//                     buttonElevation: 1,
//                     itemHeight: 40,
//                     itemPadding: const EdgeInsets.only(left: 0, right: 12),
//                     dropdownMaxHeight: 200,
//                     dropdownWidth: 400,
//                     dropdownPadding: EdgeInsets.all(15),
//                     dropdownDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Color.fromARGB(255, 255, 255, 255),
//                     ),
//                     dropdownElevation: 8,
//                     scrollbarRadius: const Radius.circular(40),
//                     scrollbarThickness: 6,
//                     scrollbarAlwaysShow: true,
//                     offset: const Offset(-20, 0),
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }
// }
