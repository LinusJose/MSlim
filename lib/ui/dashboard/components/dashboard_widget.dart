import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/models/dashboard/response_model.dart';
import 'package:sslim_mobile/ui/dashboard/dashboardcontroller.dart';
import 'package:sslim_mobile/ui/dashboard/components/grid_view.dart';

class GetDashBoardView extends StatefulWidget {
  const GetDashBoardView({super.key});

  @override
  State<GetDashBoardView> createState() => _GetDashBoardViewState();
}

class _GetDashBoardViewState extends State<GetDashBoardView> {
  List<ResponceTable> result = [];

  @override
  Widget build(BuildContext context) {
    var dashboardcontroller = Get.put(DashboardController());
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 10),

          decoration: const BoxDecoration(
            // border: Border.all(
            //   width: 0,
            //   // color: MainTheme.nearlyWhite
            // ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                // color: MainTheme.white,
                padding: const EdgeInsets.only(top: 10, left: 15, bottom: 15),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: const [
                    Text(
                      'Approval List',
                      style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway'),
                    ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // SizedBox(
                    //   width: 22,
                    //   child: FloatingActionButton.small(
                    //       backgroundColor: Colors.white,
                    //       child: const Icon(
                    //         Icons.refresh,
                    //         size: 20,
                    //         color: MainTheme.theme2,
                    //       ),
                    //       onPressed: () {
                    //         DashboardController();
                    //       }),
                    // ),
                  ],
                ),
              ),

              // Text('Agent Lists'),
              Obx(() => Flexible(
                    child: dashboardcontroller.griditems.isEmpty == true
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * .80,
                            child: Column(
                              children: const [
                                Text('No Data'),
                                Text('No response from back end'),
                              ],
                            ),
                          )
                        : GridViews(items: dashboardcontroller.griditems.value),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
