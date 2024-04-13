import 'package:flutter/material.dart';
import 'package:whats_app/colors.dart';

class ArchivedChatsWidgets extends StatefulWidget {
  const ArchivedChatsWidgets({super.key});

  @override
  State<ArchivedChatsWidgets> createState() => _ArchivedChatsWidgetsState();
}

bool isactive3 = false;

class _ArchivedChatsWidgetsState extends State<ArchivedChatsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Archived Chat ',
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'keep chats archived',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'Archived chats will remain archived when you receive a new message',
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          trailing: Switch(
            activeColor: Theme.of(context).secondaryHeaderColor,
            inactiveThumbColor: Colors.grey[600],
            inactiveTrackColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.01),
            activeTrackColor: tabColor,
            value: isactive3,
            onChanged: (value) {
              setState(() {
                isactive3 = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
