part of 'spotify_playlist_bloc.dart';

@immutable
abstract class SpotifyPlaylistEvent {}

class SpotifyPlaylistLoadEvent implements SpotifyPlaylistEvent {
  final String playlistId;
  
  SpotifyPlaylistLoadEvent(this.playlistId);
}
