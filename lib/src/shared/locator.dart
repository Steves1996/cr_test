import 'package:cr/src/core/global_logic/check_internet_logic/repository/check_internet_repository.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/features/auth/logic/repository/login.repository.dart';
import 'package:cr/src/features/home/logic/repository/home.repository.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() => AppRouter())
  ..registerLazySingleton(() => LoginRepository())
  ..registerLazySingleton(() => HomeRepository())
  ..registerLazySingleton(() => CheckInternetRepository())
  ..registerLazySingleton(() => SecureStorage());
