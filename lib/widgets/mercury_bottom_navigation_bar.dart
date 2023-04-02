import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mercury_guidance_computer/config/routes/export.dart';
import 'package:mercury_guidance_computer/models/app_definition.dart';

import '../startup.dart';

class MercuryBottomNaviagationBar extends StatelessWidget {
  const MercuryBottomNaviagationBar({super.key});
  final double _width = 600;
  final double _height = 80;


  static List<AppDefinition> apps = [
    AppDefinition("Home", "/", "assets/icons/home.svg"),
    AppDefinition("Spotify", "/spotify", "assets/icons/spotify.svg"),
    AppDefinition("Settings", "/settings", "assets/icons/settings.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0.5, 0.5),
            child: SizedBox(
              width: _width - 1,
              height: _height - 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/glass/glass.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: _width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                border: Border.all(color: Colors.grey[300]!, width: 2, strokeAlign: BorderSide.strokeAlignOutside)),
            child: GlassContainer(
              width: _width,
              height: _height,
              blur: 4,
              shadowColor: Colors.black.withOpacity(0.24),
              borderRadius: BorderRadius.circular(16),
              border: const Border.fromBorderSide(BorderSide.none),
              shadowStrength: 5,
              color: Colors.white.withOpacity(0.8),
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: apps.length,
                  itemBuilder: (context, index) {
                    var app = apps[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
