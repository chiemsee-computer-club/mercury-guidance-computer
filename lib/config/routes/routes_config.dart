import 'package:fluro/fluro.dart';
import 'package:mercury_guidance_computer/config/routes/routes.dart';

class RoutesConfig {
  static FluroRouter? _router;

  static FluroRouter get ROUTER {
    if (_router == null) {
      _router = FluroRouter();
      Routes.configureRoutes(_router!);
    }

    return _router!;
  }
}