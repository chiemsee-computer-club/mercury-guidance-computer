import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  ThemeData theme() {
    return Theme.of(this);
  }

  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  IconThemeData iconTheme() {
    return Theme.of(this).iconTheme;
  }

  double screenWidth() {
    return MediaQuery.of(this).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(this).size.height;
  }

  NavigatorState navigator() {
    return Navigator.of(this);
  }
}