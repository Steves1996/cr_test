part of 'splash_cubit.dart';


@freezed
class SplashState with _$SplashState {
  factory SplashState.initial() = _SplashInitial;

  factory SplashState.loading() = _SplashLoading;

  factory SplashState.success({required dynamic response}) = _SplashSucess;

  factory SplashState.failure({required String error}) = _SplashFailed;
}