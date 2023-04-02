import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury_guidance_computer/logic/bloc/spotify_my_playlists_bloc.dart';
import 'package:mercury_guidance_computer/utils/extensions/context_extensions.dart';

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpotifyMyPlaylistsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            "assets/apps/spotify/logo.svg",
            height: 40,
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: const [
            Text(
              "My Playlists",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Browse",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 35,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
