

import 'package:spotify/spotify.dart';

class SpotifyService {
  late SpotifyApi _spotifyClient;

  SpotifyService() {
    _spotifyClient = SpotifyApi.withAccessToken("BQDlX8rsFDLp9YhRLn44qxO7kMpBW129L8d4go40LHr6jGZjapa5Uv8N2RFA8MMgTrXUzGs9haI-WrnTlYLDw4msAI36HB2OBFnhjzCrIWNQpEjpbvlSNX6HcIBMq6rtHo0DvV4xmBhHl_9DCiu13bkXKFKdYNmXmJe39fhfRJTl2pkBwMuUgAkuhBfUuDQlTS1xXbvxUdP33usZgCGnn1u8RqyhnqWhIjJVmRpZRO37WO6tum3EBUr_ylgNEosXC33D2Bs5l9poH1LgLJbbmAbDzf54PWo-XnI2c_J1QpjX6_DevmDJYPvlpMMURPHTpae8fyWlSA");
  }


  Future<Iterable<PlaylistSimple>> getMyPlaylists() async {
    var myPlaylists = _spotifyClient.playlists.me;
    return await myPlaylists.all();
  }
}