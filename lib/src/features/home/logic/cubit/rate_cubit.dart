import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/auth/logic/repository/login.repository.dart';
import 'package:cr/src/features/home/logic/model/rates.model.dart';
import 'package:cr/src/features/home/logic/repository/home.repository.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_state.dart';
part 'rate_cubit.freezed.dart';

class RateCubit extends Cubit<RateState> {
  final HomeRepository _homeRepository;
  final SecureStorage _secureStorage;

  RateCubit({HomeRepository? homeRepository, SecureStorage? secureStorage})
    : _homeRepository = homeRepository ?? locator<HomeRepository>(),
      _secureStorage = secureStorage ?? locator<SecureStorage>(),
      super(RateState.initial());

  void getRates() async {
    emit(RateState.loading());
    try {
      final response = await _homeRepository.getRates();
      await _secureStorage.setRate(response);
      emit(RateState.success(response: response));
    } catch (error) {
      emit(RateState.failure(error: error.toString()));
    }
  }
}
