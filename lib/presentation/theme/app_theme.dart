import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/theme/app_input_decoration_theme.dart';
import 'package:flutter_summer_practice/presentation/theme/styles/elevated_button_style.dart';
import 'package:flutter_summer_practice/presentation/theme/app_text_theme.dart';

import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: AppColors.primaryBlue
  ),
  inputDecorationTheme: appInputDecorationTheme,
  textTheme: appTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
);