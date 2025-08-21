part of 'rate_cubit.dart';


@freezed
class RateState with _$RateState {
  factory RateState.initial() = _RateInitial;

  factory RateState.loading() = _RateLoading;

  factory RateState.success({required RatesResponse response}) = _RateSucess;

  factory RateState.failure({required String error}) = _RateFailed;
}