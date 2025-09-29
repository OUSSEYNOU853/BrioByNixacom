import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import 'qr_code_popup.dart';

class RewardExchangePopup extends StatelessWidget {
  final String rewardTitle;
  final int pointsRequired;
  final int userPoints;

  const RewardExchangePopup({
    super.key,
    required this.rewardTitle,
    required this.pointsRequired,
    required this.userPoints,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final languageService = Provider.of<LanguageService>(context);
    
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: isTablet ? 400 : double.infinity,
        margin: EdgeInsets.all(isTablet ? 32 : 24),
        padding: EdgeInsets.all(isTablet ? 32 : 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icône de cadeau
            Container(
              width: isTablet ? 80 : 64,
              height: isTablet ? 80 : 64,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.card_giftcard,
                color: Colors.white,
                size: isTablet ? 40 : 32,
              ),
            ),
            
            SizedBox(height: isTablet ? 24 : 20),
            
            // Titre
            Text(
              languageService.t('reward_exchanged'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: isTablet ? 22 : 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: isTablet ? 16 : 12),
            
            // Description de la récompense
            Text(
              rewardTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: isTablet ? 18 : 16,
              ),
            ),
            
            SizedBox(height: isTablet ? 8 : 6),
            
            // Points utilisés
            Text(
              '$pointsRequired points utilisés',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: isTablet ? 16 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            SizedBox(height: isTablet ? 32 : 24),
            
            // Bouton pour obtenir le QR code
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showQRCodePopup(context, isTablet, languageService);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                  padding: EdgeInsets.symmetric(vertical: isTablet ? 20 : 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  languageService.t('get_qr_code'),
                  style: TextStyle(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: isTablet ? 16 : 12),
            
            // Bouton fermer
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                languageService.t('close'),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isTablet ? 16 : 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQRCodePopup(BuildContext context, bool isTablet, LanguageService languageService) {
    showDialog(
      context: context,
      builder: (context) => QRCodePopup(
        rewardTitle: rewardTitle,
        pointsUsed: pointsRequired,
      ),
    );
  }
}

