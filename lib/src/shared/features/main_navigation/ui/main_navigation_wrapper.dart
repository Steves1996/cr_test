import 'package:cr/src/core/configuration.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/core/service/local_storage_bloc/not_login_cubit/not_login_cubit.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:cr/src/shared/features/main_navigation/components/bottom_nav_bar.dart';
import 'package:cr/src/shared/features/main_navigation/ui/drawer_navigation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

@RoutePage<void>(name: 'MainNavigationRouter')
class MainNavigationWrapper extends StatefulWidget implements AutoRouteWrapper {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NotLoginCubit())],
      child: this,
    );
  }
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  //User? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // context.read<NotLoginCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotLoginCubit, NotLoginState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (response) {
                setState(() {
                  //_user = response;
                  _isLoading = false;
                });
              },
              failure: (error) {
                setState(() {
                  //_user = null;
                  _isLoading = false;
                });
              },
              loading: () {
                setState(() {
                  _isLoading = true;
                });
              },
            );
          },
        ),
      ],
      child: _buildScaffold(),
    );
  }

  Widget _buildScaffold() {
    if (!_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return AutoTabsScaffold(
      scaffoldKey: Configuration.drawerScaffoldKey,
      //drawer: _user != null ? DrawerNavigation(user: _user!) : DrawerNavigation(),
      drawer: DrawerNavigation(),
      appBarBuilder: (context, tabsRouter) => AppBar(
        toolbarHeight: 0,
        //automaticallyImplyLeading: _user != null,
        systemOverlayStyle: context.theme.appBarTheme.systemOverlayStyle?.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: _getStatusBarBrightness(context),
        ),
      ),
      routes: const [],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavBar(
          activePageIndex: tabsRouter.activeIndex,
          icons: const [
            IconsaxPlusLinear.home_1,
            IconsaxPlusLinear.shopping_cart,
            IconsaxPlusLinear.folder_favorite,
            IconsaxPlusLinear.setting,
          ],
          onItemTap: (value) => tabsRouter.setActiveIndex(value),
        );
      },
    );
  }

  Brightness _getStatusBarBrightness(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      switch (context.platformBrightness) {
        case Brightness.light:
          return Brightness.dark;
        case Brightness.dark:
          return Brightness.light;
      }
    }
    return context.platformBrightness;
  }
}
