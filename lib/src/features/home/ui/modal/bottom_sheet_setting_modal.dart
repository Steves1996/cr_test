import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/core/theme/theme_logic/model/theme_state.dart';
import 'package:cr/src/core/theme/theme_logic/theme_bloc/theme_cubit.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:cr/src/shared/transalation/feature/widget/custom_language_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BottomSheetSettingModal extends StatelessWidget {
  const BottomSheetSettingModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: 80.w,
            child: Divider(thickness: 0.002.sh, color: context.colorScheme.scrim.withOpacity(0.3)),
          ),
          SizedBox(height: 10.h),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withOpacity(0.1)),
              child: Icon(IconsaxPlusLinear.profile, color: context.colorScheme.secondary),
            ),
            title: Text(
              I18n.of(context).profile,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.primary.withOpacity(0.1),
                  ),
                  child: Icon(state.isDarkMode ? Icons.light_mode : Icons.dark_mode, color: Colors.black),
                ),
                title: Text(
                  state.isDarkMode ? I18n.of(context).light_mode : I18n.of(context).dark_mode,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withOpacity(0.1)),
              child: Icon(IconsaxPlusLinear.flag, color: context.colorScheme.secondary),
            ),
            title: CustomLanguageDropdown(),
          ),
        ],
      ),
    );
  }
}
