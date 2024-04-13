import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/model/settings_model.dart';
import 'package:whats_app/screens/theme_page.dart';
import 'package:whats_app/widgets/settings/header_settings.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  List<SettingsModel> settings = [
    SettingsModel('Account', Icons.key, 'Security notification, change number'),
    SettingsModel(
        'Privacy', Icons.lock, 'Bloc contacts, disappearing messages'),
    SettingsModel('Avatar', Icons.face_4_rounded, 'Create,edit,profile photo'),
    SettingsModel('Chats', Icons.chat_sharp, 'Theme, wallpaper, chat history'),
    SettingsModel(
        'Notifications', Icons.notifications, 'Message, group & call tones'),
    SettingsModel(
        'Storge & data', Icons.circle_outlined, 'Manage your data and storge'),
    SettingsModel('App language', Icons.language, 'English (devices language'),
    SettingsModel(
        'Help', Icons.help, 'Help center, contact us , privacy policy'),
    SettingsModel('invite a friend', Icons.people, ' Invite a friend'),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 31,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 31,
                    color: Colors.white,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.w),
              child: Column(
                children: [
                  const HeaderSettings(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    color: dividerColor,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: settings.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ThemePage();
                                },
                              ),
                            );
                          },
                          leading: Icon(
                            color: Theme.of(context).primaryColor,
                            settings[index].icon,
                          ),
                          title: Text(
                            settings[index].title,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            settings[index].subTitle,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              fontSize: 14,
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text('from'),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 14.h,
                        width: 18.w,
                        child: Image.asset(
                          'assets/images/meta.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Meta',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
