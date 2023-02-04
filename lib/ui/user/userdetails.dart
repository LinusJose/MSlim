import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:sslim_mobile/main_theme.dart';
import 'package:sslim_mobile/ui/user/widget.dart';
import 'package:sslim_mobile/ui/user/togglewidgent.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: MainTheme.theme2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .30,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final materialBanner = MaterialBanner(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            forceActionsBelow: true,
                            content: AwesomeSnackbarContent(
                              title: 'UserName',
                              message: 'Last Logged in : 2022-02-01 12:15:00',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.success,
                              // to configure for material banner
                              inMaterialBanner: true,
                            ),
                            actions: const [SizedBox.shrink()],
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentMaterialBanner()
                            ..showMaterialBanner(materialBanner);
                        },
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('asset/images/businessman.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Username',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .65,
                            child: const Text('Useremail@gmail.com'))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(25),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: MainTheme.nearlyWhite,
                          offset: Offset(
                            0.0,
                            0.0,
                          ), //Offset
                          blurRadius: 0.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  width: MediaQuery.of(context).size.width * .87,
                  height: MediaQuery.of(context).size.height * .58,
                  padding: const EdgeInsets.all(20),
                  // color: MainTheme.nearlyWhite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Option',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Touch ID & passcode',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            Logout()
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Option',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Touch ID & passcode',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  color: MainTheme.greydark,
                                  fontWeight: FontWeight.bold),
                            ),
                            ToggleSwitchCommon()
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
