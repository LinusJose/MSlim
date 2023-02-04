import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/agent/party/partyrole.dart';
import 'package:sslim_mobile/ui/dashboard/components/dashboard_widget.dart';
import 'package:sslim_mobile/ui/waiver/waiver_dashboard.dart';
import 'package:sslim_mobile/ui/waiver/waiverdetails.dart';

import '../agent/agent_dashboard.dart';

var _userModel;

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isLoading = true;
  var sidemenuItem;
    String userName = '';
  final LocalStorage storage = LocalStorage('localstorage_app');
  @override
  void initState() {
    getitemFromLocalStorage();
    print("initState Called");
    // storingCredentials();
    // TODO: implement initState

    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().menuItems(userName))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('DashBoard'),
          backgroundColor: MainTheme.theme2,
        ),
        endDrawer: const NavigationDrawer(),
        body: const GetDashBoardView(),
      );
      
  void getitemFromLocalStorage() {
    Map<String, dynamic> loginCredentials =
        json.decode(storage.getItem('loginCredentials'));
    print(loginCredentials);
    userName = loginCredentials["UserName"].toString();
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              builMenuItems(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: MainTheme.theme2,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('asset/images/MSlim.png'),
                ),
              ],
            ),
          ),
        ),
      );

  Widget builMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(2),
        child: Wrap(
          runSpacing: 1,
          children: getList(),
        ),
      );
}

List<Widget> getList() {
  List<Widget> childs = [];
  for (var i = 0; i <= _userModel.data.table.length - 1; i++) {
    // var menuName =
    childs.add(ListTile(
      leading: const Icon(
        Icons.home_filled,
        // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        color: MainTheme.theme2,
      ),
      title: Text(_userModel.data.table[i].requestType),
      onTap: () {
        switch ((_userModel.data.table[i].requestType).toUpperCase()) {
          // print(_userModel.data.table[i].requestType)
          case "PARTY":
            Get.to(const PartyRole());
            break;
          case "QUOTATION":
            Get.to(const AgentView());
            break;
              case "WAIVER":
            Get.to(WaiverdashboardView());
            break;
          //   case "WAIVER":
          // Get.to(PartyRole());
          // break;
          //   case "FREIGHT CORRECTOR":
          // Get.to(PartyRole());
          // break;
          //   case "PARTY":
          // Get.to(PartyRole());
          // break;
        }
      },
    ));
  }
  return childs;
}

