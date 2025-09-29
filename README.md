# Brio App

Une application mobile Flutter complète avec un système d'authentification et de gestion de récompenses.

## Fonctionnalités

### Authentification
- **Connexion** : Écran de connexion avec email et mot de passe
- **Inscription** : Création de nouveau compte avec confirmation de mot de passe
- **Mot de passe oublié** : Récupération de mot de passe par email
- **Réinitialisation** : Réinitialisation sécurisée du mot de passe

### Écrans principaux
- **Accueil** : Vue d'ensemble des points et offres disponibles
- **Récompenses** : Gestion des points et échange de récompenses avec codes QR
- **Transfert** : Transfert d'argent avec historique des transactions
- **Profil** : Gestion du profil utilisateur et paramètres

## Design

L'application suit fidèlement les maquettes Figma fournies avec :
- Thème sombre moderne
- Interface utilisateur intuitive
- Navigation par onglets
- Animations et transitions fluides

## Structure du projet

```
lib/
├── main.dart                    # Point d'entrée de l'application
└── screens/
    ├── login_screen.dart        # Écran de connexion
    ├── register_screen.dart     # Écran d'inscription
    ├── forgot_password_screen.dart # Écran mot de passe oublié
    ├── reset_password_screen.dart  # Écran réinitialisation
    ├── home_screen.dart         # Écran d'accueil avec navigation
    ├── rewards_screen.dart      # Écran des récompenses
    ├── transfer_screen.dart     # Écran de transfert
    └── profile_screen.dart      # Écran de profil
```

## Installation et utilisation

1. Assurez-vous d'avoir Flutter installé sur votre système
2. Clonez ce projet
3. Exécutez `flutter pub get` pour installer les dépendances
4. Lancez l'application avec `flutter run`

## Compatibilité

- Flutter 3.22.2+
- Dart 3.0+
- Compatible iOS et Android

## Fonctionnalités techniques

- Navigation entre écrans
- Gestion d'état local
- Formulaires avec validation
- Dialogs et modals
- Interface responsive
- Thème personnalisé

L'application est prête pour le développement et peut être étendue avec des fonctionnalités backend pour la persistance des données et l'authentification réelle.

# BrioByNixacom
