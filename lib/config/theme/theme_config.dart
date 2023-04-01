import 'package:flutter/material.dart';

enum AppTheme { Dark, Light }

final themeConfigs = {
  AppTheme.Light: ThemeData.light(),
  AppTheme.Dark: ThemeData.dark()
};
