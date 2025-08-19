import 'package:cr/generated/assets.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/core/theme/dimens.dart';
import 'package:cr/src/shared/components/dialogs/custom_alert_dialog.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:cr/src/shared/features/main_navigation/components/custom_drawer_header.dart';
import 'package:cr/src/shared/features/main_navigation/components/drawer_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerNavigation extends StatefulWidget {
  //final User? user;
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomDrawerHeader(fullName: 'Steves Kamdem', email: 'steveskamdem6@'),

              Text(
                'V 1.0',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
