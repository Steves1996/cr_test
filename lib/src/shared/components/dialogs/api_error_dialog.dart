import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiErrorDialog {
  static void show({required BuildContext context, required String error}) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return AlertDialog.adaptive(
          content: Text(
            error,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.secondary, fontSize: 13.sp),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(I18n.of(context).okay),
            ),
          ],
        );
      },
    );
  }
}
