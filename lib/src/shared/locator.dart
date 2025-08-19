import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() => AppRouter())
  ..registerLazySingleton(() => SecureStorage());
