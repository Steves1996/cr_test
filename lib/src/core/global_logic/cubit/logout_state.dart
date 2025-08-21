part of 'logout_cubit.dart';


@freezed
class LogoutState with _$LogoutState {
  factory LogoutState.initial() = _LogoutInitial;

  factory LogoutState.loading() = _LogoutLoading;

  factory LogoutState.success({required dynamic response}) = _LogoutSucess;

  factory LogoutState.failure({required String error}) = _LogoutFailed;
}