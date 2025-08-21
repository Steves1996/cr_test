import 'package:auto_route/auto_route.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/features/home/logic/cubit/rate_cubit.dart';
import 'package:cr/src/features/home/logic/model/rates.model.dart';
import 'package:cr/src/features/home/ui/components/header_component.dart';
import 'package:cr/src/features/home/ui/components/rate_time_component.dart';
import 'package:cr/src/features/home/ui/modal/bottom_sheet_setting_modal.dart';
import 'package:cr/src/features/home/ui/widgets/rate_item.dart';
import 'package:cr/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:cr/src/shared/components/forms/input.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage<void>()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => RateCubit())],
      child: this,
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  List<MapEntry<String, double>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_filterData);
    // Déclencher le chargement des données
    context.read<RateCubit>().getRates();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterData);
    _searchController.dispose();
    super.dispose();
  }

  void _filterData() {
    // Cette méthode sera appelée lors du changement de texte dans le champ de recherche
    setState(() {});
  }

  List<MapEntry<String, double>> _getFilteredData(RatesResponse? response) {
    if (response == null) return [];

    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      return response.data.entries.toList();
    }

    return response.data.entries
        .where((entry) => entry.key.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RateCubit, RateState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (error) {
              ApiErrorDialog.show(context: context, error: error);
            },
          );
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  HeaderComponent(onPressed: () {
                    _showSettingsBottomSheet(context);
                  }),

                  SizedBox(height: 10.h),

                  state.whenOrNull(
                    success: (response) => RateTimeComponent(
                      cryptoTime: response.cryptoTime,
                      fiat: response.fiatTime,
                      currency: 'XAF',
                      value: '651',
                    ),
                  ) ?? RateTimeComponent(
                    cryptoTime: DateTime.now().toUtc().toIso8601String(),
                    fiat: DateTime.now().toUtc().toIso8601String(),
                    currency: 'XAF',
                    value: '651',
                  ),

                  SizedBox(height: 15.h),

                  Input(
                    labelColor: Colors.black,
                    controller: _searchController,
                    hintText: I18n.of(context).search,
                    cursorColor: context.colorScheme.primary,
                    fillColor: context.colorScheme.primary.withOpacity(0.05),
                    style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.shadow,
                    ),
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    filled: true,
                    maxLines: 1,
                    minLines: 1,
                    prefixIcon: Icon(
                      IconsaxPlusLinear.search_normal,
                      color: context.colorScheme.primary,
                      size: 20.sp,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Expanded(
                    child: state.when(
                      initial: () => _buildLoadingState(),
                      loading: () => _buildLoadingState(),
                      success: (response) => _buildSuccessState(response),
                      failure: (error) => _buildErrorState(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return  Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          return const RateItem(
          );
        },
      ),
    );
  }

  Widget _buildSuccessState(RatesResponse response) {
    final filteredData = _getFilteredData(response);

    if (filteredData.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<RateCubit>().getRates();
      },
      child: Skeletonizer(
        enabled: false,
        child: ListView.separated(
          itemCount: filteredData.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            final entry = filteredData[index];
            return RateItem(
              currency: entry.key,
              rate: entry.value.toString(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconsaxPlusLinear.warning_2,
            size: 64.sp,
            color: Colors.grey,
          ),
          SizedBox(height: 16.h),
          Text(
            I18n.of(context).error_during_loading,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton.icon(
            onPressed: () {
              context.read<RateCubit>().getRates();
            },
            icon: Icon(IconsaxPlusLinear.refresh, size: 20.sp),
            label:  Text(I18n.of(context).try_again),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconsaxPlusLinear.search_normal,
            size: 64.sp,
            color: Colors.grey,
          ),
          SizedBox(height: 16.h),
          Text(
            'Aucun résultat trouvé',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Essayez avec un autre terme de recherche',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomSheetSettingModal(),
        );
      },
    );
  }
}