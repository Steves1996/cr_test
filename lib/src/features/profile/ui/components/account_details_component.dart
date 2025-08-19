import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AccountDetailsComponent extends StatelessWidget {
  final String createdDate;
  final String lastSessionDate;
  final VoidCallback onPressed;
  const AccountDetailsComponent({
    super.key,
    required this.createdDate,
    required this.lastSessionDate,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.scrim),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(IconsaxPlusLinear.setting, color: context.colorScheme.primary),
              SizedBox(width: 8.h),
              Text(
                I18n.of(context).account_details,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.secondary,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withOpacity(0.1)),
                child: IconButton(onPressed: onPressed, icon: Icon(Icons.refresh,color: context.colorScheme.secondary)),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(IconsaxPlusLinear.calendar, color: context.colorScheme.scrim),
            title: Text(
              I18n.of(context).member_since,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              I18n.of(context).account_create,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              createdDate,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Divider(thickness: 0.001.sh, color: context.colorScheme.secondary),
          SizedBox(height: 5.h),
          ListTile(
            leading: Icon(IconsaxPlusLinear.timer_1, color: context.colorScheme.scrim),
            title: Text(
              I18n.of(context).last_login,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              I18n.of(context).session_recent,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              lastSessionDate,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
