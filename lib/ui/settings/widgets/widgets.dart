import 'package:flutter/material.dart';

class DemoListTile extends StatelessWidget {
  const DemoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
        title: Text("Settings"),
        isThreeLine:
            true, //will fix the alignment if the subtitle text is too big
        subtitle: Text("Profile setings"),
        leading: CircleAvatar(backgroundColor: Colors.blue),
        trailing: Icon(Icons.arrow_right));
  }
}
