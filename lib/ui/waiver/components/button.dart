import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image/image.dart';
import 'package:sslim_mobile/main.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/waiver/waiverdetails.dart';



class AprveOrRejButton extends StatelessWidget {
  int RequestId;
  AprveOrRejButton(this.RequestId);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 140,
        ),
        ElevatedButton(
            onPressed: () {
              showAlertDialog(context, RequestId);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)),
            child: Text(
              'Approve',
            )),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // approvOrRejectButton();
              showAlertDialog1(context, RequestId);
            },
            child: Text('Reject'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2))),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
            child: Text('Cancel'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)))
      ],
    );
  }
}
