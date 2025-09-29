import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'Français';
  String _selectedCurrency = 'FCFA';
  String _selectedTheme = 'Sombre';
  bool _autoBackup = true;
  bool _offlineMode = false;

  final List<String> _languages = ['Français', 'English', 'العربية', 'Wolof'];
  final List<String> _currencies = ['FCFA', 'EUR', 'USD', 'GBP'];
  final List<String> _themes = ['Sombre', 'Clair', 'Automatique'];

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
          'Paramètres généraux',
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
              // Section Apparence
              Text(
                'Apparence',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildDropdownOption(
                'Thème',
                'Choisissez l\'apparence de l\'application',
                Icons.palette_outlined,
                _selectedTheme,
                _themes,
                (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Langue et région
              Text(
                'Langue et région',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildDropdownOption(
                'Langue',
                'Langue de l\'interface',
                Icons.language_outlined,
                _selectedLanguage,
                _languages,
                (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
                isTablet,
              ),
              
              _buildDropdownOption(
                'Devise',
                'Devise par défaut pour les transactions',
                Icons.attach_money_outlined,
                _selectedCurrency,
                _currencies,
                (value) {
                  setState(() {
                    _selectedCurrency = value!;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Stockage et sauvegarde
              Text(
                'Stockage et sauvegarde',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildSwitchOption(
                'Sauvegarde automatique',
                'Sauvegarder automatiquement vos données',
                Icons.backup_outlined,
                _autoBackup,
                (value) {
                  setState(() {
                    _autoBackup = value;
                  });
                },
                isTablet,
              ),
              
              _buildActionCard(
                'Gérer le stockage',
                'Voir l\'utilisation du stockage local',
                Icons.storage_outlined,
                () => _manageStorage(),
                isTablet,
              ),
              
              _buildActionCard(
                'Effacer le cache',
                'Libérer de l\'espace en supprimant les fichiers temporaires',
                Icons.cleaning_services_outlined,
                () => _clearCache(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Connectivité
              Text(
                'Connectivité',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildSwitchOption(
                'Mode hors ligne',
                'Utiliser l\'application sans connexion internet',
                Icons.wifi_off_outlined,
                _offlineMode,
                (value) {
                  setState(() {
                    _offlineMode = value;
                  });
                },
                isTablet,
              ),
              
              _buildActionCard(
                'Tester la connexion',
                'Vérifier la qualité de votre connexion',
                Icons.network_check_outlined,
                () => _testConnection(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Accessibilité
              Text(
                'Accessibilité',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildActionCard(
                'Taille du texte',
                'Ajuster la taille du texte',
                Icons.text_fields_outlined,
                () => _adjustTextSize(),
                isTablet,
              ),
              
              _buildActionCard(
                'Contraste élevé',
                'Améliorer la lisibilité',
                Icons.contrast_outlined,
                () => _toggleHighContrast(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Avancé
              Text(
                'Avancé',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildActionCard(
                'Réinitialiser les paramètres',
                'Restaurer les paramètres par défaut',
                Icons.restore_outlined,
                () => _resetSettings(),
                isTablet,
                isDestructive: true,
              ),
              
              _buildActionCard(
                'Diagnostics',
                'Informations techniques de l\'application',
                Icons.bug_report_outlined,
                () => _showDiagnostics(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Informations sur l'utilisation du stockage
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isTablet ? 20 : 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Utilisation du stockage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 16 : 12),
                    
                    _buildStorageInfo('Données de l\'app', '45 MB', 0.3, isTablet),
                    _buildStorageInfo('Cache', '12 MB', 0.1, isTablet),
                    _buildStorageInfo('Images', '8 MB', 0.05, isTablet),
                    
                    SizedBox(height: isTablet ? 16 : 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total utilisé',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 16 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '65 MB',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 16 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownOption(
    String title,
    String subtitle,
    IconData icon,
    String currentValue,
    List<String> options,
    Function(String?) onChanged,
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
          
          DropdownButton<String>(
            value: currentValue,
            onChanged: onChanged,
            dropdownColor: const Color(0xFF2A2A2A),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 16 : 14,
            ),
            underline: Container(),
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchOption(
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

  Widget _buildStorageInfo(String label, String size, double percentage, bool isTablet) {
    return Padding(
      padding: EdgeInsets.only(bottom: isTablet ? 12 : 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isTablet ? 16 : 14,
                ),
              ),
              Text(
                size,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 16 : 14,
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 8 : 6),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[700],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }

  void _manageStorage() {
    // Logique pour gérer le stockage
  }

  void _clearCache() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Effacer le cache',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Cette action supprimera tous les fichiers temporaires. Continuer ?',
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
              // Logique pour effacer le cache
            },
            child: const Text(
              'Effacer',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _testConnection() {
    // Logique pour tester la connexion
  }

  void _adjustTextSize() {
    // Logique pour ajuster la taille du texte
  }

  void _toggleHighContrast() {
    // Logique pour activer/désactiver le contraste élevé
  }

  void _resetSettings() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Réinitialiser les paramètres',
          style: TextStyle(color: Colors.red),
        ),
        content: const Text(
          'Cette action restaurera tous les paramètres par défaut. Continuer ?',
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
              // Logique pour réinitialiser les paramètres
            },
            child: const Text(
              'Réinitialiser',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _showDiagnostics() {
    // Logique pour afficher les diagnostics
  }
}

