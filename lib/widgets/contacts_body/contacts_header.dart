import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsHeader extends StatelessWidget {
  const ContactsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0.h),
          child: ListTile(
            title: Text(
              'New group',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: Theme.of(context).primaryColor,
              ),
            ),
            leading: Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 5, 155, 82),
              ),
              child: const Icon(
                Icons.group,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0.h),
          child: ListTile(
            title: Text(
              'New contact',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: Theme.of(context).primaryColor,
              ),
            ),
            leading: Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 5, 155, 82),
              ),
              child: const Icon(
                Icons.person_add_alt_1,
                color: Colors.white,
                size: 35,
              ),
            ),
            trailing: const Icon(
              Icons.qr_code,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0.h),
          child: ListTile(
            title: Text(
              'New Community',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: Theme.of(context).primaryColor,
              ),
            ),
            leading: Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 5, 155, 82),
              ),
              child: const Icon(
                Icons.groups_2,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
