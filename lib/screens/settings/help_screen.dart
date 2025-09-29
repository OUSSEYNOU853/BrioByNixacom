import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
          'Aide et assistance',
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
              // Section Questions fréquentes
              Text(
                'Questions fréquentes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildFAQItem(
                'Comment gagner des points ?',
                'Vous gagnez des points à chaque achat chez nos partenaires. Plus vous achetez, plus vous gagnez de points.',
                isTablet,
              ),
              
              _buildFAQItem(
                'Comment échanger mes points ?',
                'Allez dans la section Récompenses, choisissez une offre et cliquez sur "Échanger" pour utiliser vos points.',
                isTablet,
              ),
              
              _buildFAQItem(
                'Comment transférer de l\'argent ?',
                'Utilisez la section Transfert, entrez le montant et les informations du destinataire, puis confirmez la transaction.',
                isTablet,
              ),
              
              _buildFAQItem(
                'Mes données sont-elles sécurisées ?',
                'Oui, nous utilisons un chiffrement de niveau bancaire pour protéger toutes vos données personnelles et financières.',
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Contact
              Text(
                'Nous contacter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildContactOption(
                'Chat en direct',
                'Discutez avec notre équipe support',
                Icons.chat_outlined,
                () => _startLiveChat(),
                isTablet,
              ),
              
              _buildContactOption(
                'Envoyer un email',
                'support@brio.com',
                Icons.email_outlined,
                () => _sendEmail(),
                isTablet,
              ),
              
              _buildContactOption(
                'Appeler le support',
                '+221 33 123 45 67',
                Icons.phone_outlined,
                () => _callSupport(),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Guides
              Text(
                'Guides d\'utilisation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildGuideOption(
                'Guide de démarrage',
                'Apprenez les bases de l\'application',
                Icons.play_circle_outline,
                () => _openGuide('getting_started'),
                isTablet,
              ),
              
              _buildGuideOption(
                'Gérer vos récompenses',
                'Maximisez vos gains de points',
                Icons.card_giftcard_outlined,
                () => _openGuide('rewards'),
                isTablet,
              ),
              
              _buildGuideOption(
                'Sécurité et confidentialité',
                'Protégez votre compte',
                Icons.security_outlined,
                () => _openGuide('security'),
                isTablet,
              ),
              
              _buildGuideOption(
                'Transferts d\'argent',
                'Guide complet des transferts',
                Icons.send_outlined,
                () => _openGuide('transfers'),
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Signaler un problème
              Text(
                'Signaler un problème',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
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
                      'Décrivez votre problème',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 16 : 12),
                    
                    TextField(
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 16 : 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Décrivez le problème que vous rencontrez...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: isTablet ? 16 : 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[600]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 20 : 16),
                    
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 56 : 48,
                      child: ElevatedButton(
                        onPressed: () => _reportProblem(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Envoyer le rapport',
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Informations de l'app
              Text(
                'Informations de l\'application',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isTablet ? 20 : 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildInfoRow('Version', '1.0.0', isTablet),
                    _buildInfoRow('Build', '100', isTablet),
                    _buildInfoRow('Dernière mise à jour', '31 Juillet 2025', isTablet),
                    _buildInfoRow('Plateforme', 'iOS/Android', isTablet),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer, bool isTablet) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          color: Colors.white,
          fontSize: isTablet ? 18 : 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.grey,
      children: [
        Padding(
          padding: EdgeInsets.all(isTablet ? 20 : 16),
          child: Text(
            answer,
            style: TextStyle(
              color: Colors.grey,
              fontSize: isTablet ? 16 : 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactOption(
    String title,
    String subtitle,
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

  Widget _buildGuideOption(
    String title,
    String subtitle,
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

  Widget _buildInfoRow(String label, String value, bool isTablet) {
    return Padding(
      padding: EdgeInsets.only(bottom: isTablet ? 16 : 12),
      child: Row(
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
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _startLiveChat() {
    // Logique pour démarrer le chat en direct
  }

  void _sendEmail() {
    // Logique pour envoyer un email
  }

  void _callSupport() {
    // Logique pour appeler le support
  }

  void _openGuide(String guideType) {
    // Logique pour ouvrir un guide spécifique
  }

  void _reportProblem() {
    // Logique pour signaler un problème
  }
}

