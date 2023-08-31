import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 58,
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