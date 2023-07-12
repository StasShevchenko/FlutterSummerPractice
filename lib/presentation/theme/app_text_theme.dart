import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextTheme appTextTheme() => GoogleFonts.golosTextTextTheme().copyWith(
    bodyLarge: GoogleFonts.golosText().copyWith(
      color: AppColors.secondaryBlue,
      fontSize: 16,
    ),
  bodyMedium: GoogleFonts.golosText().copyWith(
    color: AppColors.secondaryBlue
  ),
  titleLarge: GoogleFonts.golosText().copyWith(
    color: AppColors.secondaryBlue,
    fontSize: 24
  )
);