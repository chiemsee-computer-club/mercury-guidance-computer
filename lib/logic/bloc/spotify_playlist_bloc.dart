import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mercury_guidance_computer/services/spotify_service.dart';
import 'package:spotify/spotify.dart';

import '../../startup.dart';

part 'spotify_playlist_event.dart';
part 'spotify_playlist_state.dart';

class SpotifyPlaylistBloc
    extends Bloc<SpotifyPlaylistEvent, SpotifyPlaylistState> {
  SpotifyPlaylistBloc() : super(SpotifyPlaylistInitial()) {
    on<SpotifyPlaylistLoadEvent>((event, emit) async {
      emit(SpotifyPlaylistLoadingState());
      try {
        final spotifyService = getIt.get<SpotifyService>();
        final tracks = await spotifyService.loadTracksOfPlaylist(event.playlistId);
        emit(SpotifyPlaylistLoadedState(tracks));
      } catch (e) {
        emit(SpotifyPlaylistErrorState());
      }
    });
  }
}
