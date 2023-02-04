import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/api/api_service.dart';
import 'package:sslim_mobile/models/agent/party/partmasterdetailsresponsebyid.dart';
import 'package:sslim_mobile/ui/agent/party/partyrole.dart';
import 'package:sslim_mobile/ui/approval_details/party_details/widget.dart';
import '../quotation_details/components/common_button2.dart';

class PartyMasterDetailsById extends StatefulWidget {
  PartyMasterDetailsById({super.key, required this.partyId});

  int partyId;

  @override
  State<PartyMasterDetailsById> createState() => _PartyMasterDetailsByIdState();
}

class _PartyMasterDetailsByIdState extends State<PartyMasterDetailsById> {
  // var partyId = Get.arguments;
  bool loading = true;
  var partyMasterDetailsById;

  var partyMasterDetailsById1;
  List<Rows> partyMasterDetailsGrid = [];

  var id;
  @override
  void initState() {
    // TODO: implement initState    super.initState();
    _getData();
  }

  _getData() async {
    try {
      print(widget.partyId);
      var userModel =
          (await ApiService().PartyMasterDetailsById(widget.partyId))!;
      if (userModel.errorCode == 0) {
        setState(() {
          partyMasterDetailsById = userModel.data.table;
          partyMasterDetailsById1 = userModel.data.table1;
          partyMasterDetailsGrid = userModel.data.table2;

          // id = userModel.data.table1[0].partyId;

          print(partyMasterDetailsById);
          // if (partyMasterDetailsById.length == 0) {          //   return showAboutDialog(context: context);          // }          loading = false;
          loading = false;
        });
      } else {
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Party Details'),
            backgroundColor: Colors.blue,
            bottom: const TabBar(
              unselectedLabelStyle: TextStyle(color: Colors.black),
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  // icon: Icon(Icons.my_library_books),
                  text: "Primary",
                ),
                Tab(
                  // icon: Icon(Icons.book_rounded),
                  text: "Additional",
                ),
                Tab(
                  // icon: Icon(Icons.table_bar),
                  text: "Party Types",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: PartyDetails(
                    partyMasterDetailsById: partyMasterDetailsById),
              ),
              Center(
                child: PartyDetails2(
                    partyMasterDetailsById1: partyMasterDetailsById1),
              ),
              Center(
                child: PartyDetailsGrid(
                    partyMasterDetailsGrid: partyMasterDetailsGrid),
              ),
            ],
          ),
          bottomNavigationBar: CommonButtontwo(widget.partyId),
        ));
  }
}

showAlertDialogpartymasterapproval(BuildContext context, id) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      // Get.to(PartyMasterDetailsById());
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Approve"),
    onPressed: () async {
      print(id);
      var approvalResponse = await ApiService().partymasterdetailsapproval(id);
      if (approvalResponse!.data.table[0].status == "Success") {
        print(approvalResponse.data.table[0].status);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => PartyRole()));
        Get.off(const PartyRole());
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: const Text("AlertDialog"),
    content: const Text("Are you sure you want to Approve?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogpartymasterreject(BuildContext context, id) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () async {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget RejectButton = TextButton(
    child: const Text("Reject"),
    onPressed: () async {
      var approvalResponse = await ApiService().partymasterdetailsreject(id);
      if (approvalResponse!.data.table[0].status == "Success") {
        print(approvalResponse.data.table[0].status);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        Get.off(const PartyRole());
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: const Text("AlertDialog"),
    content: const Text("Are you sure you want to Reject?"),
    actions: [
      cancelButton,
      RejectButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
