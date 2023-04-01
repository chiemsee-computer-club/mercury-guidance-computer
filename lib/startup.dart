import 'package:get_it/get_it.dart';
import 'package:mercury_guidance_computer/services/local_storage_service.dart';

final getIt = GetIt.instance;

void configureServices() {
  getIt.registerSingletonAsync<LocalStorageService>(() async => await LocalStorageService().initAsync());
}