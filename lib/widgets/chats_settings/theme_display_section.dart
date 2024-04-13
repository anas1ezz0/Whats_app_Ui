import 'package:flutter/material.dart';
import 'package:whats_app/cubit/theme_cubit.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({
    super.key,
  });

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ThemeCubit.get(context).changeAppMode();
          },
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            title: Text(
              'Theme',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.dark_mode,
              color: Colors.grey,
              size: 30,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 0),
          title: Text(
            'Wallpaper',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          leading: const Icon(
            Icons.wallpaper_rounded,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ],
    );
  }
}
