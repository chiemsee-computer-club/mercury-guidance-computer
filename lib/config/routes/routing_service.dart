import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mercury_guidance_computer/config/routes/routes.dart';

class RoutingService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  FluroRouter? _router;

  FluroRouter get router {
    if (_router == null) {
      _router = FluroRouter();
      Routes.configureRoutes(_router!);
    }

    return _router!;
  }

  void navigateTo(String path, {Object? arguments})
  {
    var context = _getRoutingContext();
    var navigatorState = navigatorKey.currentState;
    if (navigatorState != null && navigatorState.canPop()) {
      navigatorState.popUntil((route) => route.isFirst);
    }
    if (context != null) {
      Navigator.of(context).pushNamed(path, arguments: arguments);
    }
  }

  BuildContext? _getRoutingContext()
  {
    return navigatorKey.currentState?.context;
  }
}