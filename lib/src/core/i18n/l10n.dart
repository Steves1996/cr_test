// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Crypto Rates`
  String get app_title {
    return Intl.message(
      'Crypto Rates',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Chargement ...`
  String get loadingDialog_content {
    return Intl.message(
      'Chargement ...',
      name: 'loadingDialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Ce champ est obligatoire`
  String get empty_field {
    return Intl.message(
      'Ce champ est obligatoire',
      name: 'empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Rechercher`
  String get search {
    return Intl.message(
      'Rechercher',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Veuillez vous connecter pour avoir accès aux données`
  String get login_sign_in_to_crypto_rates {
    return Intl.message(
      'Veuillez vous connecter pour avoir accès aux données',
      name: 'login_sign_in_to_crypto_rates',
      desc: '',
      args: [],
    );
  }

  /// `Address mail`
  String get login_email {
    return Intl.message(
      'Address mail',
      name: 'login_email',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe`
  String get login_password {
    return Intl.message(
      'Mot de passe',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `Connexion`
  String get login_login {
    return Intl.message(
      'Connexion',
      name: 'login_login',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe oublié ?`
  String get login_forgot_password {
    return Intl.message(
      'Mot de passe oublié ?',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Vous n'avez pas de compte ? `
  String get login_dont_have_account {
    return Intl.message(
      'Vous n\'avez pas de compte ? ',
      name: 'login_dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Créer un compte`
  String get login_sign_up {
    return Intl.message(
      'Créer un compte',
      name: 'login_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Réal Time Exchange`
  String get header_real_time_exchange {
    return Intl.message(
      'Réal Time Exchange',
      name: 'header_real_time_exchange',
      desc: '',
      args: [],
    );
  }

  /// `Crypto:`
  String get rate_time_crypto {
    return Intl.message(
      'Crypto:',
      name: 'rate_time_crypto',
      desc: '',
      args: [],
    );
  }

  /// `Fiat: `
  String get rate_time_fiat {
    return Intl.message(
      'Fiat: ',
      name: 'rate_time_fiat',
      desc: '',
      args: [],
    );
  }

  /// `Taux actuel`
  String get rate_current_rate {
    return Intl.message(
      'Taux actuel',
      name: 'rate_current_rate',
      desc: '',
      args: [],
    );
  }

  /// `Mes Informations`
  String get profile {
    return Intl.message(
      'Mes Informations',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message(
      'Light Mode',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Détails du compte`
  String get account_details {
    return Intl.message(
      'Détails du compte',
      name: 'account_details',
      desc: '',
      args: [],
    );
  }

  /// `Membre depuis`
  String get member_since {
    return Intl.message(
      'Membre depuis',
      name: 'member_since',
      desc: '',
      args: [],
    );
  }

  /// `Compte créé le`
  String get account_create {
    return Intl.message(
      'Compte créé le',
      name: 'account_create',
      desc: '',
      args: [],
    );
  }

  /// `Dernier connexion`
  String get last_login {
    return Intl.message(
      'Dernier connexion',
      name: 'last_login',
      desc: '',
      args: [],
    );
  }

  /// `Session recente`
  String get session_recent {
    return Intl.message(
      'Session recente',
      name: 'session_recent',
      desc: '',
      args: [],
    );
  }

  /// `Modifier mes informations`
  String get edit_profile {
    return Intl.message(
      'Modifier mes informations',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
