import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetRepository {
  Future<bool> checkInternetConnection() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();
      if (connectivityResults.contains(ConnectivityResult.none)) {
        log('Aucune connexion réseau détectée');
        return false;
      }
      return await _performInternetCheck();
    } catch (e) {
      log('Erreur lors de la vérification de la connexion: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> checkDetailedConnection() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();

      Map<String, dynamic> result = {
        'hasInternet': false,
        'connectionTypes': <String>[],
        'isWifi': false,
        'isMobile': false,
        'isEthernet': false,
      };

      if (connectivityResults.contains(ConnectivityResult.none)) {
        log('Aucune connexion réseau détectée');
        return result;
      }

      for (var connectivityResult in connectivityResults) {
        switch (connectivityResult) {
          case ConnectivityResult.wifi:
            result['connectionTypes'].add('WiFi');
            result['isWifi'] = true;
            break;
          case ConnectivityResult.mobile:
            result['connectionTypes'].add('Mobile');
            result['isMobile'] = true;
            break;
          case ConnectivityResult.ethernet:
            result['connectionTypes'].add('Ethernet');
            result['isEthernet'] = true;
            break;
          case ConnectivityResult.vpn:
            result['connectionTypes'].add('VPN');
            break;
          case ConnectivityResult.bluetooth:
            result['connectionTypes'].add('Bluetooth');
            break;
          case ConnectivityResult.other:
            result['connectionTypes'].add('Autre');
            break;
          case ConnectivityResult.none:
          // Déjà géré plus haut
            break;
        }
      }

      result['hasInternet'] = await _performInternetCheck();

      log('Types de connexion détectés: ${result['connectionTypes']}');
      log('Connexion internet active: ${result['hasInternet']}');

      return result;
    } catch (e) {
      log('Erreur lors de la vérification détaillée: $e');
      return {
        'hasInternet': false,
        'connectionTypes': <String>[],
        'isWifi': false,
        'isMobile': false,
        'isEthernet': false,
        'error': e.toString(),
      };
    }
  }

  Future<bool> isConnectedToWifi() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();
      return connectivityResults.contains(ConnectivityResult.wifi);
    } catch (e) {
      log('Erreur lors de la vérification WiFi: $e');
      return false;
    }
  }

  Future<bool> isConnectedToMobile() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();
      return connectivityResults.contains(ConnectivityResult.mobile);
    } catch (e) {
      log('Erreur lors de la vérification mobile: $e');
      return false;
    }
  }

  Future<bool> _performInternetCheck() async {
    final List<String> testServers = [
      'google.com',
      'cloudflare.com',
      '8.8.8.8',
    ];

    for (String server in testServers) {
      try {
        final result = await InternetAddress.lookup(server)
            .timeout(const Duration(seconds: 5));

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          log('Connexion internet confirmée via $server');
          return true;
        }
      } on SocketException catch (e) {
        log('Échec de connexion à $server: $e');
        continue;
      } catch (e) {
        log('Erreur lors du test de $server: $e');
        continue;
      }
    }

    log('Aucun serveur de test accessible');
    return false;
  }

  Stream<Map<String, dynamic>> watchConnectivity() {
    return Connectivity().onConnectivityChanged.asyncMap((results) async {
      await Future.delayed(const Duration(milliseconds: 500)); // Délai pour stabilisation
      return await checkDetailedConnection();
    });
  }

  Future<String> getConnectionDescription() async {
    final details = await checkDetailedConnection();

    if (!details['hasInternet']) {
      return 'Pas de connexion internet';
    }

    final types = details['connectionTypes'] as List<String>;
    if (types.isEmpty) {
      return 'Connexion internet active (type inconnu)';
    }

    return 'Connexion internet via ${types.join(', ')}';
  }
}