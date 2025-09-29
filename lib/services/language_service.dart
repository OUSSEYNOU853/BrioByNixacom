import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService extends ChangeNotifier {
  static const String _languageKey = 'language_code';
  Locale _locale = const Locale('fr', 'FR');

  Locale get locale => _locale;

  bool get isFrench => _locale.languageCode == 'fr';

  LanguageService() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'fr';
    _locale = Locale(languageCode, languageCode == 'fr' ? 'FR' : 'US');
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    _locale = Locale(languageCode, languageCode == 'fr' ? 'FR' : 'US');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
    notifyListeners();
  }

  Future<void> toggleLanguage() async {
    if (_locale.languageCode == 'fr') {
      await setLanguage('en');
    } else {
      await setLanguage('fr');
    }
  }

  // Traductions
  static const Map<String, Map<String, String>> _translations = {
    'fr': {
      'home': 'Accueil',
      'rewards': 'Récompenses',
      'transfer': 'Transfert',
      'profile': 'Profil',
      'login': 'Se Connecter',
      'register': "S'inscrire",
      'email': 'Email',
      'password': 'Mot de passe',
      'forgot_password': 'Mot de passe oublié?',
      'no_account': 'Pas de compte?',
      'connect_google': 'Se Connecter avec Google',
      'connect_facebook': 'Se Connecter avec Facebook',
      'connect_apple': 'Se connecter avec Apple',
      'connect_account': 'Connectez vous à votre compte',
      'your_points': 'Vos Points',
      'redeem': 'Redeem',
      'rewards_offers': 'Récompenses et offres',
      'see_all': 'Voir tout',
      'restaurants': 'Restaurants',
      'stores': 'Magasins',
      'hotels': 'Hotels',
      'exchange': 'Echanger',
      'transaction_history': 'Historique des transactions',
      'transfer_money': 'Transférer de l\'argent',
      'enter_amount': 'Entrez le montant',
      'recipient_account': 'Destinataire N° de compte/ N° de mobile',
      'payment_method': 'Mode de paiement',
      'credit_card': 'Carte de crédit',
      'send': 'Envoyer',
      'payment_history': 'Historique des paiements',
      'my_profile': 'Mon profil',
      'account_info': 'Informations sur le compte',
      'payment_methods': 'Mode de paiement',
      'account_security': 'Sécurité du compte',
      'notification_settings': 'Paramètre de notification',
      'privacy_settings': 'Paramètres de confidentialité',
      'help_support': 'Aide et assistance',
      'general_settings': 'Paramètres généraux',
      'logout': 'Se déconnecter',
      'theme': 'Thème',
      'language': 'Langue',
      'dark': 'Sombre',
      'light': 'Clair',
      'french': 'Français',
      'english': 'English',
      'settings': 'Paramètres',
      'notifications': 'Notifications',
      'security': 'Sécurité',
      'privacy': 'Confidentialité',
      'help': 'Aide',
      'about': 'À propos',
      'version': 'Version',
      'cancel': 'Annuler',
      'save': 'Enregistrer',
      'confirm': 'Confirmer',
      'success': 'Succès',
      'error': 'Erreur',
      'loading': 'Chargement...',
      'history': 'Historique',
      'payments': 'Paiements',
      'transactions': 'Transactions',
      'reward_exchanged': 'Votre récompense est échangée avec succès !',
      'get_qr_code': 'Obtenir un code QR',
      'close': 'Fermer',
      'scan_not_working': 'Le scan ne fonctionne pas ? Copiez cette clé de code et entrez-la manuellement !',
      'copy': 'Copier',
    },
    'en': {
      'home': 'Home',
      'rewards': 'Rewards',
      'transfer': 'Transfer',
      'profile': 'Profile',
      'login': 'Login',
      'register': 'Register',
      'email': 'Email',
      'password': 'Password',
      'forgot_password': 'Forgot password?',
      'no_account': 'No account?',
      'connect_google': 'Connect with Google',
      'connect_facebook': 'Connect with Facebook',
      'connect_apple': 'Connect with Apple',
      'connect_account': 'Connect to your account',
      'your_points': 'Your Points',
      'redeem': 'Redeem',
      'rewards_offers': 'Rewards and offers',
      'see_all': 'See all',
      'restaurants': 'Restaurants',
      'stores': 'Stores',
      'hotels': 'Hotels',
      'exchange': 'Exchange',
      'transaction_history': 'Transaction history',
      'transfer_money': 'Transfer money',
      'enter_amount': 'Enter amount',
      'recipient_account': 'Recipient account number / Mobile number',
      'payment_method': 'Payment method',
      'credit_card': 'Credit card',
      'send': 'Send',
      'payment_history': 'Payment history',
      'my_profile': 'My profile',
      'account_info': 'Account information',
      'payment_methods': 'Payment methods',
      'account_security': 'Account security',
      'notification_settings': 'Notification settings',
      'privacy_settings': 'Privacy settings',
      'help_support': 'Help and support',
      'general_settings': 'General settings',
      'logout': 'Logout',
      'theme': 'Theme',
      'language': 'Language',
      'dark': 'Dark',
      'light': 'Light',
      'french': 'Français',
      'english': 'English',
      'settings': 'Settings',
      'notifications': 'Notifications',
      'security': 'Security',
      'privacy': 'Privacy',
      'help': 'Help',
      'about': 'About',
      'version': 'Version',
      'cancel': 'Cancel',
      'save': 'Save',
      'confirm': 'Confirm',
      'success': 'Success',
      'error': 'Error',
      'loading': 'Loading...',
      'history': 'History',
      'payments': 'Payments',
      'transactions': 'Transactions',
      'reward_exchanged': 'Your reward has been successfully exchanged!',
      'get_qr_code': 'Get QR code',
      'close': 'Close',
      'scan_not_working': 'Scan not working? Copy this code key and enter it manually!',
      'copy': 'Copy',
    },
  };

  String translate(String key) {
    return _translations[_locale.languageCode]?[key] ?? key;
  }

  String t(String key) => translate(key);
}

