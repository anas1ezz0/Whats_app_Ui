import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';

class ChatSettingsWidget extends StatefulWidget {
  const ChatSettingsWidget({super.key});

  @override
  State<ChatSettingsWidget> createState() => _ChatSettingsWidgetState();
}

bool isactive1 = false;
bool isactive2 = false;

class _ChatSettingsWidgetState extends State<ChatSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chat settings',
        ),
        SizedBox(
          height: 10.h,
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Enter is send',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'Enter key will send your message',
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          trailing: Switch(
            activeColor: Theme.of(context).secondaryHeaderColor,
            inactiveThumbColor: Colors.grey[600],
            inactiveTrackColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.01),
            activeTrackColor: tabColor,
            value: isactive1,
            onChanged: (value) {
              setState(() {
                isactive1 = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Media visibility',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'show newly downloaded media in your device\'s gallery',
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          trailing: Switch(
              activeColor: Theme.of(context).secondaryHeaderColor,
              inactiveThumbColor: Colors.grey[600],
              inactiveTrackColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.01),
              activeTrackColor: tabColor,
              value: isactive2,
              onChanged: (value) {
                setState(
                  () {
                    isactive2 = value;
                  },
                );
              }),
        ),
        ListTile(
          title: Text(
            'Font Size',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'Medium',
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
