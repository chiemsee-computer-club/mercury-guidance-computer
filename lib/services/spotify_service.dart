import 'package:spotify/spotify_browser.dart';

class SpotifyService {
  late SpotifyApi _spotifyClient;

  late User _me;

  

  SpotifyService(String clientId, String clientSecret) {
    var apiCredentials = SpotifyApiCredentials(clientId, clientSecret);
    _spotifyClient = SpotifyApi(apiCredentials);
  }

  Future initAsync() async {
    _me = await _spotifyClient.me.get();
  }


  Future<Iterable<PlaylistSimple>> getMyPlaylists() async {
    var myPlaylists = _spotifyClient.playlists.me;
    return await myPlaylists.all();
  }
}