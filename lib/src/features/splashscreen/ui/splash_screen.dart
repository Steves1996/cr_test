import 'package:cr/generated/assets.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/core/theme/dimens.dart';
import 'package:cr/src/core/theme/theme_logic/model/theme_state.dart';
import 'package:cr/src/core/theme/theme_logic/theme_bloc/theme_cubit.dart';
import 'package:cr/src/features/splashscreen/logic/cubit/splash_cubit.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage<void>()
class SplashScreen extends StatefulWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SplashCubit())],
      child: this,
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    context.read<SplashCubit>().verifyUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocListener(
        listeners: [
          BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (response) {
                  Future.delayed(const Duration(seconds: 5), () {
                    context.router.replaceAll([const HomeRoute()]);
                  });
                },
                failure: (error) {
                  Future.delayed(const Duration(seconds: 5), () {
                    context.router.replaceAll([const LoginRoute()]);
                  });
                },
              );
            },
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.logosLogo,
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                const SizedBox(height: Dimens.doubleSpacing),
                Center(
                  child: LoadingAnimationWidget.discreteCircle(
                    color: context.colorScheme.primary,
                    secondRingColor: context.colorScheme.onPrimary,
                    size: 30,
                  ),
                ),

                ///test my dark and light mode

                /*Text('text color',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: context.colorScheme.onPrimary),),
              */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
