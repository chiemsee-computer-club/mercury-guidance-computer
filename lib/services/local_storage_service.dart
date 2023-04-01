import 'package:shared_preferences/shared_preferences.dart';

import '../config/theme/theme_config.dart';
import '../constants/app_constants.dart';

class LocalStorageService {
  late SharedPreferences _preferences;

  Future<LocalStorageService> initAsync() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }
  String? get langCode => _preferences.getString('lang_code');
  set langCode(String? langCode) => _preferences.setString('lang_code', langCode!);

  AppTheme get theme {
    var theme = _preferences.getString('theme');
    return  AppTheme.values.firstWhere((t) => t.toString() == theme, orElse: () =>  AppConstants.DEFAULT_THEME);
  }
  set theme(AppTheme theme) => _preferences.setString('theme', theme.toString());
}