import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/auth/logic/repository/login.repository.dart';
import 'package:cr/src/features/home/logic/model/rates.model.dart';
import 'package:cr/src/features/home/logic/repository/home.repository.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_offline_state.dart';
part 'rate_offline_cubit.freezed.dart';

class RateOfflineCubit extends Cubit<RateOfflineState> {
  final SecureStorage _secureStorage;

  RateOfflineCubit({HomeRepository? homeRepository, SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? locator<SecureStorage>(),
      super(RateOfflineState.initial());

  void getOffLineRates() async {
    emit(RateOfflineState.loading());
    try {
      final response = await _secureStorage.getRate();
      emit(RateOfflineState.success(response: response!));
    } catch (error) {
      emit(RateOfflineState.failure(error: error.toString()));
    }
  }
}
