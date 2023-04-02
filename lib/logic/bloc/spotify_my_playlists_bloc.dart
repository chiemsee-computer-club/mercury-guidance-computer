import 'package:bloc/bloc.dart';
import 'package:mercury_guidance_computer/services/spotify_service.dart';
import 'package:meta/meta.dart';
import 'package:spotify/spotify_browser.dart';

import '../../startup.dart';

part 'spotify_my_playlists_event.dart';
part 'spotify_my_playlists_state.dart';

class SpotifyMyPlaylistsBloc
    extends Bloc<SpotifyMyPlaylistsEvent, SpotifyMyPlaylistsState> {
  SpotifyMyPlaylistsBloc() : super(SpotifyMyPlaylistsInitial()) {
    on<SpotifyMyPlaylistsLoadEvent>((event, emit) async {
      emit(SpotifyMyPlaylistsLoadingState());

      try {
        var spotifyService = getIt.get<SpotifyService>();
        var myPlaylists = await spotifyService.getMyPlaylists();
        emit(SpotifyMyPlaylistsLoadedState(myPlaylists));
      } catch (e) {
        emit(SpotifyMyPlaylistsErrorState());
      }
    });
  }
}
