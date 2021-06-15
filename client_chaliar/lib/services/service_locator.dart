import 'package:client_chaliar/services/auth.dart';
import 'package:client_chaliar/services/fire_store_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerFactory<FirestoreService>(() => FirestoreService());
  locator.registerFactory<AuthenticationService>(() => AuthenticationService());
}
