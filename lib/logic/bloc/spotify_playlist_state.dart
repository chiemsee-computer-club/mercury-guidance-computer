part of 'spotify_playlist_bloc.dart';

@immutable
abstract class SpotifyPlaylistState {}

class SpotifyPlaylistInitial extends SpotifyPlaylistState {}

class SpotifyPlaylistLoadingState extends SpotifyPlaylistState {}

class SpotifyPlaylistErrorState extends SpotifyPlaylistState {}

class SpotifyPlaylistLoadedState extends SpotifyPlaylistState {
  final Iterable<Track>? tracks;

  SpotifyPlaylistLoadedState(this.tracks);
}
