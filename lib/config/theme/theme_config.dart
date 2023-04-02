import 'package:flutter/material.dart';

enum AppTheme { Dark, Light }

final themeConfigs = {
  AppTheme.Light: ThemeData.light(useMaterial3: false),
  // AppTheme.Light: ThemeData(
  //   textTheme: const TextTheme(
  //     titleMedium: TextStyle(
  //       color: Colors.black,
  //       fontSize: 35,
  //       fontWeight: FontWeight.w600,
  //     ),
  //   ),
  // ),
  AppTheme.Dark: ThemeData.dark(useMaterial3: false)
};
