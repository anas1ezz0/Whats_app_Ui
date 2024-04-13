import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/cubit/theme_cubit.dart';

class HeaderSettings extends StatelessWidget {
  const HeaderSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                'assets/images/prof.jpg',
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anas',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'The Strongest Under THe sky',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.qr_code,
              color: tabColor,
              size: 30,
            ),
            SizedBox(
              width: 15.w,
            ),
            const Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: tabColor,
              size: 30,
            ),
          ],
        );
      },
    );
  }
}
