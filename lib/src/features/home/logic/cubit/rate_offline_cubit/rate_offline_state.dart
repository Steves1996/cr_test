part of 'rate_offline_cubit.dart';


@freezed
class RateOfflineState with _$RateOfflineState {
  factory RateOfflineState.initial() = _RateOfflineInitial;

  factory RateOfflineState.loading() = _RateOfflineLoading;

  factory RateOfflineState.success({required RatesResponse response}) = _RateOfflineSucess;

  factory RateOfflineState.failure({required String error}) = _RateOfflineFailed;
}