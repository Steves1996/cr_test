part of 'check_internet_cubit.dart';


@freezed
class CheckInternetState with _$CheckInternetState {
  factory CheckInternetState.initial() = _CheckInternetInitial;

  factory CheckInternetState.loading() = _CheckInternetLoading;

  factory CheckInternetState.success({required bool response}) = _CheckInternetSucess;

  factory CheckInternetState.failure({required String error}) = _CheckInternetFailed;
}