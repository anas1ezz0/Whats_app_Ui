import 'package:flutter/material.dart';

import '../screens/settings_page.dart';

class MenuItem {
  const MenuItem({
    required this.text,
    // required this.icon,
  });

  final String text;
  // final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [newgroup, newbroadcast, settings];
  static const List<MenuItem> secondItems = [starrdedMessages];

  static const newgroup = MenuItem(
    text: 'New group',
  );
  static const newbroadcast = MenuItem(
    text: 'New broadcast',
  );
  static const settings = MenuItem(
    text: 'Settings',
  );
  static const starrdedMessages = MenuItem(
    text: 'Starrded messages',
  );

  static Widget buildItem(MenuItem item, context) {
    return Text(
      item.text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.newgroup:
        //Do something
        break;
      case MenuItems.settings:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SettingPage();
        }));
        //Do something
        break;
      case MenuItems.newbroadcast:
        //Do something
        break;
      case MenuItems.starrdedMessages:
        //Do something
        break;
    }
  }
}
