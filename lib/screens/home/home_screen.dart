import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mercury_guidance_computer/config/routes/export.dart';
import 'package:mercury_guidance_computer/config/routes/routes_config.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mercury Guidance Computer"),
      ),
      body: Container(
        child: Column(
          children: [
            CupertinoButton.filled(
              onPressed: () => {
                RoutesConfig.ROUTER.navigateTo(context, Routes.settingsScreen)
              },
              child: const Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
