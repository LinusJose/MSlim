import 'package:flutter/material.dart';
import 'package:sslim_mobile/ui/user/userdetails.dart';

class UserWindow extends StatefulWidget {
  const UserWindow({super.key});

  @override
  State<UserWindow> createState() => _UserWindowState();
}

class _UserWindowState extends State<UserWindow> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserDetails(),
    );
  }
}
