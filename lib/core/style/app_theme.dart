import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get getTheme {
    return _themeData();
  }

  static ThemeData _themeData() {
    return ThemeData(
      fontFamily: "Gotham",
      colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.blueGrey),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 20.sp),
        titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 15.sp),
        bodyMedium: TextStyle(fontSize: 12.sp),
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      textSelectionTheme: const TextSelectionThemeData(),
    );
  }
}
