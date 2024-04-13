import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/model/info.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromARGB(255, 5, 155, 82), width: 3),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: NetworkImage(
              info[0]['profilePic'].toString(),
            ),
            // AssetImage('assets/images/zoro.jpg'),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info[0]['name'].toString(),
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Text(
              'Today, 12:30 PM',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
