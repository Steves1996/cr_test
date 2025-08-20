import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/auth/logic/repository/login.repository.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  final SecureStorage _secureStorage;

  LoginCubit({LoginRepository? loginRepository, SecureStorage? secureStorage})
    : _loginRepository = loginRepository ?? locator<LoginRepository>(),
      _secureStorage = secureStorage ?? locator<SecureStorage>(),
      super(LoginState.initial());

  void login(LoginRequest request) async {
    emit(LoginState.loading());
    try {
      final response = await _loginRepository.login(request: request);
      await _secureStorage.setAccessToken(response.token);
      await _secureStorage.setRefreshToken(response.refreshToken);
      await _secureStorage.setUser(response.data);
      await _secureStorage.setUserId('${response.data.userId}');
      emit(LoginState.success(response: response));
    } catch (error) {
      emit(LoginState.failure(error: error.toString()));
    }
  }
}
