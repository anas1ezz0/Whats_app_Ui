import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app/colors.dart';
import 'package:whats_app/cubit/bloc_observer.dart';
import 'package:whats_app/cubit/theme_cubit.dart';
import 'package:whats_app/screens/home.dart';
import 'package:whats_app/widgets/shard_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer = MyBlocObserver();

  // ignore: unused_local_variable
  bool? isDark = SharedPref.getData(key: 'isDark');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..changeAppMode(fromSharedPref: isDark),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  switchTheme: SwitchThemeData(
                    thumbColor: MaterialStateProperty.all(Colors.white),
                    trackColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  tabBarTheme: const TabBarTheme(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.white,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          color: Colors.white,
                          // color: tabColor,
                          width: 3),
                    ),
                  ),
                  secondaryHeaderColor: Colors.white,
                  primaryColor: Colors.black,
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.w500,
                    ),
                  ),
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.black),
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      backgroundColor: tabColor),
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: backgroundColor,
                  tabBarTheme: const TabBarTheme(
                    labelColor: tabColor,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: tabColor,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          color: tabColor,
                          // color: tabColor,
                          width: 3),
                    ),
                  ),
                  secondaryHeaderColor: backgroundColor,
                  primaryColor: Colors.white,
                  primaryTextTheme: const TextTheme(
                    bodyLarge: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  textTheme: const TextTheme(
                      bodyLarge: TextStyle(
                    color: Colors.white,
                    //  fontWeight: FontWeight.w500,
                  )),
                  appBarTheme: const AppBarTheme(
                      // color: appBarColor,
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        // fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: appBarColor),
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                    backgroundColor: tabColor,
                  ),
                ),
                themeMode: ThemeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const Home());
          },
        ),
      ),
    );
  }
}
