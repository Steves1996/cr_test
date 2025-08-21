import 'dart:convert';
import 'dart:developer';

import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage;
  SecureStorage({FlutterSecureStorage? storage}) : storage = storage ?? const FlutterSecureStorage();

  Future<void> setAccessToken(String token) async {
    await storage.write(key: accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return  storage.read(key: accessTokenKey);
  }

  Future<void> clearAccessToken() async {
    await storage.delete(key: accessTokenKey);
  }


  Future<void> setRefreshToken(String refreshToken) async {
    await storage.write(key: refreshTokenKey, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return storage.read(key: refreshTokenKey);
  }

  Future<void> clearRefreshToken() async {
    await storage.delete(key: refreshTokenKey);
  }

  //user Id
  Future<void> setUserId(String userId) async {
    await storage.write(key: useIdKey, value: userId);
  }

  Future<String?> getUserId() async {
    return storage.read(key: useIdKey);
  }

  Future<void> clearUserId() async {
    await storage.delete(key: useIdKey);
  }

  //user data
  Future<void> setUser(LoginData user) async {
    final String userJson = jsonEncode(user.toJson());
    await storage.write(key: useDataKey, value: userJson);
  }

  Future<LoginData?> getUser() async {
    try {
      final String? userJson = await storage.read(key: useDataKey);
      if (userJson != null && userJson.isNotEmpty) {
        final Map<String, dynamic> userMap = jsonDecode(userJson);
        return LoginData.fromJson(userMap);
      }
      return null;
    } catch (e) {
      log('Erreur lors de la récupération de l\'utilisateur : $e');
      return null;
    }
  }

  Future<void> clearUser() async {
    await storage.delete(key: useDataKey);
  }

  // Clear all stored data
  Future<void> clearAll() async {
    await storage.deleteAll();
  }

  static const String accessTokenKey = 'cr.accessToken.key';
  static const String refreshTokenKey = 'cr.refreshToken.key';
  static const String useIdKey = 'cr.user.id.key';
  static const String useDataKey = 'cr.user.key';
}
