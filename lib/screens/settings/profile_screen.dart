import 'package:flutter/material.dart';
import 'account_info_screen.dart';
import 'payment_methods_screen.dart';
import 'security_screen.dart';
import 'notifications_screen.dart';
import 'privacy_screen.dart';
import 'help_screen.dart';
import 'settings_screen.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Mon profil',
          style: TextStyle(
            color: Colors.white,
            fontSize: isTablet ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: isTablet ? 28 : 24,
            ),
            onPressed: () {
              // Logique pour les notifications
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isTablet ? 32 : 24),
          child: Column(
            children: [
              // Profil utilisateur
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isTablet ? 24 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Photo de profil
                    Container(
                      width: isTablet ? 100 : 80,
                      height: isTablet ? 100 : 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: isTablet ? 50 : 40,
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 20 : 16),
                    
                    // Nom
                    Text(
                      'Ousmane Ndiaye',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 24 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 8 : 6),
                    
                    // Email
                    Text(
                      'ousmanendiaye99@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 20 : 16),
                    
                    // Points
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          color: Colors.orange,
                          size: isTablet ? 28 : 24,
                        ),
                        SizedBox(width: isTablet ? 12 : 8),
                        Text(
                          '2500',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 20 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Options du profil
              _buildProfileOption(
                'Informations sur le compte',
                Icons.person_outline,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountInfoScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              _buildProfileOption(
                'Mode de paiement',
                Icons.credit_card,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentMethodsScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              _buildProfileOption(
                'Sécurité du compte',
                Icons.security,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecurityScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              _buildProfileOption(
                'Paramètre de notification',
                Icons.notifications_outlined,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              _buildProfileOption(
                'Paramètres de confidentialité',
                Icons.lock_outline,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              _buildProfileOption(
                'Aide et assistance',
                Icons.help_outline,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              _buildProfileOption(
                'Paramètres généraux',
                Icons.settings_outlined,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Bouton de déconnexion
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Se déconnecter',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    String title,
    IconData icon,
    VoidCallback onTap,
    bool isTablet,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: isTablet ? 16 : 12),
        padding: EdgeInsets.all(isTablet ? 20 : 16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: isTablet ? 56 : 48,
              height: isTablet ? 56 : 48,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: isTablet ? 28 : 24,
              ),
            ),
            
            SizedBox(width: isTablet ? 20 : 16),
            
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 18 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: isTablet ? 20 : 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A2A2A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Se déconnecter',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Êtes-vous sûr de vouloir vous déconnecter ?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Annuler',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text(
                'Se déconnecter',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

