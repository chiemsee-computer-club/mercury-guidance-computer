import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mercury_guidance_computer/screens/export.dart';
import 'package:mercury_guidance_computer/screens/spotify/spotfy_playlist_screen.dart';
import 'package:mercury_guidance_computer/screens/spotify/spotify_screen.dart';
import 'package:spotify/spotify.dart';

var homeHandler = Handler(handlerFunc: (context, params) => const HomeScreen());
var settingsHandler = Handler(handlerFunc: (context, params) => const SettingsScreen());
var spotifyHandler = Handler(handlerFunc: (context, params) => const SpotifyScreen());
var spotifyPlaylistHandler = Handler(handlerFunc: (context, params) => SpotifyPlaylistScreen(ModalRoute.of(context!)!.settings.arguments as PlaylistSimple));