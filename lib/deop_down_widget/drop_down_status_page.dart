import 'package:flutter/material.dart';

class MenuItemtwo {
  const MenuItemtwo({
    required this.text,
    // required this.icon,
  });

  final String text;
  // final IconData icon;
}

abstract class MenuItemstwo {
  // static const List<MenuItemtwo> firstItems = [newgroup, newbroadcast, settings];
  static const List<MenuItemtwo> secondItems = [starrdedMessages];

  // static const newgroup = MenuItemtwo(
  //   text: 'New group',
  // );
  // static const newbroadcast = MenuItemtwo(
  //   text: 'New broadcast',
  // );
  // static const settings = MenuItemtwo(
  //   text: 'Settings',
  // );
  static const starrdedMessages = MenuItemtwo(
    text: 'Status privacy',
  );

  static Widget buildItemtwo(MenuItemtwo item, context) {
    return Text(
      item.text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  static void onChanged(BuildContext context, MenuItemtwo item) {
    switch (item) {
      // case MenuItems.newgroup:
      //   //Do something
      //   break;
      // case MenuItems.settings:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return SettingPage();
      //   }));
      //   //Do something
      //   break;
      // case MenuItems.newbroadcast:
      //   //Do something
      //   break;
      case MenuItemstwo.starrdedMessages:
        //Do something
        break;
    }
  }
}
