part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeEventInitial extends ThemeEvent { }

class ThemeEventUpdate extends ThemeEvent {
  final AppTheme theme;

  const ThemeEventUpdate({required this.theme});

  @override
  List<Object> get props => [theme];
}
