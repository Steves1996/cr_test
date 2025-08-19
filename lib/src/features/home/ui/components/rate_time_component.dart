import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:cr/src/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class RateTimeComponent extends StatelessWidget {
  final String cryptoTime;
  final String fiat;
  final String currency;
  final String value;
  const RateTimeComponent({
    super.key,
    required this.cryptoTime,
    required this.fiat,
    required this.currency,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.tertiary, width: 2.0),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.tertiary.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(IconsaxPlusLinear.timer_1, color: context.colorScheme.onSecondary),
                  SizedBox(width: 5.w),
                  Text(
                    I18n.of(context).rate_time_crypto,
                    style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.scrim, fontSize: 13.sp),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    Helpers().formatDateTime(cryptoTime),
                    style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.scrim, fontSize: 13.sp),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    I18n.of(context).rate_time_fiat,
                    style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.scrim, fontSize: 13.sp),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    Helpers().formatDateTime(fiat),
                    style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.scrim, fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                currency,
                style: context.textTheme.headlineMedium?.copyWith(fontSize: 14.sp, color: context.colorScheme.primary),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Divider(
                  thickness: 0.0012.sh,
                  color: context.colorScheme.primaryContainer,
                  indent: 5.w,
                  endIndent: 5.w,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                value,
                style: context.textTheme.headlineMedium?.copyWith(fontSize: 14.sp, color: context.colorScheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
