import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/model/info.dart';
import 'package:whats_app/screens/chat_page.dart';

// ignore: non_constant_identifier_names
GestureDetector ChatItem(
  BuildContext context,
  int index,
) {
  return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ChatPage();
    })),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 16.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              info[index]['profilePic'].toString(),
            ),
            radius: 30,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info[index]['name'].toString(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    info[index]['message'].toString(),
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    // softWrap: false,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                info[index]['time'].toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
