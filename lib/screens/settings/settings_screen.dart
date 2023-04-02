import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury_guidance_computer/services/local_storage_service.dart';
import 'package:mercury_guidance_computer/utils/extensions/context_extensions.dart';
import '../../config/theme/export.dart';
import '../../startup.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AppTheme? _selectedTheme;

  @override
  void initState() {
    super.initState();
    var localStorageService = getIt.get<LocalStorageService>();
    _selectedTheme = localStorageService.theme == AppTheme.Dark
        ? AppTheme.Light
        : AppTheme.Dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Text("Change Theme"),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return CupertinoSlidingSegmentedControl<AppTheme>(
                thumbColor: Colors.grey,
                groupValue: _selectedTheme,
                children: const <AppTheme, Widget>{
                  AppTheme.Dark: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Light",
                    ),
                  ),
                  AppTheme.Light: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Dark",
                    ),
                  ),
                },
                onValueChanged: (newTheme) {
                  setState(() {
                    _selectedTheme = newTheme!;
                  });
                  var theme = newTheme == AppTheme.Dark
                      ? AppTheme.Light
                      : AppTheme.Dark;
                  context.read<ThemeBloc>().add(ThemeEventUpdate(theme: theme));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
