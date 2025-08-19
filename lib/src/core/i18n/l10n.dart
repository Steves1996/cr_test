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

  /// `Bienvenue`
  String get splash_welcome {
    return Intl.message(
      'Bienvenue',
      name: 'splash_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Dans la bibliothèque`
  String get splash_in_bibio {
    return Intl.message(
      'Dans la bibliothèque',
      name: 'splash_in_bibio',
      desc: '',
      args: [],
    );
  }

  /// `ZACHARIAS TANEE FOMUM`
  String get splash_autor {
    return Intl.message(
      'ZACHARIAS TANEE FOMUM',
      name: 'splash_autor',
      desc: '',
      args: [],
    );
  }

  /// `Plus de 10 000 Livres a votre disposition, rejoint nous vite !`
  String get splash_desc_bibio {
    return Intl.message(
      'Plus de 10 000 Livres a votre disposition, rejoint nous vite !',
      name: 'splash_desc_bibio',
      desc: '',
      args: [],
    );
  }

  /// `COMMENCER`
  String get splash_started {
    return Intl.message(
      'COMMENCER',
      name: 'splash_started',
      desc: '',
      args: [],
    );
  }

  /// `Connexion`
  String get ztf_slider_login {
    return Intl.message(
      'Connexion',
      name: 'ztf_slider_login',
      desc: '',
      args: [],
    );
  }

  /// `Inscription`
  String get ztf_slider_register {
    return Intl.message(
      'Inscription',
      name: 'ztf_slider_register',
      desc: '',
      args: [],
    );
  }

  /// `📚 Bienvenue dans votre bibliothèque numérique !`
  String get ztf_slider_text_desc {
    return Intl.message(
      '📚 Bienvenue dans votre bibliothèque numérique !',
      name: 'ztf_slider_text_desc',
      desc: '',
      args: [],
    );
  }

  /// `Tout est prêt pour vos lectures et emprunts `
  String get ztf_slider_read {
    return Intl.message(
      'Tout est prêt pour vos lectures et emprunts ',
      name: 'ztf_slider_read',
      desc: '',
      args: [],
    );
  }

  /// `Accédez dès maintenant à votre tableau de bord`
  String get ztf_slider_dashboard {
    return Intl.message(
      'Accédez dès maintenant à votre tableau de bord',
      name: 'ztf_slider_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Se Connecter`
  String get login_login {
    return Intl.message(
      'Se Connecter',
      name: 'login_login',
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

  /// `Email ou téléphone`
  String get login_email_or_phone {
    return Intl.message(
      'Email ou téléphone',
      name: 'login_email_or_phone',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe oublié ? `
  String get login_forgot_password {
    return Intl.message(
      'Mot de passe oublié ? ',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Changez votre mot de passe`
  String get login_change_password {
    return Intl.message(
      'Changez votre mot de passe',
      name: 'login_change_password',
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

  /// `Inscrivez-vous !`
  String get login_sign_up {
    return Intl.message(
      'Inscrivez-vous !',
      name: 'login_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Vous acceptez nos `
  String get login_agree_condition {
    return Intl.message(
      'Vous acceptez nos ',
      name: 'login_agree_condition',
      desc: '',
      args: [],
    );
  }

  /// `termes et services `
  String get login_term_of_conditioon {
    return Intl.message(
      'termes et services ',
      name: 'login_term_of_conditioon',
      desc: '',
      args: [],
    );
  }

  /// `et avez lu notre `
  String get login_read_policy {
    return Intl.message(
      'et avez lu notre ',
      name: 'login_read_policy',
      desc: '',
      args: [],
    );
  }

  /// `politique de confidentialité.`
  String get login_privacy_policy {
    return Intl.message(
      'politique de confidentialité.',
      name: 'login_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Réinitialisez votre mot de passe`
  String get verify_account_resset_password {
    return Intl.message(
      'Réinitialisez votre mot de passe',
      name: 'verify_account_resset_password',
      desc: '',
      args: [],
    );
  }

  /// `Saisissez votre adresse e-mail ou numéro de téléphone pour réinitialiser le mot de passe.`
  String get verify_account_resset_password_desc {
    return Intl.message(
      'Saisissez votre adresse e-mail ou numéro de téléphone pour réinitialiser le mot de passe.',
      name: 'verify_account_resset_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Envoyer`
  String get verify_account_send {
    return Intl.message(
      'Envoyer',
      name: 'verify_account_send',
      desc: '',
      args: [],
    );
  }

  /// `Retour`
  String get verify_account_return_to_login {
    return Intl.message(
      'Retour',
      name: 'verify_account_return_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP Code`
  String get pin_code_verify_otp {
    return Intl.message(
      'Verify OTP Code',
      name: 'pin_code_verify_otp',
      desc: '',
      args: [],
    );
  }

  /// `Vérifier votre compte`
  String get pin_code_title {
    return Intl.message(
      'Vérifier votre compte',
      name: 'pin_code_title',
      desc: '',
      args: [],
    );
  }

  /// `Entrez le code OTP reçu par SMS`
  String get pin_code_title_desc {
    return Intl.message(
      'Entrez le code OTP reçu par SMS',
      name: 'pin_code_title_desc',
      desc: '',
      args: [],
    );
  }

  /// `Le code doit contenir 6 chiffres`
  String get pin_code_validation {
    return Intl.message(
      'Le code doit contenir 6 chiffres',
      name: 'pin_code_validation',
      desc: '',
      args: [],
    );
  }

  /// `Vous n'avez pass reçu de code ? `
  String get pin_code_not_there {
    return Intl.message(
      'Vous n\'avez pass reçu de code ? ',
      name: 'pin_code_not_there',
      desc: '',
      args: [],
    );
  }

  /// `Nouveau code`
  String get pin_code_resend {
    return Intl.message(
      'Nouveau code',
      name: 'pin_code_resend',
      desc: '',
      args: [],
    );
  }

  /// `Réinitialisez votre mot de passe`
  String get new_password_title {
    return Intl.message(
      'Réinitialisez votre mot de passe',
      name: 'new_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Saisissez votre nouveau mot de passe`
  String get new_password_desc {
    return Intl.message(
      'Saisissez votre nouveau mot de passe',
      name: 'new_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Réinitialiser`
  String get new_password_reset {
    return Intl.message(
      'Réinitialiser',
      name: 'new_password_reset',
      desc: '',
      args: [],
    );
  }

  /// `Nouveau mot de passe`
  String get new_password {
    return Intl.message(
      'Nouveau mot de passe',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Numéro de téléphone`
  String get register_phone {
    return Intl.message(
      'Numéro de téléphone',
      name: 'register_phone',
      desc: '',
      args: [],
    );
  }

  /// `Nom & Prénom`
  String get register_full_name {
    return Intl.message(
      'Nom & Prénom',
      name: 'register_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get regsiter_email {
    return Intl.message(
      'Email',
      name: 'regsiter_email',
      desc: '',
      args: [],
    );
  }

  /// `S'inscrire`
  String get register {
    return Intl.message(
      'S\'inscrire',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Vous avez déja un compte ? `
  String get register_have_account {
    return Intl.message(
      'Vous avez déja un compte ? ',
      name: 'register_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Connectez-vous !`
  String get register_login {
    return Intl.message(
      'Connectez-vous !',
      name: 'register_login',
      desc: '',
      args: [],
    );
  }

  /// `S’inscrire`
  String get register_title {
    return Intl.message(
      'S’inscrire',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Créez votre compte et laissez-vous emporter par nos plus belles lectures.`
  String get register_desc {
    return Intl.message(
      'Créez votre compte et laissez-vous emporter par nos plus belles lectures.',
      name: 'register_desc',
      desc: '',
      args: [],
    );
  }

  /// `Actualité de la Bibliothèque`
  String get home_bib_actus {
    return Intl.message(
      'Actualité de la Bibliothèque',
      name: 'home_bib_actus',
      desc: '',
      args: [],
    );
  }

  /// `Voir tout >`
  String get home_see_more {
    return Intl.message(
      'Voir tout >',
      name: 'home_see_more',
      desc: '',
      args: [],
    );
  }

  /// `Nouveautés`
  String get home_new_bib {
    return Intl.message(
      'Nouveautés',
      name: 'home_new_bib',
      desc: '',
      args: [],
    );
  }

  /// `Les plus demandés`
  String get home_most_ask {
    return Intl.message(
      'Les plus demandés',
      name: 'home_most_ask',
      desc: '',
      args: [],
    );
  }

  /// `Mon historique`
  String get home_my_history {
    return Intl.message(
      'Mon historique',
      name: 'home_my_history',
      desc: '',
      args: [],
    );
  }

  /// `Se connecter`
  String get login_title {
    return Intl.message(
      'Se connecter',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Passer >`
  String get login_skip {
    return Intl.message(
      'Passer >',
      name: 'login_skip',
      desc: '',
      args: [],
    );
  }

  /// `Connecter vous à votre compte ou à votre espace membre.`
  String get login_desc {
    return Intl.message(
      'Connecter vous à votre compte ou à votre espace membre.',
      name: 'login_desc',
      desc: '',
      args: [],
    );
  }

  /// `Recommandation`
  String get home_recommandation {
    return Intl.message(
      'Recommandation',
      name: 'home_recommandation',
      desc: '',
      args: [],
    );
  }

  /// `Je veux lire`
  String get bibio_read_more {
    return Intl.message(
      'Je veux lire',
      name: 'bibio_read_more',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant`
  String get home_restaurant {
    return Intl.message(
      'Restaurant',
      name: 'home_restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Bibiographie de Zacharias`
  String get home_bibio {
    return Intl.message(
      'Bibiographie de Zacharias',
      name: 'home_bibio',
      desc: '',
      args: [],
    );
  }

  /// `Recherchez votre livre`
  String get search_book_title {
    return Intl.message(
      'Recherchez votre livre',
      name: 'search_book_title',
      desc: '',
      args: [],
    );
  }

  /// `Recherche...`
  String get search_book {
    return Intl.message(
      'Recherche...',
      name: 'search_book',
      desc: '',
      args: [],
    );
  }

  /// `Mon Panier`
  String get cart_title {
    return Intl.message(
      'Mon Panier',
      name: 'cart_title',
      desc: '',
      args: [],
    );
  }

  /// `Panier vide`
  String get cart_empty {
    return Intl.message(
      'Panier vide',
      name: 'cart_empty',
      desc: '',
      args: [],
    );
  }

  /// `Total : `
  String get cart_total {
    return Intl.message(
      'Total : ',
      name: 'cart_total',
      desc: '',
      args: [],
    );
  }

  /// `Paiement initialisé`
  String get payment_initiated {
    return Intl.message(
      'Paiement initialisé',
      name: 'payment_initiated',
      desc: '',
      args: [],
    );
  }

  /// `Envoyer`
  String get pay_now {
    return Intl.message(
      'Envoyer',
      name: 'pay_now',
      desc: '',
      args: [],
    );
  }

  /// `Videothèque`
  String get home_videographie {
    return Intl.message(
      'Videothèque',
      name: 'home_videographie',
      desc: '',
      args: [],
    );
  }

  /// `Audiothèque`
  String get home_audiographie {
    return Intl.message(
      'Audiothèque',
      name: 'home_audiographie',
      desc: '',
      args: [],
    );
  }

  /// `Filter vos livres`
  String get filter_title {
    return Intl.message(
      'Filter vos livres',
      name: 'filter_title',
      desc: '',
      args: [],
    );
  }

  /// `Pour la Reservation : `
  String get details_for_reserve {
    return Intl.message(
      'Pour la Reservation : ',
      name: 'details_for_reserve',
      desc: '',
      args: [],
    );
  }

  /// `Pour la Vente : `
  String get details_for_sell {
    return Intl.message(
      'Pour la Vente : ',
      name: 'details_for_sell',
      desc: '',
      args: [],
    );
  }

  /// `Donnez votre note`
  String get details_rating_book {
    return Intl.message(
      'Donnez votre note',
      name: 'details_rating_book',
      desc: '',
      args: [],
    );
  }

  /// `Donnez une note`
  String get rating_title {
    return Intl.message(
      'Donnez une note',
      name: 'rating_title',
      desc: '',
      args: [],
    );
  }

  /// `Valider`
  String get validate {
    return Intl.message(
      'Valider',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `Ajouter au panier`
  String get detail_add_cart {
    return Intl.message(
      'Ajouter au panier',
      name: 'detail_add_cart',
      desc: '',
      args: [],
    );
  }

  /// `Faite une reserver`
  String get detail_reserve {
    return Intl.message(
      'Faite une reserver',
      name: 'detail_reserve',
      desc: '',
      args: [],
    );
  }

  /// `Faite un emprunt`
  String get detail_boro {
    return Intl.message(
      'Faite un emprunt',
      name: 'detail_boro',
      desc: '',
      args: [],
    );
  }

  /// `Livre similaire`
  String get detail_similar_book {
    return Intl.message(
      'Livre similaire',
      name: 'detail_similar_book',
      desc: '',
      args: [],
    );
  }

  /// `Paramètre`
  String get setting_title {
    return Intl.message(
      'Paramètre',
      name: 'setting_title',
      desc: '',
      args: [],
    );
  }

  /// `Gérez vos informations et paramètres en un seul endroit.`
  String get setting_desc {
    return Intl.message(
      'Gérez vos informations et paramètres en un seul endroit.',
      name: 'setting_desc',
      desc: '',
      args: [],
    );
  }

  /// `Informations générales`
  String get setting_profil {
    return Intl.message(
      'Informations générales',
      name: 'setting_profil',
      desc: '',
      args: [],
    );
  }

  /// `Informations du profil`
  String get seeting_profil_info {
    return Intl.message(
      'Informations du profil',
      name: 'seeting_profil_info',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get setting_social {
    return Intl.message(
      'Social',
      name: 'setting_social',
      desc: '',
      args: [],
    );
  }

  /// `Partager l'application`
  String get seeting_share_app {
    return Intl.message(
      'Partager l\'application',
      name: 'seeting_share_app',
      desc: '',
      args: [],
    );
  }

  /// `Légal`
  String get setting_legal {
    return Intl.message(
      'Légal',
      name: 'setting_legal',
      desc: '',
      args: [],
    );
  }

  /// `Politique de confidentialité`
  String get seeting_policy {
    return Intl.message(
      'Politique de confidentialité',
      name: 'seeting_policy',
      desc: '',
      args: [],
    );
  }

  /// `Conditionos générales`
  String get seeting_condition {
    return Intl.message(
      'Conditionos générales',
      name: 'seeting_condition',
      desc: '',
      args: [],
    );
  }

  /// `Supprimer le compte`
  String get setting_delete {
    return Intl.message(
      'Supprimer le compte',
      name: 'setting_delete',
      desc: '',
      args: [],
    );
  }

  /// `Déconnexion`
  String get seeting_log_out {
    return Intl.message(
      'Déconnexion',
      name: 'seeting_log_out',
      desc: '',
      args: [],
    );
  }

  /// `Consultez et mettez à jour vos informations personnelles, coordonnées et préférences`
  String get profil_desc {
    return Intl.message(
      'Consultez et mettez à jour vos informations personnelles, coordonnées et préférences',
      name: 'profil_desc',
      desc: '',
      args: [],
    );
  }

  /// `Enregistrer les détails`
  String get profile_save_details {
    return Intl.message(
      'Enregistrer les détails',
      name: 'profile_save_details',
      desc: '',
      args: [],
    );
  }

  /// `Voulez-vous vous déconnecter de BIB ZTF ?`
  String get seeting_confirm_logout {
    return Intl.message(
      'Voulez-vous vous déconnecter de BIB ZTF ?',
      name: 'seeting_confirm_logout',
      desc: '',
      args: [],
    );
  }

  /// `Annuler`
  String get cancel {
    return Intl.message(
      'Annuler',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Voulez-vous vous supprimer votre compte de BIB ZTF ?\nNotez que cette action est irréversible`
  String get seeting_confirm_delete_account {
    return Intl.message(
      'Voulez-vous vous supprimer votre compte de BIB ZTF ?\nNotez que cette action est irréversible',
      name: 'seeting_confirm_delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Prêt`
  String get drawer_loan {
    return Intl.message(
      'Prêt',
      name: 'drawer_loan',
      desc: '',
      args: [],
    );
  }

  /// `Réservation`
  String get drawer_booking_book {
    return Intl.message(
      'Réservation',
      name: 'drawer_booking_book',
      desc: '',
      args: [],
    );
  }

  /// `Espace membre`
  String get drawer_member {
    return Intl.message(
      'Espace membre',
      name: 'drawer_member',
      desc: '',
      args: [],
    );
  }

  /// `Besoins d'aide ?`
  String get seeting_need_help {
    return Intl.message(
      'Besoins d\'aide ?',
      name: 'seeting_need_help',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get seeting_contact {
    return Intl.message(
      'Contact',
      name: 'seeting_contact',
      desc: '',
      args: [],
    );
  }

  /// `A Propos`
  String get seeting_about {
    return Intl.message(
      'A Propos',
      name: 'seeting_about',
      desc: '',
      args: [],
    );
  }

  /// `Historique`
  String get drawer_history {
    return Intl.message(
      'Historique',
      name: 'drawer_history',
      desc: '',
      args: [],
    );
  }

  /// `Oui, je le veux`
  String get home_member {
    return Intl.message(
      'Oui, je le veux',
      name: 'home_member',
      desc: '',
      args: [],
    );
  }

  /// `Voulez-vous être membre ?`
  String get home_to_be_member {
    return Intl.message(
      'Voulez-vous être membre ?',
      name: 'home_to_be_member',
      desc: '',
      args: [],
    );
  }

  /// `Prêt/Retour`
  String get loan {
    return Intl.message(
      'Prêt/Retour',
      name: 'loan',
      desc: '',
      args: [],
    );
  }

  /// `Favoris`
  String get drawer_favorit {
    return Intl.message(
      'Favoris',
      name: 'drawer_favorit',
      desc: '',
      args: [],
    );
  }

  /// `Videothèque`
  String get drawer_video {
    return Intl.message(
      'Videothèque',
      name: 'drawer_video',
      desc: '',
      args: [],
    );
  }

  /// `Audiothèque`
  String get drawer_audio {
    return Intl.message(
      'Audiothèque',
      name: 'drawer_audio',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant`
  String get drawer_restaurant {
    return Intl.message(
      'Restaurant',
      name: 'drawer_restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Annuler un prêt`
  String get cancel_loan {
    return Intl.message(
      'Annuler un prêt',
      name: 'cancel_loan',
      desc: '',
      args: [],
    );
  }

  /// `Reservation`
  String get booking {
    return Intl.message(
      'Reservation',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Nom d'utilisateur`
  String get register_user_name {
    return Intl.message(
      'Nom d\'utilisateur',
      name: 'register_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Loading....`
  String get loadingDialog_content {
    return Intl.message(
      'Loading....',
      name: 'loadingDialog_content',
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

  /// `Ce champ est obligatoire`
  String get empty_field {
    return Intl.message(
      'Ce champ est obligatoire',
      name: 'empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Nom d'utilisateur`
  String get login_username {
    return Intl.message(
      'Nom d\'utilisateur',
      name: 'login_username',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenu dans la bibliothèque ZACHARIAS TANEE FOMUM`
  String get register_create_success {
    return Intl.message(
      'Bienvenu dans la bibliothèque ZACHARIAS TANEE FOMUM',
      name: 'register_create_success',
      desc: '',
      args: [],
    );
  }

  /// `Nous sommes heureux de vous revoir`
  String get login_success {
    return Intl.message(
      'Nous sommes heureux de vous revoir',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Téléphone ou Email ?`
  String get login_choise_title {
    return Intl.message(
      'Téléphone ou Email ?',
      name: 'login_choise_title',
      desc: '',
      args: [],
    );
  }

  /// `Téléphone`
  String get login_choise_phone {
    return Intl.message(
      'Téléphone',
      name: 'login_choise_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get login_choise_email {
    return Intl.message(
      'Email',
      name: 'login_choise_email',
      desc: '',
      args: [],
    );
  }

  /// `Afin de profiter au max des offres de la bibliothèque, connectez-vous.`
  String get home_login_message {
    return Intl.message(
      'Afin de profiter au max des offres de la bibliothèque, connectez-vous.',
      name: 'home_login_message',
      desc: '',
      args: [],
    );
  }

  /// `Confirmer le mot de passe`
  String get confirm_password {
    return Intl.message(
      'Confirmer le mot de passe',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe doit contenir au moins 8 caractères`
  String get password_min_length {
    return Intl.message(
      'Le mot de passe doit contenir au moins 8 caractères',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe doit contenir au moins une majuscule`
  String get password_uppercase {
    return Intl.message(
      'Le mot de passe doit contenir au moins une majuscule',
      name: 'password_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe doit contenir au moins une minuscule`
  String get password_lowercase {
    return Intl.message(
      'Le mot de passe doit contenir au moins une minuscule',
      name: 'password_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe doit contenir au moins un chiffre`
  String get password_number {
    return Intl.message(
      'Le mot de passe doit contenir au moins un chiffre',
      name: 'password_number',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe doit contenir au moins un caractère spécial`
  String get password_special {
    return Intl.message(
      'Le mot de passe doit contenir au moins un caractère spécial',
      name: 'password_special',
      desc: '',
      args: [],
    );
  }

  /// `Les mots de passe ne correspondent pas`
  String get passwords_not_match {
    return Intl.message(
      'Les mots de passe ne correspondent pas',
      name: 'passwords_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe réinitialisé avec succès`
  String get password_reset_success {
    return Intl.message(
      'Mot de passe réinitialisé avec succès',
      name: 'password_reset_success',
      desc: '',
      args: [],
    );
  }

  /// `📚 Ma Librairie`
  String get home_my_lib {
    return Intl.message(
      '📚 Ma Librairie',
      name: 'home_my_lib',
      desc: '',
      args: [],
    );
  }

  /// `✨ Sélection du jour`
  String get home_day_selection {
    return Intl.message(
      '✨ Sélection du jour',
      name: 'home_day_selection',
      desc: '',
      args: [],
    );
  }

  /// `Ajouter au panier`
  String get add_cart {
    return Intl.message(
      'Ajouter au panier',
      name: 'add_cart',
      desc: '',
      args: [],
    );
  }

  /// `🎓 Académique`
  String get home_academique {
    return Intl.message(
      '🎓 Académique',
      name: 'home_academique',
      desc: '',
      args: [],
    );
  }

  /// `Voir tout >`
  String get academique_see {
    return Intl.message(
      'Voir tout >',
      name: 'academique_see',
      desc: '',
      args: [],
    );
  }

  /// `✝️ Spiritualité`
  String get home_spirituality {
    return Intl.message(
      '✝️ Spiritualité',
      name: 'home_spirituality',
      desc: '',
      args: [],
    );
  }

  /// `🏛️ Culture`
  String get home_culture {
    return Intl.message(
      '🏛️ Culture',
      name: 'home_culture',
      desc: '',
      args: [],
    );
  }

  /// `Librarie`
  String get login_librairie {
    return Intl.message(
      'Librarie',
      name: 'login_librairie',
      desc: '',
      args: [],
    );
  }

  /// `Passer a l'accueil`
  String get login_passe_to_home {
    return Intl.message(
      'Passer a l\'accueil',
      name: 'login_passe_to_home',
      desc: '',
      args: [],
    );
  }

  /// `Email invalide`
  String get invalid_email {
    return Intl.message(
      'Email invalide',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Modifier votre mot de passse`
  String get seeting_password {
    return Intl.message(
      'Modifier votre mot de passse',
      name: 'seeting_password',
      desc: '',
      args: [],
    );
  }

  /// `Commande`
  String get delivery_title {
    return Intl.message(
      'Commande',
      name: 'delivery_title',
      desc: '',
      args: [],
    );
  }

  /// `Recherche ...`
  String get deliver_search {
    return Intl.message(
      'Recherche ...',
      name: 'deliver_search',
      desc: '',
      args: [],
    );
  }

  /// `Détails`
  String get details {
    return Intl.message(
      'Détails',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Favorite(s)`
  String get favorite_title {
    return Intl.message(
      'Favorite(s)',
      name: 'favorite_title',
      desc: '',
      args: [],
    );
  }

  /// `Tableau de bord`
  String get drawer_dashboard {
    return Intl.message(
      'Tableau de bord',
      name: 'drawer_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Factures`
  String get drawer_billing {
    return Intl.message(
      'Factures',
      name: 'drawer_billing',
      desc: '',
      args: [],
    );
  }

  /// `Liste de souhaits`
  String get drawer_wish_list {
    return Intl.message(
      'Liste de souhaits',
      name: 'drawer_wish_list',
      desc: '',
      args: [],
    );
  }

  /// `Total : `
  String get total {
    return Intl.message(
      'Total : ',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Quantité(s) : `
  String get quantity {
    return Intl.message(
      'Quantité(s) : ',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Montant de la livraison : `
  String get delivery_amount {
    return Intl.message(
      'Montant de la livraison : ',
      name: 'delivery_amount',
      desc: '',
      args: [],
    );
  }

  /// `Voir la facture`
  String get see_invoice {
    return Intl.message(
      'Voir la facture',
      name: 'see_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Mon Panier`
  String get your_cart {
    return Intl.message(
      'Mon Panier',
      name: 'your_cart',
      desc: '',
      args: [],
    );
  }

  /// `Valider`
  String get validate_invoice {
    return Intl.message(
      'Valider',
      name: 'validate_invoice',
      desc: '',
      args: [],
    );
  }

  /// `Voulez-vous être livré ?`
  String get delivery_option {
    return Intl.message(
      'Voulez-vous être livré ?',
      name: 'delivery_option',
      desc: '',
      args: [],
    );
  }

  /// `Sous-total : `
  String get subtotal {
    return Intl.message(
      'Sous-total : ',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Valider le panier`
  String get valider_cart {
    return Intl.message(
      'Valider le panier',
      name: 'valider_cart',
      desc: '',
      args: [],
    );
  }

  /// `Nombre d'article(s) : `
  String get cart_items {
    return Intl.message(
      'Nombre d\'article(s) : ',
      name: 'cart_items',
      desc: '',
      args: [],
    );
  }

  /// `Livraison : `
  String get cart_delivery {
    return Intl.message(
      'Livraison : ',
      name: 'cart_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Entrer votre numéro de téléphone pour payer votre commande.`
  String get cart_desc {
    return Intl.message(
      'Entrer votre numéro de téléphone pour payer votre commande.',
      name: 'cart_desc',
      desc: '',
      args: [],
    );
  }

  /// `Confirmer`
  String get confirm {
    return Intl.message(
      'Confirmer',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `T. Commande`
  String get commande {
    return Intl.message(
      'T. Commande',
      name: 'commande',
      desc: '',
      args: [],
    );
  }

  /// `T. Achats`
  String get buy {
    return Intl.message(
      'T. Achats',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `T. Livraison`
  String get delivery {
    return Intl.message(
      'T. Livraison',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `T. Favorite`
  String get favorite {
    return Intl.message(
      'T. Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Transaction récentes`
  String get recent_transaction {
    return Intl.message(
      'Transaction récentes',
      name: 'recent_transaction',
      desc: '',
      args: [],
    );
  }

  /// `Mes Facture(s)`
  String get your_billing {
    return Intl.message(
      'Mes Facture(s)',
      name: 'your_billing',
      desc: '',
      args: [],
    );
  }

  /// `Commande`
  String get drawer_command {
    return Intl.message(
      'Commande',
      name: 'drawer_command',
      desc: '',
      args: [],
    );
  }

  /// `Ajouter un souhait`
  String get add_wish_list {
    return Intl.message(
      'Ajouter un souhait',
      name: 'add_wish_list',
      desc: '',
      args: [],
    );
  }

  /// `Description du livre`
  String get book_desc {
    return Intl.message(
      'Description du livre',
      name: 'book_desc',
      desc: '',
      args: [],
    );
  }

  /// `Titre du livre`
  String get book_title {
    return Intl.message(
      'Titre du livre',
      name: 'book_title',
      desc: '',
      args: [],
    );
  }

  /// `Auteur du livre`
  String get book_author {
    return Intl.message(
      'Auteur du livre',
      name: 'book_author',
      desc: '',
      args: [],
    );
  }

  /// `Vous avez besoin d'un livre que vous ne trouvez pas dans notre librairie, Ajouter un livre à votre liste de souhaits.`
  String get add_whist_desc {
    return Intl.message(
      'Vous avez besoin d\'un livre que vous ne trouvez pas dans notre librairie, Ajouter un livre à votre liste de souhaits.',
      name: 'add_whist_desc',
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
