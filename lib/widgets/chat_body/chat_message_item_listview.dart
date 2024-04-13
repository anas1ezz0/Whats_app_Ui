import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/model/info.dart';

class ChatPageListView extends StatelessWidget {
  const ChatPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: info.length,
        itemBuilder: (context, index) {
          if (messages[index]['isMe'] == true) {
            return SendFromME(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString(),
            );
          } else {
            return SendToMe(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString(),
            );
          }
        });
  }
}

class SendFromME extends StatelessWidget {
  const SendFromME({
    super.key,
    required this.message,
    required this.date,
  });
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      delivered: true,
      seen: true,
      text: message,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      color: messageColor,
    );
  }
}

class SendToMe extends StatelessWidget {
  const SendToMe({
    super.key,
    required this.message,
    required this.date,
  });
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
        tail: false,
        text: message,
        isSender: false,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        color: senderMessageColor);
  }
}
