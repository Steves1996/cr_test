
import 'package:auto_route/auto_route.dart';
import 'package:cr/src/features/auth/ui/login_screen.dart';
import 'package:cr/src/features/home/ui/home_screen.dart';
import 'package:cr/src/features/profile/ui/profile_screen.dart';
import 'package:cr/src/features/splashscreen/ui/splash_screen.dart';
import 'package:cr/src/shared/features/main_navigation/ui/main_navigation_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: ProfileRoute.page),

  ];
}
