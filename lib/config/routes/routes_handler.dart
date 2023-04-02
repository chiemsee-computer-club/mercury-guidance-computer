import 'package:fluro/fluro.dart';
import 'package:mercury_guidance_computer/screens/export.dart';
import 'package:mercury_guidance_computer/screens/spotify/spotify_screen.dart';

var homeHandler = Handler(handlerFunc: (context, params) => const HomeScreen());
var settingsHandler = Handler(handlerFunc: (context, params) => const SettingsScreen());
var spotifyHandler = Handler(handlerFunc: (context, params) => const SpotifyScreen());