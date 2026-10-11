// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeColors {
  final bool isDark;
  final Color mainColor;
  final Color textColor;
  final Color primaryColor;
  
  static const darkBg = Color(0xFF121212);
  static const darkText = Color(0xFFE1E1E1);
  static const darkButton = Color(0xFF652DAA);

  static const lightBg = Color(0xFFF8F9FA);
  static const lightText = Color(0xFF1C1B1F);
  static const lightButton = Color(0xFF9C75D3);
  ThemeColors({
    required this.isDark,
    required this.mainColor,
    required this.primaryColor,
    required this.textColor,
  });



  ThemeColors copyWith({
    bool? isDark,
    Color? mainColor,
    Color? primaryColor,
    Color? textColor,
  }) {
    return ThemeColors(
      isDark: isDark ?? this.isDark,
      mainColor: mainColor ?? this.mainColor,
      primaryColor: primaryColor ?? this.primaryColor,
      textColor: textColor ?? this.textColor,
    );
  }

}

class ThemeNotifier extends ValueNotifier<ThemeColors>
{
  ThemeNotifier() : super(
    ThemeColors(
      isDark: true,
      mainColor: ThemeColors.darkBg,
      primaryColor: ThemeColors.darkButton,
      textColor: ThemeColors.darkText)
  );
  
  void changeTheme() {
  final newIsDark = !value.isDark;
  value = value.copyWith(
    isDark: newIsDark,
    mainColor: newIsDark ? ThemeColors.darkBg : ThemeColors.lightBg,
    primaryColor: newIsDark ? ThemeColors.darkButton : ThemeColors.lightButton,
    textColor: newIsDark ? ThemeColors.darkText : ThemeColors.lightText,
  );
}
}

final themeNotifier = ThemeNotifier();