import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfosComponent extends StatelessWidget {
  final String name;
  final String email;
  const UserInfosComponent({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45.r,
          backgroundColor: context.colorScheme.primaryContainer,
          child: Text(
            name[0].toUpperCase() + name[1].toUpperCase(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          name,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: FontWeight.w800,
            fontSize: 18.sp
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          email,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
