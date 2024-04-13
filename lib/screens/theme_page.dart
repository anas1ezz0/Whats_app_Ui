import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/model/chat_settings_model.dart';
import 'package:whats_app/widgets/chats_settings/archive_chats_widget.dart';
import 'package:whats_app/widgets/chats_settings/chat_setting_widget.dart';
import 'package:whats_app/widgets/chats_settings/theme_display_section.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final ChatSettingsModel chatSettingsModel = const ChatSettingsModel();

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
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            titleSpacing: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Display',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  const ThemeWidget(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(
                    color: dividerColor,
                  ),
                  const ChatSettingsWidget(),
                  const Divider(
                    color: dividerColor,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const ArchivedChatsWidgets(),
                  const Divider(
                    color: dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      'Chat backup',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    leading: Icon(
                      Icons.backup,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Transfer Chats',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    leading: Icon(
                        color: Theme.of(context).primaryColor,
                        Icons.logout_sharp),
                  ),
                  ListTile(
                    title: Text(
                      'Chat history',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    leading: Icon(
                        color: Theme.of(context).primaryColor, Icons.history),
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
