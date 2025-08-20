import 'dart:async';
import 'package:cr/src/core/service/dio_service.dart';
import 'package:cr/src/core/service/exceptions.dart';
import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// Configuration du logger
final _logger = Logger(printer: PrettyPrinter());

class LoginRepository {
  final DioService _dioService;

  LoginRepository({DioService? dioService}) : _dioService = dioService ?? DioService.createNewInstance();

  Future<LoginResponse> login({required LoginRequest request}) async {
    final url = '${getControllerName()}v2/auth/login';
    final stopwatch = Stopwatch()..start();
    try {
      _logger.i("Starting $url request to: $url");
      final response = await _dioService.dio.post(url, data: request.toJson()).timeout(const Duration(seconds: 30));
      _logger.i("$url request completed in ${stopwatch.elapsedMilliseconds}ms");
      LoginResponse responseData = LoginResponse.fromJson(response.data);
      return responseData;
    } on TimeoutException catch (_) {
      _logger.f("$url request timeout after 30s");
      throw TimeoutException("$url request took too long");
    } on DioException catch (e) {
      _logger.f("Dio error during $url: ${e.message}\nResponse: ${e.response?.data}");
      throw handleDioError(e);
    } catch (e, stacktrace) {
      _logger.f("Unexpected error during $url: $e\nStacktrace: $stacktrace");
      throw BadRequestException(message: "Unexpected error occurred during $url: $e");
    } finally {
      stopwatch.stop();
    }
  }

  String getControllerName() => '';
}
