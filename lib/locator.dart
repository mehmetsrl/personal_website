import 'package:get_it/get_it.dart';
import 'services/data_storage_service.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => DataStorageService.generateDataService(DataServiceType.local));

  // locator.registerLazySingleton(() => AuthenticationService.generateAuth(AuthType.firebase));
  // locator.registerLazySingleton(() => DataStorageService.generateDataService(DataServiceType.firestore));
}
