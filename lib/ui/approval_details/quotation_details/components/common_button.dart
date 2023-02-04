import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image/image.dart';
import 'package:sslim_mobile/main.dart';
import 'package:sslim_mobile/main_theme.dart';

import '../quotationdetails.dart';

class CommonButton extends StatelessWidget {
  String qotNo;
  CommonButton(this.qotNo);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 140,
        ),
        ElevatedButton(
            onPressed: () {
              showAlertDialog(context, qotNo);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)),
            child: const Text(
              'Approve',
            )),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // approvOrRejectButton();
              showAlertDialog1(context, qotNo);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)),
            child: const Text('Reject')),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)),
            child: const Text('Cancel'))
      ],
    );
  }
}
