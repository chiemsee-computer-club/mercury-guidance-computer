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

  void navigateTo(String path)
  {
    var context = _getRoutingContext();
    var navigatorState = navigatorKey.currentState;
    if (navigatorState != null && navigatorState.canPop()) {
      navigatorState.popUntil((route) => route.isFirst);
    }
    if (context != null) {
      router.navigateTo(context, path);
    }
  }

  BuildContext? _getRoutingContext()
  {
    return navigatorKey.currentState?.context;
  }
}