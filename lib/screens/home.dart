import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/deop_down_widget/drop_down_app_bar.dart';

import '../widgets/homeBody/chat_user_item_listview.dart';
import 'calls_page.dart';
import 'contact_page.dart';
import 'status_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  bool isSearch = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          ThemeCubit cubit = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: appBarHome(context),
            body: const TabBarView(
              children: [
                Column(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: ChatItemListView(),
                    ),
                  ],
                ),
                StatusPage(),
                CallsPage()
              ],
            ),
            floatingActionButton: selectedIndex == 0
                ? FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactsPage(),
                        ),
                      );
                    },
                    backgroundColor: tabColor,
                    child: Icon(
                      Icons.message,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  )
                : selectedIndex == 1
                    ? FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: tabColor,
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      )
                    : FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: tabColor,
                        child: Icon(
                          Icons.add_call,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
          );
        },
      ),
    );
  }

  AppBar appBarHome(BuildContext context) {
    return AppBar(
      title: const Text(
        'WhatsApp',
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      // TextFormField(
      //     // style: const TextStyle(color: Colors.white, fontSize: 20),
      //     decoration: InputDecoration(
      //       hintText: 'Search',
      //       // hintStyle: const TextStyle(fontSize: 19),
      //       filled: true,
      //       fillColor: chatBarMessage,
      //       enabledBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(17),
      //         borderSide: const BorderSide(
      //           color: Color(0xFF111b20),
      //         ),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(17),
      //         borderSide: const BorderSide(
      //           color: Color(0xFF111b20),
      //         ),
      //       ),
      //     ),
      //   ),
      ////
      // backgroundColor: Theme.of(context).a,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 30,
              color: textColor,
            )),
        IconButton(
          icon: const Icon(
            Icons.search,
            size: 30,
            color: textColor,
          ),
          onPressed: () {
            setState(() {
              // isSearch = !isSearch;
            });
          },
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton:
                const Icon(Icons.more_vert, size: 35, color: Colors.white),
            items: [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item, context),
                ),
              ),
              const DropdownMenuItem<SizedBox>(
                  enabled: false, child: SizedBox()),
              ...MenuItems.secondItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item, context),
                ),
              ),
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value! as MenuItem);
            },
            dropdownStyleData: DropdownStyleData(
              width: 180.w,
              padding: EdgeInsets.symmetric(vertical: 6.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).secondaryHeaderColor),
              offset: const Offset(0, 8),
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: [
                ...List<double>.filled(MenuItems.firstItems.length, 48),
                8,
                ...List<double>.filled(MenuItems.secondItems.length, 48),
              ],
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
            ),
          ),
        ),
      ],
      bottom: TabBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        labelColor: Theme.of(context).tabBarTheme.labelColor,
        indicatorColor: Theme.of(context).tabBarTheme.labelColor,
        unselectedLabelColor: textColor,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          )
        ],
      ),
    );
  }
}
