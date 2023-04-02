

import 'package:spotify/spotify.dart';

class SpotifyService {
  late SpotifyApi _spotifyClient;

  SpotifyService() {
    _spotifyClient = SpotifyApi.withAccessToken("accessToken");
  }


  Future<Iterable<PlaylistSimple>> getMyPlaylists() async {
    var myPlaylists = _spotifyClient.playlists.me;
    return await myPlaylists.all();
  }

  Future<Iterable<Track>?> loadTracksOfPlaylist(String playlistId) async {
    final tracks =_spotifyClient.playlists.getTracksByPlaylistId(playlistId);
    return await tracks.all();
  }
}