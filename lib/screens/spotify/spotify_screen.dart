import 'dart:ui';

import 'package:asset_cache/asset_cache.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury_guidance_computer/logic/bloc/spotify_my_playlists_bloc.dart';
import 'package:mercury_guidance_computer/startup.dart';
import 'package:mercury_guidance_computer/utils/extensions/context_extensions.dart';

import '../../config/routes/routing_service.dart';

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpotifyMyPlaylistsBloc()
        ..add(
          SpotifyMyPlaylistsLoadEvent(),
        ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            80,
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AppBar(
                title: SvgPicture.asset(
                  "assets/apps/spotify/logo.svg",
                  height: 60,
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
        body: Container(
          child: BlocBuilder<SpotifyMyPlaylistsBloc, SpotifyMyPlaylistsState>(
            builder: (context, state) {
              if (state is SpotifyMyPlaylistsLoadingState) {
                return const CupertinoActivityIndicator();
              }

              if (state is SpotifyMyPlaylistsErrorState) {
                return Container();
              }

              if (state is SpotifyMyPlaylistsLoadedState) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.myPlaylists.length,
                  itemBuilder: (context, index) {
                    var playlist = state.myPlaylists.elementAt(index);
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          final playlistId = playlist.id;
                          if (playlistId != null) {
                            final routingService = getIt.get<RoutingService>();
                            routingService.navigateTo("/spotify/playlist",
                                arguments: playlist);
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Builder(
                              builder: (builder) {
                                if (playlist.images != null &&
                                    playlist.images!.isNotEmpty &&
                                    playlist.images!.first.url != null) {
                                  final imageUrl = playlist.images!.first.url!;

                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: FastCachedImage(
                                      url: imageUrl,
                                      width: 220,
                                      height: 220,
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: 220,
                                    height: 220,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.grey[300]),
                                  );
                                }
                              },
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              width: 220,
                              child: Text(
                                playlist.name ?? "No name",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
