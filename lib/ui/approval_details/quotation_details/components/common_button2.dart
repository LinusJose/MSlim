import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/approval_details/party_details/party.dart';

import 'package:sslim_mobile/ui/agent/party/partyrole.dart';

class CommonButtontwo extends StatelessWidget {
  int? id;
  CommonButtontwo(this.id);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 140,
        ),
        ElevatedButton(
            onPressed: () {
              print(id);

              showAlertDialogpartymasterapproval(context, id);
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
              showAlertDialogpartymasterreject(context, id);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)),
            child: const Text('Reject')),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Get.off(const PartyRole());
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainTheme.theme2)),
            child: const Text('Cancel'))
      ],
    );
  }
}
