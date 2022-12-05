import 'dart:math';

import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  GridViewScreen({super.key});

  final List<Map<String, dynamic>> apps = [
    {"name": "Camera", "icons": Icons.camera_alt, "bg_color": Colors.red},
    {
      "name": "Calendar",
      "icons": Icons.calendar_month_outlined,
      "bg_color": Colors.red
    },
    {"name": "Clock", "icons": Icons.alarm, "bg_color": Colors.red},
    {"name": "Contacts", "icons": Icons.contact_mail, "bg_color": Colors.red},
    {"name": "Messages", "icons": Icons.message, "bg_color": Colors.red},
    {"name": "Camera", "icons": Icons.camera_alt, "bg_color": Colors.red},
    {
      "name": "Calendar",
      "icons": Icons.calendar_month_outlined,
      "bg_color": Colors.red
    },
    {"name": "Clock", "icons": Icons.alarm, "bg_color": Colors.red},
    {"name": "Contacts", "icons": Icons.contact_mail, "bg_color": Colors.red},
    {"name": "Messages", "icons": Icons.message, "bg_color": Colors.red},
    {"name": "Camera", "icons": Icons.camera_alt, "bg_color": Colors.red},
    {
      "name": "Calendar",
      "icons": Icons.calendar_month_outlined,
      "bg_color": Colors.red
    },
    {"name": "Clock", "icons": Icons.alarm, "bg_color": Colors.red},
    {"name": "Contacts", "icons": Icons.contact_mail, "bg_color": Colors.red},
    {"name": "Messages", "icons": Icons.message, "bg_color": Colors.red},
    {"name": "Camera", "icons": Icons.camera_alt, "bg_color": Colors.red},
    {
      "name": "Calendar",
      "icons": Icons.calendar_month_outlined,
      "bg_color": Colors.red
    },
    {"name": "Clock", "icons": Icons.alarm, "bg_color": Colors.red},
    {"name": "Contacts", "icons": Icons.contact_mail, "bg_color": Colors.red},
    {"name": "Messages", "icons": Icons.message, "bg_color": Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: apps.length,

        /// aspect ratio= width/height
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            // maxCrossAxisExtent: 150,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          final appIcon = apps[index];

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  // height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(Random().nextInt(255),
                          Random().nextInt(255), Random().nextInt(255), 1)),
                  child: Icon(appIcon['icons'], color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  appIcon['name'],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
