import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/models/containar_tracking/containar_tracking_response.dart';

import '../../api/api_service.dart';

class ContainerTracking extends StatefulWidget {
  const ContainerTracking({super.key});

  @override
  State<ContainerTracking> createState() => _ContainerTracking();
}

//  Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {})); }

class _ContainerTracking extends State<ContainerTracking> {
  bool isLoading = false;
  int _index = 0;
  var Location;
  var _selectedLocation;
  var _selectedType;
  String? dropdownvalue;
  bool hide = false;
  var items = [
    'Container No',
    'Job No',
    'BL No',
  ];
  final containerNo = TextEditingController();
  bool tracker = false;
  var res;
  int _currentstep = 0;
  List<Table2?> trackingData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Tracking'),
        backgroundColor: MainTheme.theme2,
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.notifications_active),
          //   tooltip: 'Notifications',
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(content: Text('No new notifications')));
          //   },
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 40,
                          // padding: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Select Type',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: dropdownvalue,
                              onChanged: (String? newValue) {
                                print(newValue);
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                                if (newValue == 'Container No') {
                                  _selectedType = 'C';
                                } else if (newValue == 'Job No') {
                                  _selectedType = 'j';
                                } else {
                                  _selectedType = 'B';
                                }
                              },
                              buttonHeight: 40,
                              // buttonWidth: 400,
                              itemHeight: 40,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .70,
                            height: 35,
                            child: TextField(
                              controller: containerNo,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    borderSide: BorderSide(
                                        // width: 1,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  hintText: 'Container No',
                                  contentPadding:
                                      EdgeInsets.only(top: 5, left: 15)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                res = await ApiService().getContainerTracking(
                                    containerNo.text, _selectedType);

                                trackingData = res.data.table2;
                                setState(() {
                                  tracker = true;
                                  isLoading = true;
                                });
                              },
                              child: Text("view"))
                        ],
                      )
                    ],
                  ),
                )
              ],
              // children: [
              //   Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Container(
              //       height: 40,
              //       child: TextField(
              //         controller: containerNo,
              //         decoration: InputDecoration(
              //           contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 0),
              //           hintText: "Container No",
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide: BorderSide(
              //               color: Colors.black,
              //               width: 1,
              //               style: BorderStyle.solid,
              //             ),
              //           ),
              //           suffixIcon: Container(
              //             margin: EdgeInsets.all(8),
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 minimumSize: Size(80, 20),
              //                 primary: Colors.blue,
              //                 shape: new RoundedRectangleBorder(
              //                   borderRadius: new BorderRadius.circular(10.0),
              //                 ),
              //               ),
              //               child: Text("View"),
              //               onPressed: () async {
              //                 res = await ApiService().getContainerTracking(
              //                     containerNo.text, _selectedType);
              //                 trackingData = res.data.table2;
              //                 setState(() {
              //                   tracker = true;
              //                   isLoading = true;
              //                 });
              //               },
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ],
            ),
            tracker
                ? Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 90,
                              child: Card(
                                color: Colors.blueAccent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          res.data.table[0].containerNo,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(res.data.table[0]
                                                      .currentPort)
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(res.data.table[0].date)
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          EnhanceStepper(
                            controlsBuilder: (BuildContext context,
                                ControlsDetails controls) {
                              return const SizedBox(
                                width: 500,
                              );
                            },
                            stepIconSize: 30,
                            horizontalTitlePosition:
                                HorizontalTitlePosition.bottom,
                            horizontalLinePosition: HorizontalLinePosition.top,
                            currentStep: _index,
                            physics: ClampingScrollPhysics(),
                            steps: List.generate(trackingData.length, (index) {
                              return EnhanceStep(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .55,
                                            child: Text(trackingData[index]!
                                                .emscodeDescription),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(trackingData[index]!.movedate)
                                        ],
                                      )
                                    ],
                                  ),
                                  content: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                children: [Text("Location")],
                                              ),
                                              SizedBox(
                                                width: 43,
                                              ),
                                              Row(
                                                children: [Text(":")],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(trackingData[index]!
                                                      .location)
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [Text("Port Name")],
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Row(
                                                children: [Text(":")],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(trackingData[index]!
                                                      .location)
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [Text("Vessel Name")],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [Text(":")],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(trackingData[index]!
                                                      .vesselName)
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [Text("voyage")],
                                              ),
                                              SizedBox(
                                                width: 55,
                                              ),
                                              Row(
                                                children: [Text(":")],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(trackingData[index]!
                                                      .voyage)
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ));
                            }),
                            onStepTapped: (index) {
                              setState(() {
                                _index = index;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [Text("no data")],
                  )
          ],
        ),
      ),
    );
  }
}
