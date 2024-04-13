import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/model/info.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 5, 155, 82),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.link,
                            color: Colors.black,
                            size: 38,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create call link',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Share a link for your WhatsApp call',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Recent',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    backgroundImage: NetworkImage(
                      info[3]['profilePic'].toString(),
                    ),
                    // AssetImage(
                    //   'assets/images/zoro.jpg',
                    // ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info[3]['name'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.call_received,
                              color: Colors.red,
                              size: 18,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              'Today, 11:00 PM',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        )
                      ]),
                  const Spacer(),
                  const Icon(
                    Icons.call,
                    color: Color.fromARGB(255, 5, 155, 82),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
