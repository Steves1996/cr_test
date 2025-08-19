import 'package:cr/src/core/cr.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HeaderComponent extends StatelessWidget {
  final VoidCallback onPressed;
  const HeaderComponent({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                I18n.of(context).app_title,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: context.colorScheme.primary,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                I18n.of(context).header_real_time_exchange,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: context.colorScheme.scrim,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withOpacity(0.1)),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(IconsaxPlusLinear.setting, color: context.colorScheme.primary, size: 24.sp),
          ),
        ),
      ],
    );
  }
}
