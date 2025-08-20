import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/auth/logic/repository/login.repository.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  final SecureStorage _secureStorage;

  SplashCubit({SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? locator<SecureStorage>(),
      super(SplashState.initial());

  void verifyUserLogin() async {
    emit(SplashState.loading());
    try {
      final response = await _secureStorage.getAccessToken();
      emit(SplashState.success(response: response));
    } catch (error) {
      emit(SplashState.failure(error: error.toString()));
    }
  }
}
