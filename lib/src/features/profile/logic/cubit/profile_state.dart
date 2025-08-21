part of 'profile_cubit.dart';


@freezed
class ProfileState with _$ProfileState {
  factory ProfileState.initial() = _ProfileInitial;

  factory ProfileState.loading() = _ProfileLoading;

  factory ProfileState.success({required LoginData response}) = _ProfileSucess;

  factory ProfileState.failure({required String error}) = _ProfileFailed;
}