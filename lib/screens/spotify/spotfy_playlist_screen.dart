import 'dart:ui';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury_guidance_computer/logic/bloc/spotify_playlist_bloc.dart';
import 'package:spotify/spotify.dart';

class SpotifyPlaylistScreen extends StatelessWidget {
  final PlaylistSimple playlist;

  const SpotifyPlaylistScreen(this.playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          80,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              title: Row(
                children: [
                  SvgPicture.asset(
                    "assets/apps/spotify/logo.svg",
                    height: 60,
                  )
                ],
              ),
              automaticallyImplyLeading: false,
              centerTitle: false,
              toolbarHeight: 80,
              actions: const [
                Center(
                  child: Text(
                    "Playlists",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Text(
                    "Browse",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.9),
              foregroundColor: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => SpotifyPlaylistBloc()
                ..add(SpotifyPlaylistLoadEvent(playlist.id ?? "No name")),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<SpotifyPlaylistBloc, SpotifyPlaylistState>(
                  builder: (context, state) {
                    if (state is SpotifyPlaylistLoadedState) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 120),
                        itemCount: state.tracks?.length ?? 0,
                        itemBuilder: (context, index) {
                          final track = state.tracks!.elementAt(index);
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Material(
                                color: Colors.grey[200],
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              track.name ?? "No name",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              track.artists?.first.name ??
                                                  "No artist name",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.play_arrow_rounded,
                                          color: Colors.grey[700],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: 120,
                color: Colors.white.withOpacity(0.7),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FastCachedImage(
                          url: playlist.images!.elementAt(0).url!,
                          width: 90,
                          height: 90,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playlist.name ?? "No name",
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "By ${playlist.owner?.displayName ?? "No owner"}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 40,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Play",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.play_arrow_rounded,
                                  size: 40,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
