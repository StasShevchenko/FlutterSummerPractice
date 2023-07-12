import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/theme/app_input_decoration_theme.dart';
import 'package:flutter_summer_practice/presentation/theme/styles/elevated_button_style.dart';
import 'package:flutter_summer_practice/presentation/theme/app_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData appTheme() => ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: AppColors.primaryBlue,
    titleTextStyle: TextStyle(
      color: AppColors.primaryWhite,
      fontSize: 20
    )
  ),
  inputDecorationTheme: appInputDecorationTheme(),
  textTheme: appTextTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle()),
);