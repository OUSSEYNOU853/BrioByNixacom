import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('fr', 'FR'),
    Locale('en', 'US'),
  ];

  // Traductions communes
  String get appName => _localizedValues[locale.languageCode]!['app_name']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get rewards => _localizedValues[locale.languageCode]!['rewards']!;
  String get transfer => _localizedValues[locale.languageCode]!['transfer']!;
  String get profile => _localizedValues[locale.languageCode]!['profile']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get darkTheme => _localizedValues[locale.languageCode]!['dark_theme']!;
  String get lightTheme => _localizedValues[locale.languageCode]!['light_theme']!;
  String get french => _localizedValues[locale.languageCode]!['french']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get close => _localizedValues[locale.languageCode]!['close']!;
  String get seeAll => _localizedValues[locale.languageCode]!['see_all']!;
  String get history => _localizedValues[locale.languageCode]!['history']!;
  String get payments => _localizedValues[locale.languageCode]!['payments']!;
  String get transactions => _localizedValues[locale.languageCode]!['transactions']!;
  
  // Page d'accueil
  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;
  String get balance => _localizedValues[locale.languageCode]!['balance']!;
  String get recentTransactions => _localizedValues[locale.languageCode]!['recent_transactions']!;
  
  // Page de récompenses
  String get yourPoints => _localizedValues[locale.languageCode]!['your_points']!;
  String get redeem => _localizedValues[locale.languageCode]!['redeem']!;
  String get rewardsAndOffers => _localizedValues[locale.languageCode]!['rewards_and_offers']!;
  String get restaurants => _localizedValues[locale.languageCode]!['restaurants']!;
  String get stores => _localizedValues[locale.languageCode]!['stores']!;
  String get hotels => _localizedValues[locale.languageCode]!['hotels']!;
  String get exchange => _localizedValues[locale.languageCode]!['exchange']!;
  String get transactionHistory => _localizedValues[locale.languageCode]!['transaction_history']!;
  String get rewardExchanged => _localizedValues[locale.languageCode]!['reward_exchanged']!;
  String get getQrCode => _localizedValues[locale.languageCode]!['get_qr_code']!;
  String get scanNotWorking => _localizedValues[locale.languageCode]!['scan_not_working']!;
  
  // Page de profil
  String get myProfile => _localizedValues[locale.languageCode]!['my_profile']!;
  String get accountInfo => _localizedValues[locale.languageCode]!['account_info']!;
  String get paymentMethods => _localizedValues[locale.languageCode]!['payment_methods']!;
  String get accountSecurity => _localizedValues[locale.languageCode]!['account_security']!;
  String get notificationSettings => _localizedValues[locale.languageCode]!['notification_settings']!;
  String get privacySettings => _localizedValues[locale.languageCode]!['privacy_settings']!;
  String get helpAndSupport => _localizedValues[locale.languageCode]!['help_and_support']!;
  String get generalSettings => _localizedValues[locale.languageCode]!['general_settings']!;

  static const Map<String, Map<String, String>> _localizedValues = {
    'fr': {
      'app_name': 'Brio',
      'home': 'Accueil',
      'rewards': 'Récompenses',
      'transfer': 'Transfert',
      'profile': 'Profil',
      'settings': 'Paramètres',
      'language': 'Langue',
      'theme': 'Thème',
      'dark_theme': 'Thème sombre',
      'light_theme': 'Thème clair',
      'french': 'Français',
      'english': 'Anglais',
      'save': 'Enregistrer',
      'cancel': 'Annuler',
      'close': 'Fermer',
      'see_all': 'Voir tout',
      'history': 'Historique',
      'payments': 'Paiements',
      'transactions': 'Transactions',
      'welcome': 'Bienvenue',
      'balance': 'Solde',
      'recent_transactions': 'Transactions récentes',
      'your_points': 'Vos Points',
      'redeem': 'Redeem',
      'rewards_and_offers': 'Récompenses et offres',
      'restaurants': 'Restaurants',
      'stores': 'Magasins',
      'hotels': 'Hotels',
      'exchange': 'Échanger',
      'transaction_history': 'Historique des transactions',
      'reward_exchanged': 'Votre récompense est échangée avec succès !',
      'get_qr_code': 'Obtenir un code QR',
      'scan_not_working': 'Le scan ne fonctionne pas ? Copiez cette clé de code et entrez-la manuellement !',
      'my_profile': 'Mon profil',
      'account_info': 'Informations sur le compte',
      'payment_methods': 'Mode de paiement',
      'account_security': 'Sécurité du compte',
      'notification_settings': 'Paramètre de notification',
      'privacy_settings': 'Paramètres de confidentialité',
      'help_and_support': 'Aide et assistance',
      'general_settings': 'Paramètres généraux',
    },
    'en': {
      'app_name': 'Brio',
      'home': 'Home',
      'rewards': 'Rewards',
      'transfer': 'Transfer',
      'profile': 'Profile',
      'settings': 'Settings',
      'language': 'Language',
      'theme': 'Theme',
      'dark_theme': 'Dark Theme',
      'light_theme': 'Light Theme',
      'french': 'French',
      'english': 'English',
      'save': 'Save',
      'cancel': 'Cancel',
      'close': 'Close',
      'see_all': 'See All',
      'history': 'History',
      'payments': 'Payments',
      'transactions': 'Transactions',
      'welcome': 'Welcome',
      'balance': 'Balance',
      'recent_transactions': 'Recent Transactions',
      'your_points': 'Your Points',
      'redeem': 'Redeem',
      'rewards_and_offers': 'Rewards and Offers',
      'restaurants': 'Restaurants',
      'stores': 'Stores',
      'hotels': 'Hotels',
      'exchange': 'Exchange',
      'transaction_history': 'Transaction History',
      'reward_exchanged': 'Your reward has been exchanged successfully!',
      'get_qr_code': 'Get QR Code',
      'scan_not_working': 'Scan not working? Copy this code key and enter it manually!',
      'my_profile': 'My Profile',
      'account_info': 'Account Information',
      'payment_methods': 'Payment Methods',
      'account_security': 'Account Security',
      'notification_settings': 'Notification Settings',
      'privacy_settings': 'Privacy Settings',
      'help_and_support': 'Help and Support',
      'general_settings': 'General Settings',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['fr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

