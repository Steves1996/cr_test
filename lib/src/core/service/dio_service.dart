import 'dart:developer';

import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/features/auth/logic/model/refreshToken/refresh_token.model.dart';
import 'package:cr/src/shared/utils/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
  late Dio _dio;
  static const int connectTimeout = 30000; // 30 secondes
  static const int receiveTimeout = 30000; // 30 secondes
  final SecureStorage _secureStorage = SecureStorage();
  final String _baseUrl;

  // Change from 'late final' to nullable AppRouter
  static AppRouter? _appRouter;

  // Flag pour éviter les tentatives de refresh multiples simultanées
  bool _isRefreshing = false;

  // Queue pour stocker les requêtes en attente pendant le refresh
  final List<RequestOptions> _pendingRequests = [];

  Dio get dio => _dio;

  // Constructeur principal qui accepte le baseUrl
  DioService({String? baseUrl}) : _baseUrl = baseUrl ?? dotenv.env['BASE_URL'] ?? '' {
    _initializeDio();
  }

  // Factory pour créer une nouvelle instance avec un baseUrl spécifique
  factory DioService.withBaseUrl(String baseUrl) {
    return DioService(baseUrl: baseUrl);
  }

  // Factory pour créer une instance avec l'URL par défaut du .env
  factory DioService.withDefaultUrl() {
    return DioService();
  }

  // Updated method to safely set AppRouter
  static void setAppRouter(AppRouter router) {
    _appRouter = router;
  }

  // Getter to access the router safely
  static AppRouter? get appRouter => _appRouter;

  // Méthode d'initialisation de Dio
  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout),
        sendTimeout: const Duration(milliseconds: connectTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'client-id': dotenv.env['CLIENT_ID'] ?? '',
          'api-key': dotenv.env['API_KEY'] ?? '',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _secureStorage.getAccessToken();

          if (kDebugMode) {
            print("token access: $token");
          }
          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) async {
          log("auth error: ${error.response}");

          if (error.response?.statusCode == 401) {
            // Tenter de rafraîchir le token
            final refreshed = await _handleTokenRefresh(error.requestOptions);

            if (refreshed) {
              // Si le token a été rafraîchi avec succès, relancer la requête
              try {
                final newResponse = await _dio.fetch(error.requestOptions);
                handler.resolve(newResponse);
                return;
              } catch (e) {
                if (kDebugMode) {
                  print('Erreur lors de la relance de la requête après refresh: $e');
                }
              }
            }
            // Si le refresh a échoué ou si on n'arrive pas à relancer la requête
            await _handleLogout();
          }

          handler.next(error);
        },
      ),
    );
  }

  /// Gère le rafraîchissement automatique du token
  Future<bool> _handleTokenRefresh(RequestOptions failedRequest) async {
    // Éviter les tentatives multiples simultanées
    if (_isRefreshing) {
      // Ajouter la requête à la queue et attendre
      _pendingRequests.add(failedRequest);
      return false;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await _secureStorage.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        if (kDebugMode) {
          print('Aucun refresh token disponible');
        }
        return false;
      }

      if (kDebugMode) {
        print('Tentative de rafraîchissement du token...');
      }

      // Créer une nouvelle instance Dio pour éviter l'interception
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: _baseUrl, // Utilise la même baseUrl que l'instance principale
          connectTimeout: const Duration(milliseconds: connectTimeout),
          receiveTimeout: const Duration(milliseconds: receiveTimeout),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'client-id': dotenv.env['CLIENT_ID'] ?? '',
            'api-key': dotenv.env['API_KEY'] ?? '',
          },
        ),
      );

      final response = await refreshDio.post('v1/auth/reset-token', data: {'refreshToken': refreshToken});

      if (response.statusCode == 200) {
        RefreshResponse responseData = RefreshResponse.fromJson(response.data);
        final newAccessToken = responseData.data.token;
        await _secureStorage.setAccessToken(newAccessToken);

        if (kDebugMode) {
          print('Token rafraîchi avec succès');
        }

        // Traiter les requêtes en attente
        await _processPendingRequests();

        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors du rafraîchissement du token: $e');
      }

      // Si l'erreur est 401/403 sur le refresh, le refresh token a expiré
      if (e is DioException && (e.response?.statusCode == 401 || e.response?.statusCode == 403)) {
        if (kDebugMode) {
          print('Refresh token expiré');
        }

        await _handleLogout();
      }
    } finally {
      _isRefreshing = false;
      _pendingRequests.clear();
    }

    return false;
  }

  /// Traite les requêtes mises en attente pendant le refresh
  Future<void> _processPendingRequests() async {
    final newAccessToken = await _secureStorage.getAccessToken();

    for (final request in _pendingRequests) {
      request.headers['Authorization'] = 'Bearer $newAccessToken';
      try {
        await _dio.fetch(request);
      } catch (e) {
        if (kDebugMode) {
          print('Erreur lors du traitement d\'une requête en attente: $e');
        }
      }
    }
  }

  /// Gère la déconnexion de l'utilisateur
  Future<void> _handleLogout() async {
    // Clear all stored data
    await _secureStorage.clearAccessToken();
    await _secureStorage.clearAll();

    if (kDebugMode) {
      print('Token expiré et non rafraîchissable, déconnexion de l\'utilisateur');
    }

    try {
      if (_appRouter != null) {
        // Décommentez et ajustez selon votre routing
        await _appRouter!.replaceAll([const LoginRoute()]);
      } else {
        if (kDebugMode) {
          print('AppRouter not initialized, cannot navigate to auth');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during navigation to auth: $e');
      }
    }
  }

  // Getter pour obtenir la baseUrl actuelle
  String get baseUrl => _baseUrl;
}