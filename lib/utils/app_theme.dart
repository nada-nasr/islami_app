import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackBgColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryColor)));
}
