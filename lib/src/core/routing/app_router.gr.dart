// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainNavigationRouter.name: (routeData) {
      return AutoRoutePage<void>(
        routeData: routeData,
        child: WrappedRoute(child: const MainNavigationWrapper()),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<void>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [MainNavigationWrapper]
class MainNavigationRouter extends PageRouteInfo<void> {
  const MainNavigationRouter({List<PageRouteInfo>? children})
      : super(
          MainNavigationRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
