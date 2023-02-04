import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/dashboard/components/dashboard_function.dart';
import 'package:sslim_mobile/ui/dashboard/dashboardcontroller.dart';

class GridViews extends StatefulWidget {
  var items;

  GridViews({super.key, required this.items});
  @override
  State<GridViews> createState() => _GridViewsState();
}

class _GridViewsState extends State<GridViews> {
  var dashboardcontroller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // padding: const EdgeInsets.only(top: 5),
      // color: MainTheme.nearlyWhite,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 13 / 16,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          itemCount: dashboardcontroller.griditems == null
              ? 0
              : dashboardcontroller.griditems.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Get.to(AgentView());
                navigationAgent(
                    dashboardcontroller.griditems.value[index].requestType);

                // (dashboardcontroller.griditems.value[index].requestType)());
//  // agentname: dashboardcontroller.griditems.value[index],
//                     )
              },
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                // color: MainTheme.white,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: FittedBox(
                                child: FloatingActionButton(
                                    onPressed: () {
                                      // dailogBox();
                                    },
                                    // backgroundColor: Colors.primaries[Random()
                                    //     .nextInt(Colors.primaries.length)],
                                    backgroundColor: MainTheme.orange,
                                    heroTag: const Text('button1'),
                                    child: Text(
                                      dashboardcontroller
                                          .griditems.value[index].requestCount
                                          .toString(),
                                      style: const TextStyle(fontSize: 25),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.account_balance,
                                // color: Colors.primaries[
                                //     Random().nextInt(Colors.primaries.length)],
                                color: MainTheme.theme2,
                                size: 30.0,
                              )),
                          // Container(
                          //     child: Icon(
                          //   IconData(
                          //       dashboardcontroller.griditems.value[index].icon,
                          //       fontFamily: 'myFont'),
                          //   color: Colors.black,
                          // ))
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 2, bottom: 2)),
                      Expanded(
                        child: Text(
                          dashboardcontroller
                              .griditems.value[index].requestType,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            );
          }),
    ));
  }
}


// navigationAgent(){
//   switch (dashboardcontroller.griditems.value[index].requestType) {
//     case value:
      
//       break;
//     default:
//   }
// }
