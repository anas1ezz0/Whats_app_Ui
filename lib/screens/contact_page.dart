import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/model/info.dart';

import '../colors.dart';
import '../widgets/contacts_body/contacts_header.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: textColor,
              ),
            ),
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select contact',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                Text(
                  '${info.length} contacts',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: textColor,
                  )),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 30,
                  color: textColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContactsHeader(),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0.w),
                  child: Text(
                    'Contacts on WhatsApp',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: info.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            info[index]['profilePic'].toString(),
                          ),
                        ),
                        title: Text(
                          info[index]['name'].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        subtitle: Text(
                          info[index]['bio'].toString(),
                          style: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.6),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
