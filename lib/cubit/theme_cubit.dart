import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app/widgets/shard_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;
  void changeAppMode({bool? fromSharedPref}) {
    if (fromSharedPref != null) {
      isDark = fromSharedPref;
      emit(ChangeAppMode());
    } else {
      isDark = !isDark;
      SharedPref.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }
}
