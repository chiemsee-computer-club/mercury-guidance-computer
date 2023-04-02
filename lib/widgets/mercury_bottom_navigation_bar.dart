import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mercury_guidance_computer/config/routes/export.dart';
import 'package:mercury_guidance_computer/models/app_definition.dart';

import '../startup.dart';

class MercuryBottomNaviagationBar extends StatelessWidget {
  const MercuryBottomNaviagationBar({super.key});

  static List<AppDefinition> apps = [
    AppDefinition("Home", "/", "assets/icons/home.svg"),
    AppDefinition("Spotify", "/spotify", "assets/icons/spotify.svg"),
    AppDefinition("Settings", "/settings", "assets/icons/settings.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[300],
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: apps.length,
        itemBuilder: (context, index) {
          var app = apps[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: SvgPicture.asset(app.iconPath),
                iconSize: 60,
                splashColor: Colors.grey[500],
                splashRadius: 35,
                onPressed: () {
                  var routingService = getIt.get<RoutingService>();
                  routingService.navigateTo(app.route);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
