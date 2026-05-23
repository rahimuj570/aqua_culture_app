import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorSchemeSeed: AppColors.appThemeColor,
      scaffoldBackgroundColor: AppColors.scafoldColor,
    );
  }
}
