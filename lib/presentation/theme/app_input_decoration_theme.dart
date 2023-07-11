import 'package:flutter/material.dart';

import 'app_colors.dart';

InputDecorationTheme appInputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondaryBlue),
        borderRadius: BorderRadius.circular(10)),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryWhite)
    ),
    labelStyle: TextStyle(color: AppColors.secondaryBlue),
    fillColor: AppColors.primaryWhite,
    filled: true);
