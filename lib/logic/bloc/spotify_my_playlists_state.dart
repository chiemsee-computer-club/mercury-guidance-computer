part of 'spotify_my_playlists_bloc.dart';

@immutable
abstract class SpotifyMyPlaylistsState
{

}

class SpotifyMyPlaylistsInitial extends SpotifyMyPlaylistsState
{

}

class SpotifyMyPlaylistsLoadingState extends SpotifyMyPlaylistsState
{
  
}

class SpotifyMyPlaylistsErrorState extends SpotifyMyPlaylistsState
{
  
}

class SpotifyMyPlaylistsLoadedState extends SpotifyMyPlaylistsState
{
  final Iterable<PlaylistSimple> myPlaylists;

  SpotifyMyPlaylistsLoadedState(this.myPlaylists);
}
