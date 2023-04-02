import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:mercury_guidance_computer/services/local_storage_service.dart';
import 'package:mercury_guidance_computer/services/spotify_service.dart';

import 'config/routes/export.dart';

final getIt = GetIt.instance;

void configureServices() {
  getIt.registerSingletonAsync<LocalStorageService>(() async => await LocalStorageService().initAsync());
  getIt.registerSingleton<RoutingService>(RoutingService());
  getIt.registerSingleton(SpotifyService());
}