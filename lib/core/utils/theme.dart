import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_fashion/core/utils/styles.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: Styles.textStyle16.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueAccent,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
  ),
);
ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: Styles.textStyle16.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueAccent,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
  ),
);

