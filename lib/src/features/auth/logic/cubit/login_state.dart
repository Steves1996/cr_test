part of 'login_cubit.dart';


@freezed
class LoginState with _$LoginState {
  factory LoginState.initial() = _LoginInitial;

  factory LoginState.loading() = _LoginLoading;

  factory LoginState.success({required LoginResponse response}) = _LoginSucess;

  factory LoginState.failure({required String error}) = _LoginFailed;
}