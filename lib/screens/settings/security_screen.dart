import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _biometricEnabled = true;
  bool _twoFactorEnabled = false;
  bool _loginNotifications = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sécurité du compte',
          style: TextStyle(
            color: Colors.white,
            fontSize: isTablet ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isTablet ? 32 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Authentification
              Text(
                'Authentification',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildSecurityOption(
                'Authentification biométrique',
                'Utilisez votre empreinte digitale ou Face ID',
                Icons.fingerprint,
                _biometricEnabled,
                (value) {
                  setState(() {
                    _biometricEnabled = value;
                  });
                },
                isTablet,
              ),
              
              _buildSecurityOption(
                'Authentification à deux facteurs',
                'Sécurité supplémentaire avec SMS',
                Icons.security,
                _twoFactorEnabled,
                (value) {
                  setState(() {
                    _twoFactorEnabled = value;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Mot de passe
              Text(
                'Mot de passe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildActionCard(
                'Changer le mot de passe',
                'Dernière modification: Il y a 2 mois',
                Icons.lock_outline,
                () => _showChangePasswordDialog(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Notifications
              Text(
                'Notifications de sécurité',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildSecurityOption(
                'Notifications de connexion',
                'Recevoir des alertes lors de nouvelles connexions',
                Icons.notifications_outlined,
                _loginNotifications,
                (value) {
                  setState(() {
                    _loginNotifications = value;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Sessions actives
              Text(
                'Sessions actives',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildSessionCard(
                'iPhone 13 Pro',
                'Dakar, Sénégal • Maintenant',
                Icons.phone_iphone,
                true,
                isTablet,
              ),
              
              _buildSessionCard(
                'MacBook Pro',
                'Dakar, Sénégal • Il y a 2 heures',
                Icons.laptop_mac,
                false,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Bouton Déconnecter tous les appareils
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton(
                  onPressed: _showLogoutAllDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Déconnecter tous les appareils',
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

  Widget _buildSecurityOption(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
    bool isTablet,
  ) {
    return Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: isTablet ? 6 : 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ],
            ),
          ),
          
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
    bool isTablet,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: isTablet ? 6 : 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isTablet ? 16 : 14,
                    ),
                  ),
                ],
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

  Widget _buildSessionCard(
    String device,
    String location,
    IconData icon,
    bool isCurrent,
    bool isTablet,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 16 : 12),
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
        border: isCurrent ? Border.all(color: Colors.green, width: 2) : null,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      device,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (isCurrent) ...[
                      SizedBox(width: isTablet ? 12 : 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 12 : 8,
                          vertical: isTablet ? 6 : 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Actuel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 12 : 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: isTablet ? 6 : 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ],
            ),
          ),
          
          if (!isCurrent)
            IconButton(
              onPressed: () => _terminateSession(device),
              icon: Icon(
                Icons.close,
                color: Colors.red,
                size: isTablet ? 28 : 24,
              ),
            ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Changer le mot de passe',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Vous allez être redirigé vers la page de changement de mot de passe.',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Annuler',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigation vers la page de changement de mot de passe
            },
            child: const Text(
              'Continuer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutAllDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Déconnecter tous les appareils',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Cette action déconnectera votre compte de tous les appareils. Vous devrez vous reconnecter.',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Annuler',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Logique de déconnexion
            },
            child: const Text(
              'Déconnecter',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _terminateSession(String device) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Terminer la session',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Voulez-vous terminer la session sur $device ?',
          style: const TextStyle(color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Annuler',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Logique de terminaison de session
            },
            child: const Text(
              'Terminer',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

