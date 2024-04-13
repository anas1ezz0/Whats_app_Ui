import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import '../model/info.dart';
import '../widgets/chat_body/chat_message_item_listview.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

TextEditingController textController = TextEditingController();

class _ChatPageState extends State<ChatPage> {
  bool isShowEmoji = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Image.asset(
              'assets/images/lofu_background.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              // ignore: deprecated_member_use
              child: WillPopScope(
                onWillPop: () {
                  if (isShowEmoji) {
                    setState(() => isShowEmoji = !isShowEmoji);
                    return Future.value(false);
                  } else {
                    return Future.value(true);
                  }
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    leadingWidth: 25,
                    leading: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                            info[0]['profilePic'].toString(),
                          ),
                          radius: 20,
                          // child: Image.asset('assets/images/download.png'),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              info[0]['name'].toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              'online',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.videocam_rounded,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  body: Column(
                    children: [
                      const Expanded(
                        child: ChatPageListView(),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w, vertical: 3.h),
                              child: TextFormField(
                                // keyboardType: TextInputType.text,
                                keyboardAppearance: Brightness.light,
                                onTap: () {
                                  if (isShowEmoji) {
                                    setState(() {
                                      isShowEmoji = !isShowEmoji;
                                    });
                                  }
                                },
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        setState(() {
                                          isShowEmoji = !isShowEmoji;
                                        });
                                      },
                                      alignment:
                                          AlignmentDirectional.bottomStart,
                                      icon: Icon(
                                        Icons.emoji_emotions_outlined,
                                        size: 27,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                  hintText: 'Send a message',
                                  hintStyle: TextStyle(
                                      fontSize: 19,
                                      color: Theme.of(context).primaryColor),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF111b20),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF111b20),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      right: 15, left: 12, top: 0, bottom: 10),
                                  suffixIcon: SizedBox(
                                    width: 100.w,
                                    height: 20.h,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.attach_file,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 22,
                                            )),
                                        IconButton(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            padding:
                                                EdgeInsets.only(right: 5.w),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.camera_alt_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 4.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF075e54),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  )))
                        ],
                      ),
                      if (isShowEmoji)
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.35,
                            child: EmojiPicker(
                              textEditingController:
                                  textController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                              config: Config(
                                columns: 7,
                                emojiSizeMax: 32 *
                                    (Platform.isIOS
                                        ? 1.30
                                        : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                                verticalSpacing: 0,
                                horizontalSpacing: 0,
                                gridPadding: EdgeInsets.zero,
                                initCategory: Category.RECENT,
                                bgColor: appBarColor,
                                indicatorColor: Colors.blue,
                                iconColor: Colors.grey,
                                iconColorSelected: Colors.blue,
                                backspaceColor: Colors.blue,
                                skinToneDialogBgColor: Colors.white,
                                skinToneIndicatorColor: Colors.grey,
                                enableSkinTones: true,
                                recentTabBehavior: RecentTabBehavior.RECENT,
                                recentsLimit: 28,
                                noRecents: const Text(
                                  'No Recents',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black26),
                                  textAlign: TextAlign.center,
                                ), // Needs to be const Widget
                                loadingIndicator: const SizedBox
                                    .shrink(), // Needs to be const Widget
                                tabIndicatorAnimDuration: kTabScrollDuration,
                                categoryIcons: const CategoryIcons(),
                                buttonMode: ButtonMode.MATERIAL,
                              ),
                            ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
