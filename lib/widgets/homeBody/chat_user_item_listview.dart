import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/model/info.dart';
import 'package:whats_app/widgets/homeBody/chat_user_item.dart';

class ChatItemListView extends StatelessWidget {
  const ChatItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: info.length,
            itemBuilder: (context, index) {
              return ChatItem(context, index);
            });
      },
    );
  }
}
