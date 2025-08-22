import 'package:auto_route/auto_route.dart';
import 'package:cr/src/core/global_logic/cubit/logout_cubit.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/profile/logic/cubit/profile_cubit.dart';
import 'package:cr/src/features/profile/ui/components/account_details_component.dart';
import 'package:cr/src/features/profile/ui/components/user_infos_component.dart';
import 'package:cr/src/shared/components/app_bar/custom_appbar.dart';
import 'package:cr/src/shared/components/buttons/button.dart';
import 'package:cr/src/shared/components/dialogs/custom_alert_dialog.dart';
import 'package:cr/src/shared/components/dialogs/dialog_builder.dart';
import 'package:cr/src/shared/components/toast.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:cr/src/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<void>()
class ProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LogoutCubit())],
      child: this,
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool logOut = false;
  @override
  void initState() {
    context.read<ProfileCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: I18n.of(context).profile,
        style: context.textTheme.titleMedium?.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: context.colorScheme.secondary,
        ),
        leadingButton: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: context.colorScheme.secondary),
        ),
        actions: [
          Visibility(
            visible: logOut,
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withOpacity(0.1)),
              child: IconButton(
                onPressed: () {
                  CustomAlertDialog.show(
                    context: context,
                    title: I18n.of(context).confirmation,
                    description: I18n.of(context).seeting_confirm_logout,
                    type: AlertType.info,
                    buttons: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          I18n.of(context).cancel,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colorScheme.primary,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          context.read<LogoutCubit>().logOut();
                        },
                        child: Text(
                          I18n.of(context).seeting_log_out,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                icon: Icon(Icons.logout, color: context.colorScheme.secondary),
              ),
            ),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              state.whenOrNull(
                loading: () => LoadingDialog.show(context: context),
                success: (response) {
                  LoadingDialog.hide(context: context);
                  context.router.replaceAll([const LoginRoute()]);
                },
                failure: (error) {
                  LoadingDialog.hide(context: context);
                  context.router.replaceAll([const LoginRoute()]);
                },
              );
            },
          ),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (_) {
                  setState(() {
                    LoadingDialog.hide(context: context);
                    logOut = true;
                  });
                },
                failure: (error) {
                  LoadingDialog.hide(context: context);
                  Toast.show(context: context, message: I18n.of(context).user_not_connected, type: ToastType.info);
                },
              );
            },
          ),
        ],
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (user) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UserInfosComponent(name: '${user.firstName} ${user.lastName}', email: user.emailAddress),
                      SizedBox(height: 15.h),
                      AccountDetailsComponent(
                        createdDate: Helpers().formatTimestampToDate(user.dateCreation!),
                        lastSessionDate: Helpers().formatTimestampToDate(user.dateUpdate!),
                        onPressed: () {
                          context.read<ProfileCubit>().getUserData();
                        },
                      ),
                      SizedBox(height: 20.h),
                      Button.primary(
                        title: I18n.of(context).edit_profile,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 14.sp),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'CryptoRates v1.0.0',
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontSize: 10.sp,
                            color: context.colorScheme.scrim,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
              failure: (error) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(visible: logOut, child: Text(I18n.of(context).error_loading_profile)),
                      SizedBox(height: 10.h),
                      Button.primary(
                        title: logOut ? I18n.of(context).try_again : I18n.of(context).login_login,
                        onPressed: () => logOut
                            ? context.read<ProfileCubit>().getUserData()
                            : context.router.replaceAll([const LoginRoute()]),
                      ),
                    ],
                  ),
                ),
              ),
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
