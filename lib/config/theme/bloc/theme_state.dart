part of 'theme_bloc.dart';

@immutable
class ThemeState {
  ThemeData? themeData;
  final AppTheme appTheme;

  ThemeState({required this.appTheme}) {
    themeData = themeConfigs[appTheme];
  }
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(appTheme: AppConstants.DEFAULT_THEME);
}
