import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(
              color: AppColors.primaryColor
          )
      )
  );
}
