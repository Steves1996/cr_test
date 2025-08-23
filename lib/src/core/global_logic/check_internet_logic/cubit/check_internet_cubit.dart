import 'dart:async';
import 'package:cr/src/core/global_logic/check_internet_logic/repository/check_internet_repository.dart';
import 'package:cr/src/shared/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_internet_state.dart';
part 'check_internet_cubit.freezed.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  final CheckInternetRepository _checkInternetRepository;
  Timer? _timer;

  CheckInternetCubit({CheckInternetRepository? checkInternetRepository})
    : _checkInternetRepository = checkInternetRepository ?? locator<CheckInternetRepository>(),
      super(CheckInternetState.initial()) {
    startInternetCheck();
  }

  void startInternetCheck() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds:150), (_) => checkInternet());
  }

  Future<void> checkInternet() async {
    emit(CheckInternetState.loading());
    try {
      final response = await _checkInternetRepository.checkInternetConnection();
      emit(CheckInternetState.success(response: response));
    } catch (error) {
      emit(CheckInternetState.failure(error: error.toString()));
    }
  }

  void manualCheck() => checkInternet();

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
