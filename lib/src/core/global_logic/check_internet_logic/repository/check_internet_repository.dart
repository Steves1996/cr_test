import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class CheckInternetRepository {
  Future<bool> checkInternetConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return false;
      }
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5), onTimeout: () => []);

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      log('Erreur lors de la vérification de la connexion: $e');
      return false;
    }
  }
}
