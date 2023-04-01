import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mercury_guidance_computer/constants/app_constants.dart';
import 'package:mercury_guidance_computer/services/local_storage_service.dart';
import 'package:mercury_guidance_computer/startup.dart';
import 'package:meta/meta.dart';

import '../export.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEventInitial>(_onThemeEventIntital);
    on<ThemeEventUpdate>(_onThemeEventUpdate);
  }

  _onThemeEventIntital(ThemeEventInitial event, Emitter<ThemeState> emit) async {
    var localStorageService = await getIt.getAsync<LocalStorageService>();
    var appTheme = localStorageService.theme;
    emit(ThemeState(appTheme: appTheme));
  }

  _onThemeEventUpdate(ThemeEventUpdate event, Emitter<ThemeState> emit) async {
    var localStorageService = await getIt.getAsync<LocalStorageService>();
    var appTheme = event.theme;
    localStorageService.theme = appTheme;
    emit(ThemeState(appTheme: appTheme));
  }
}
