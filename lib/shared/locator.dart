import 'package:get_it/get_it.dart';
import 'package:order_tracking/repo/authentication_repo.dart';

final serviceLocator = GetIt.instance;

Future<void> locatorSetUp() async {
  serviceLocator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
}
