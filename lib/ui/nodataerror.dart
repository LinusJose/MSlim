import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, routedata) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      // print(routedata);
      Navigator.pop(context);
    },
  );
  // Widget continueButton = TextButton(
  //   child: Text("Continue"),
  //   onPressed: () {},
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("No Data Found!"),
    actions: [
      cancelButton,
      // continueButton,
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
