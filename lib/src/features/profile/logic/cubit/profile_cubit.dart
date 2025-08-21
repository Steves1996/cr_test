import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SecureStorage _secureStorage;

  ProfileCubit({SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? locator<SecureStorage>(),
      super(ProfileState.initial());

  void getUserData() async {
    emit(ProfileState.loading());
    try {
      final response = await _secureStorage.getUser();
      emit(ProfileState.success(response: response!));
    } catch (error) {
      emit(ProfileState.failure(error: error.toString()));
    }
  }
}
