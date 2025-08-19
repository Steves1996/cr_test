import 'package:auto_route/auto_route.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/features/home/ui/components/header_component.dart';
import 'package:cr/src/features/home/ui/components/rate_time_component.dart';
import 'package:cr/src/features/home/ui/widgets/rate_item.dart';
import 'package:cr/src/shared/components/forms/input.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

@RoutePage<void>()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HeaderComponent(onPressed: () {}),
              SizedBox(height: 10.h),
              RateTimeComponent(
                cryptoTime: '2025-08-19T00:00:03.302Z',
                fiat: '2025-08-19T04:30:30.335Z',
                currency: 'XAF',
                value: '651',
              ),
              SizedBox(height: 15.h),
              Input(
                labelColor: Colors.black,
                controller: _searchController,
                hintText: I18n.of(context).search,
                cursorColor: context.colorScheme.primary,
                fillColor: context.colorScheme.primary.withOpacity(0.0),
                style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(color: context.colorScheme.shadow),
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.text,
                filled: true,
                maxLines: 1,
                minLines: 1,
                prefixIcon: Icon(IconsaxPlusLinear.search_normal, color: context.colorScheme.primary, size: 20.sp),
              ),

              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return RateItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
