import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/deop_down_widget/drop_down_status_page.dart';

final List<String> items = [
  'Status privacy',
];
String? selectedValue;

class StatusText extends StatefulWidget {
  const StatusText({
    super.key,
  });

  @override
  State<StatusText> createState() => _StatusTextState();
}

class _StatusTextState extends State<StatusText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Status',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Icon(
              Icons.more_vert,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            items: [
              ...MenuItemstwo.secondItems.map(
                (item) => DropdownMenuItem<MenuItemtwo>(
                  value: item,
                  child: MenuItemstwo.buildItemtwo(item, context),
                ),
              ),
            ],
            onChanged: (value) {
              // ignore: unnecessary_cast
              MenuItemstwo.onChanged(context, value! as MenuItemtwo);
            },
            dropdownStyleData: DropdownStyleData(
              width: 180.w,
              padding: EdgeInsets.symmetric(vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              offset: const Offset(0, 8),
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: [
                ...List<double>.filled(MenuItemstwo.secondItems.length, 48),
              ],
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
            ),
          ),
        ),
      ],
    );
  }
}
