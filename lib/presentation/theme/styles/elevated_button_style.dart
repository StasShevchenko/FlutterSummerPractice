import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/theme/app_colors.dart';

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.primaryBlue,
  foregroundColor: AppColors.primaryWhite,
  elevation: 0,
  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  )
);