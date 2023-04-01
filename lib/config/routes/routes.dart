import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mercury_guidance_computer/config/routes/routes_handler.dart';

class Routes {
  static const homeScreen = '/';
  static const settingsScreen  = '/settings';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });

    router.define(homeScreen, handler: homeHandler, transitionType: TransitionType.cupertino);
    router.define(settingsScreen, handler: settingsHandler, transitionType: TransitionType.cupertino);
  }
}