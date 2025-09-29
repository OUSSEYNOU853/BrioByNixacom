import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/language_service.dart';

class QRCodePopup extends StatelessWidget {
  final String rewardTitle;
  final int pointsUsed;

  const QRCodePopup({
    super.key,
    required this.rewardTitle,
    required this.pointsUsed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final languageService = Provider.of<LanguageService>(context);
    
    // Code généré pour la récompense
    final String rewardCode = '232ihadsdg289';
    
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
            // Code QR
            Container(
              padding: EdgeInsets.all(isTablet ? 24 : 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: QrImageView(
                data: rewardCode,
                version: QrVersions.auto,
                size: isTablet ? 200 : 160,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
            
            SizedBox(height: isTablet ? 24 : 20),
            
            // Message d'instruction
            Text(
              languageService.t('scan_not_working'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: isTablet ? 18 : 16,
              ),
            ),
            
            SizedBox(height: isTablet ? 20 : 16),
            
            // Code à copier
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isTablet ? 20 : 16),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      rewardCode,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: isTablet ? 20 : 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: rewardCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Code copié dans le presse-papiers'),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.copy,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      size: isTablet ? 28 : 24,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: isTablet ? 32 : 24),
            
            // Informations sur la récompense
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isTablet ? 20 : 16),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Détails de la récompense',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  SizedBox(height: isTablet ? 12 : 8),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Récompense:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isTablet ? 16 : 14,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          rewardTitle,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: isTablet ? 16 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: isTablet ? 8 : 6),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Points utilisés:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isTablet ? 16 : 14,
                        ),
                      ),
                      Text(
                        '$pointsUsed points',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: isTablet ? 8 : 6),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Valide jusqu\'au:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isTablet ? 16 : 14,
                        ),
                      ),
                      Text(
                        '31/12/2024',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: isTablet ? 24 : 20),
            
            // Bouton fermer
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 12),
                ),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

