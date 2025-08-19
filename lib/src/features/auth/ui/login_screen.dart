import 'package:auto_route/auto_route.dart';
import 'package:cr/generated/assets.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/shared/components/buttons/button.dart';
import 'package:cr/src/shared/components/forms/input.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

@RoutePage<void>()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
  late TextEditingController _emailOrPhoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailOrPhoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 2.h,
                color: context.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(Assets.logosIcon, height: 90.h, width: 90.w),
                        SizedBox(height: 5.h),
                        Text(
                          I18n.of(context).app_title,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineLarge?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 28.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          I18n.of(context).login_sign_in_to_crypto_rates,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            color: context.colorScheme.scrim,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Input(
                          labelColor: Colors.black,
                          controller: _emailOrPhoneController,
                          labelText: I18n.of(context).login_email,
                          hintText: I18n.of(context).login_email,
                          cursorColor: context.colorScheme.primary,
                          fillColor: context.colorScheme.primary.withOpacity(0.0),
                          style: Theme.of(
                            context,
                          ).primaryTextTheme.bodyLarge?.copyWith(color: context.colorScheme.shadow),
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          filled: true,
                          maxLines: 1,
                          minLines: 1,
                          validator: Validators.required(I18n.of(context).empty_field),
                        ),
                        SizedBox(height: 8.h),
                        Input(
                          controller: _passwordController,
                          isPassword: _isPasswordVisible,
                          labelColor: Colors.black,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible ? IconsaxPlusBold.eye_slash : IconsaxPlusBold.eye,
                              color: context.colorScheme.primary,
                              size: 24.sp,
                            ),
                          ),
                          validator: Validators.required(I18n.of(context).empty_field),
                          labelText: I18n.of(context).login_password,
                          hintText: I18n.of(context).login_password,
                          cursorColor: context.colorScheme.primary,
                          fillColor: context.colorScheme.primary.withOpacity(0.0),
                          style: Theme.of(
                            context,
                          ).primaryTextTheme.bodyLarge?.copyWith(color: context.colorScheme.shadow),
                          filled: true,
                          textCapitalization: TextCapitalization.none,
                          maxLines: 1,
                          minLines: 1,
                        ),
                        SizedBox(height: 20.h),
                        Button.primary(
                          title: I18n.of(context).login_login,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 14.sp),
                          onPressed: ()=>context.router.push(HomeRoute()),
                        ),
                        SizedBox(height: 10.h),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            I18n.of(context).login_forgot_password,
                            style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.primary,
                              fontWeight: FontWeight.w600,),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(thickness: 0.001.sh, color: context.colorScheme.primaryContainer),
                        SizedBox(height: 5.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: I18n.of(context).login_dont_have_account,
                                style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.scrim),
                              ),
                              TextSpan(
                                text: I18n.of(context).login_sign_up,
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Privacy Policy"');
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
