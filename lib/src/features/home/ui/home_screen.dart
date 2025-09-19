import 'package:auto_route/auto_route.dart';
import 'package:cr/src/core/global_logic/check_internet_logic/cubit/check_internet_cubit.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/features/home/logic/cubit/rate_cubit.dart';
import 'package:cr/src/features/home/logic/cubit/rate_offline_cubit/rate_offline_cubit.dart';
import 'package:cr/src/features/home/logic/model/rates.model.dart';
import 'package:cr/src/features/home/ui/components/header_component.dart';
import 'package:cr/src/features/home/ui/components/rate_time_component.dart';
import 'package:cr/src/features/home/ui/modal/bottom_sheet_setting_modal.dart';
import 'package:cr/src/features/home/ui/widgets/rate_item.dart';
import 'package:cr/src/features/profile/logic/cubit/profile_cubit.dart';
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
      providers: [
        BlocProvider(create: (_) => RateCubit()),
        BlocProvider(create: (_) => RateOfflineCubit()),
      ],
      child: this,
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  List<MapEntry<String, double>> _filteredData = [];
  double? currentRate;
  String currentCurrency = 'XAF';
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_filterData);

    context.read<ProfileCubit>().getUserData();

    _checkInternetAndLoadRates();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterData);
    _searchController.dispose();
    super.dispose();
  }

  void _checkInternetAndLoadRates() {
    context.read<CheckInternetCubit>().checkInternet();
  }

  void _filterData() {
    setState(() {});
  }

  void _updateCurrentRate(RatesResponse? response) {
    if (response == null) return;

    final currencyEntry = response.data.entries.where((entry) => entry.key == currentCurrency).firstOrNull;

    if (currencyEntry != null) {
      setState(() {
        currentRate = currencyEntry.value;
      });
    } else {
      setState(() {
        currentRate = null;
      });
    }
  }

  List<MapEntry<String, double>> _getFilteredData(RatesResponse? response) {
    if (response == null) return [];

    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      return response.data.entries.toList();
    }

    return response.data.entries.where((entry) => entry.key.toLowerCase().contains(query)).toList();
  }

  void _handleOfflineMode() {
    setState(() {
      _isOffline = true;
    });
    context.read<RateOfflineCubit>().getOffLineRates();
  }

  void _handleOnlineMode() {
    setState(() {
      _isOffline = false;
    });

    context.read<RateCubit>().getRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<CheckInternetCubit, CheckInternetState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (hasInternet) {
                  if (hasInternet) {
                    _handleOnlineMode();
                  } else {
                    _handleOfflineMode();
                  }
                },
                failure: (error) {
                  _handleOfflineMode();
                },
              );
            },
          ),
          BlocListener<RateCubit, RateState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (response) {
                  _updateCurrentRate(response);
                },
                failure: (error) {
                  ApiErrorDialog.show(context: context, error: error);
                  _handleOfflineMode();
                },
              );
            },
          ),
          BlocListener<RateOfflineCubit, RateOfflineState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (response) {
                  _updateCurrentRate(response);
                },
                failure: (error) {
                  ApiErrorDialog.show(context: context, error: error);
                },
              );
            },
          ),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (userProfile) {
                  setState(() {
                    currentCurrency = userProfile.fiatCurrencyCode ?? 'XAF';
                  });

                  if (mounted) {
                    _checkInternetAndLoadRates();
                  }
                },
                failure: (error) {
                  setState(() {
                    currentCurrency = 'XAF';
                  });
                  _checkInternetAndLoadRates();
                },
              );
            },
          ),
        ],
        child: _buildMainContent(),
      ),
    );
  }

  Widget _buildMainContent() {
    return BlocBuilder<RateCubit, RateState>(
      builder: (context, onlineState) {
        return BlocBuilder<RateOfflineCubit, RateOfflineState>(
          builder: (context, offlineState) {
            // Déterminer quel état utiliser basé sur le mode
            final currentState = _isOffline ? offlineState : onlineState;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Header avec indicateur de statut
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, profileState) {
                        return Column(
                          children: [
                            HeaderComponent(
                              onPressed: () {
                                _showSettingsBottomSheet(context);
                              },
                            ),
                            if (_isOffline) _buildOfflineIndicator(),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 10.h),

                    // Rate Time Component
                    _buildRateTimeComponent(currentState),

                    SizedBox(height: 15.h),

                    // Search Input
                    Input(
                      labelColor: Colors.black,
                      controller: _searchController,
                      hintText: I18n.of(context).search,
                      cursorColor: context.colorScheme.primary,
                      fillColor: context.colorScheme.primary.withOpacity(0.05),
                      style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(color: context.colorScheme.shadow),
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

                    // Main Content
                    Expanded(child: _buildStateContent(currentState)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOfflineIndicator() {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(IconsaxPlusLinear.wifi_square, size: 16.sp, color: Colors.orange),
          SizedBox(width: 6.w),
          Text(
            I18n.of(context).no_internet_connection,
            style: TextStyle(fontSize: 12.sp, color: Colors.orange[700], fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildRateTimeComponent(dynamic state) {
    return state.whenOrNull(
          success: (response) => RateTimeComponent(
            cryptoTime: response.cryptoTime,
            fiat: response.fiatTime,
            currency: currentCurrency,
            value: currentRate?.toString() ?? '0',
          ),
        ) ??
        RateTimeComponent(
          cryptoTime: DateTime.now().toUtc().toIso8601String(),
          fiat: DateTime.now().toUtc().toIso8601String(),
          currency: currentCurrency,
          value: currentRate?.toString() ?? '0',
        );
  }

  Widget _buildStateContent(dynamic state) {
    return state.when(
      initial: () => _buildLoadingState(),
      loading: () => _buildLoadingState(),
      success: (response) => _buildSuccessState(response),
      failure: (error) => _buildErrorState(),
    );
  }

  Widget _buildLoadingState() {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          return const RateItem();
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
        if (_isOffline) {
          context.read<RateOfflineCubit>().getOffLineRates();
        } else {
          context.read<RateCubit>().getRates();
        }
      },
      child: Skeletonizer(
        enabled: false,
        child: ListView.separated(
          itemCount: filteredData.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            final entry = filteredData[index];
            if (entry.key == currentCurrency) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    currentRate = entry.value;
                  });
                }
              });
            }

            return RateItem(
              currency: entry.key,
              rate: entry.value.toString(),
              isSelected: entry.key == currentCurrency,
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
          Icon(IconsaxPlusLinear.warning_2, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            I18n.of(context).error_during_loading,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          if (_isOffline)
            Text(
              I18n.of(context).offline_data_not_available,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 24.h),
          ElevatedButton.icon(
            onPressed: () {
              _checkInternetAndLoadRates();
            },
            icon: Icon(IconsaxPlusLinear.refresh, size: 20.sp),
            label: Text(I18n.of(context).try_again),
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
          Icon(IconsaxPlusLinear.search_normal, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            I18n.of(context).no_result_for_search,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
          SizedBox(height: 8.h),
          Text(
            I18n.of(context).try_another_search,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return const ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: BottomSheetSettingModal(),
        );
      },
    );
  }
}
