import 'dart:async';
import 'package:cr/src/core/service/dio_service.dart';
import 'package:cr/src/core/service/exceptions.dart';
import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/home/logic/model/rates.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

// Configuration du logger
final _logger = Logger(printer: PrettyPrinter());

class HomeRepository {
  final DioService _dioService;

  HomeRepository({DioService? dioService})
    : _dioService = dioService ?? DioService.withBaseUrl(dotenv.env['URL_RATE'] ?? '');

  Future<RatesResponse> getRates() async {
    final stopwatch = Stopwatch()..start();
    try {
      _logger.i("Starting  request to: ");
      final response = await _dioService.dio
          .get('', options: Options(headers: {'Content-Type': 'application/json', 'Accept': '*/*'}))
          .timeout(const Duration(seconds: 30));
      _logger.i(" request completed in ${stopwatch.elapsedMilliseconds}ms");
      RatesResponse responseData = RatesResponse.fromJson(response.data);
      return responseData;
    } on TimeoutException catch (_) {
      _logger.f(" request timeout after 30s");
      throw TimeoutException(" request took too long");
    } on DioException catch (e) {
      _logger.f("Dio error during : ${e.message}\nResponse: ${e.response?.data}");
      throw handleDioError(e);
    } catch (e, stacktrace) {
      _logger.f("Unexpected error during : $e\nStacktrace: $stacktrace");
      throw BadRequestException(message: "Unexpected error occurred during : $e");
    } finally {
      stopwatch.stop();
    }
  }

  String getControllerName() => '';
}
