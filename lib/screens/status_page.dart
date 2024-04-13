import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import '../widgets/status_body/my_status.dart';
import '../widgets/status_body/other_status.dart';
import '../widgets/status_body/status_text.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusText(),
              SizedBox(
                height: 12.h,
              ),
              const MyStatus(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Recent updates',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              const OtherStatus()
            ],
          ),
        );
      },
    );
  }
}
