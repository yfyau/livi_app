import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livi_app/bloc/global/GlobalCubit.dart';
import 'package:livi_app/values/colors/BasicColors.dart';
import 'package:livi_app/values/colors/LightColors.dart';
import 'package:livi_app/values/colors/DarkColors.dart';

enum LiviThemeMode { LIGHT, DARK }

class LiviTheme {
  static LightColors _lightColors = LightColors();
  static DarkColors _darkColors = DarkColors();

  static BasicColors getColors(BuildContext context) {
    LiviThemeMode mode = BlocProvider.of<GlobalCubit>(context).state.themeMode;

    return mode == LiviThemeMode.LIGHT ? _lightColors : _darkColors;
  }

  static ThemeData getData(BuildContext context) {
    LiviThemeMode mode = BlocProvider.of<GlobalCubit>(context).state.themeMode;
    BasicColors colors = getColors(context);

    ThemeData base = mode == LiviThemeMode.LIGHT ? ThemeData.light() : ThemeData.dark();

    return base.copyWith(
      primaryColor: colors.primary,
      appBarTheme: base.appBarTheme.copyWith(
        iconTheme: base.iconTheme.copyWith(color: colors.text),
        textTheme: base.textTheme
            .copyWith(
              headline6: TextStyle(fontSize: 24),
            )
            .apply(
              bodyColor: colors.text,
              displayColor: colors.text,
            ),
        titleTextStyle: TextStyle().apply(color: colors.text),
        toolbarTextStyle: TextStyle().apply(color: colors.text),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: colors.text,
        displayColor: colors.text,
      ),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: colors.text)),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.border)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.border)),
      ),
    );
  }
}
