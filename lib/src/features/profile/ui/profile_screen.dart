import 'package:auto_route/auto_route.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/features/profile/ui/components/account_details_component.dart';
import 'package:cr/src/features/profile/ui/components/user_infos_component.dart';
import 'package:cr/src/shared/components/app_bar/custom_appbar.dart';
import 'package:cr/src/shared/components/buttons/button.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<void>()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withOpacity(0.1)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout, color: context.colorScheme.secondary),
            ),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserInfosComponent(name: 'Steves Kamdem', email: 'steveskamdem6@gmail.com'),
              SizedBox(height: 15.h),
              AccountDetailsComponent(
                createdDate: 'March 15, 2024',
                lastSessionDate: 'Today at 2:30 PM',
                onPressed: () {},
              ),
              SizedBox(height: 20.h),
              Button.primary(
                title: I18n.of(context).edit_profile,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 14.sp),
                onPressed: (){},
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'CryptoRates v1.0.0',
                  style: context.textTheme.headlineMedium?.copyWith(fontSize: 10.sp, color: context.colorScheme.scrim),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
