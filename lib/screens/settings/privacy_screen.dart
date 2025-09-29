import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _dataCollection = true;
  bool _analyticsTracking = false;
  bool _personalizedAds = false;
  bool _locationTracking = true;

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
          'Paramètres de confidentialité',
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
              // Section Collecte de données
              Text(
                'Collecte de données',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildPrivacyOption(
                'Collecte de données d\'utilisation',
                'Permettre la collecte de données pour améliorer l\'application',
                Icons.analytics_outlined,
                _dataCollection,
                (value) {
                  setState(() {
                    _dataCollection = value;
                  });
                },
                isTablet,
              ),
              
              _buildPrivacyOption(
                'Suivi analytique',
                'Partager des données anonymes pour les analyses',
                Icons.track_changes_outlined,
                _analyticsTracking,
                (value) {
                  setState(() {
                    _analyticsTracking = value;
                  });
                },
                isTablet,
              ),
              
              _buildPrivacyOption(
                'Publicités personnalisées',
                'Recevoir des publicités basées sur vos préférences',
                Icons.ads_click_outlined,
                _personalizedAds,
                (value) {
                  setState(() {
                    _personalizedAds = value;
                  });
                },
                isTablet,
              ),
              
              _buildPrivacyOption(
                'Suivi de localisation',
                'Permettre l\'accès à votre localisation pour les services',
                Icons.location_on_outlined,
                _locationTracking,
                (value) {
                  setState(() {
                    _locationTracking = value;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Gestion des données
              Text(
                'Gestion des données',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildActionCard(
                'Télécharger mes données',
                'Obtenir une copie de toutes vos données',
                Icons.download_outlined,
                () => _downloadData(),
                isTablet,
              ),
              
              _buildActionCard(
                'Supprimer mes données',
                'Supprimer définitivement toutes vos données',
                Icons.delete_outline,
                () => _deleteData(),
                isTablet,
                isDestructive: true,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Documents légaux
              Text(
                'Documents légaux',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildActionCard(
                'Politique de confidentialité',
                'Lire notre politique de confidentialité',
                Icons.privacy_tip_outlined,
                () => _openPrivacyPolicy(),
                isTablet,
              ),
              
              _buildActionCard(
                'Conditions d\'utilisation',
                'Consulter les conditions d\'utilisation',
                Icons.description_outlined,
                () => _openTermsOfService(),
                isTablet,
              ),
              
              _buildActionCard(
                'Politique des cookies',
                'En savoir plus sur notre utilisation des cookies',
                Icons.cookie_outlined,
                () => _openCookiePolicy(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Permissions
              Text(
                'Permissions de l\'application',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildPermissionCard(
                'Caméra',
                'Pour prendre des photos de profil',
                Icons.camera_alt_outlined,
                'Accordée',
                true,
                isTablet,
              ),
              
              _buildPermissionCard(
                'Stockage',
                'Pour sauvegarder les documents',
                Icons.storage_outlined,
                'Accordée',
                true,
                isTablet,
              ),
              
              _buildPermissionCard(
                'Localisation',
                'Pour les services basés sur la localisation',
                Icons.location_on_outlined,
                'Accordée',
                true,
                isTablet,
              ),
              
              _buildPermissionCard(
                'Notifications',
                'Pour recevoir des alertes importantes',
                Icons.notifications_outlined,
                'Accordée',
                true,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Bouton Gérer les permissions
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton(
                  onPressed: _managePermissions,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Gérer les permissions',
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

  Widget _buildPrivacyOption(
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
    bool isTablet, {
    bool isDestructive = false,
  }) {
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
                color: isDestructive ? Colors.red : Colors.white,
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
                      color: isDestructive ? Colors.red : Colors.white,
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

  Widget _buildPermissionCard(
    String title,
    String subtitle,
    IconData icon,
    String status,
    bool isGranted,
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
          
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 16 : 12,
              vertical: isTablet ? 8 : 6,
            ),
            decoration: BoxDecoration(
              color: isGranted ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: Colors.white,
                fontSize: isTablet ? 14 : 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _downloadData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Télécharger mes données',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Nous préparerons un fichier avec toutes vos données et vous l\'enverrons par email dans les 24 heures.',
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
              // Logique de téléchargement des données
            },
            child: const Text(
              'Confirmer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Supprimer mes données',
          style: TextStyle(color: Colors.red),
        ),
        content: const Text(
          'Cette action est irréversible. Toutes vos données seront définitivement supprimées.',
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
              // Logique de suppression des données
            },
            child: const Text(
              'Supprimer',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _openPrivacyPolicy() {
    // Navigation vers la politique de confidentialité
  }

  void _openTermsOfService() {
    // Navigation vers les conditions d'utilisation
  }

  void _openCookiePolicy() {
    // Navigation vers la politique des cookies
  }

  void _managePermissions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Gérer les permissions',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Vous allez être redirigé vers les paramètres de l\'appareil pour gérer les permissions.',
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
              // Redirection vers les paramètres de l'appareil
            },
            child: const Text(
              'Ouvrir les paramètres',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

