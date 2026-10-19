import 'package:flutter/material.dart';
import 'package:flutter_batch16/core/utils/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.white,
        labelStyle: TextStyle(color: AppColors.texGrayColor),
        hintStyle: TextStyle(color: AppColors.texGrayColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryAppColor,
          foregroundColor: Colors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
