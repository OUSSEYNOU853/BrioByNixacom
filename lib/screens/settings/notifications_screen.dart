import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  
  bool _transactionAlerts = true;
  bool _rewardUpdates = true;
  bool _promotionalOffers = false;
  bool _securityAlerts = true;
  
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

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
          'Paramètres de notification',
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
              // Section Méthodes de notification
              Text(
                'Méthodes de notification',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildNotificationOption(
                'Notifications push',
                'Recevoir des notifications sur votre appareil',
                Icons.notifications_outlined,
                _pushNotifications,
                (value) {
                  setState(() {
                    _pushNotifications = value;
                  });
                },
                isTablet,
              ),
              
              _buildNotificationOption(
                'Notifications par email',
                'Recevoir des notifications par email',
                Icons.email_outlined,
                _emailNotifications,
                (value) {
                  setState(() {
                    _emailNotifications = value;
                  });
                },
                isTablet,
              ),
              
              _buildNotificationOption(
                'Notifications SMS',
                'Recevoir des notifications par SMS',
                Icons.sms_outlined,
                _smsNotifications,
                (value) {
                  setState(() {
                    _smsNotifications = value;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Types de notifications
              Text(
                'Types de notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildNotificationOption(
                'Alertes de transaction',
                'Notifications pour vos transactions',
                Icons.payment_outlined,
                _transactionAlerts,
                (value) {
                  setState(() {
                    _transactionAlerts = value;
                  });
                },
                isTablet,
              ),
              
              _buildNotificationOption(
                'Mises à jour des récompenses',
                'Notifications sur vos points et récompenses',
                Icons.card_giftcard_outlined,
                _rewardUpdates,
                (value) {
                  setState(() {
                    _rewardUpdates = value;
                  });
                },
                isTablet,
              ),
              
              _buildNotificationOption(
                'Offres promotionnelles',
                'Notifications sur les offres spéciales',
                Icons.local_offer_outlined,
                _promotionalOffers,
                (value) {
                  setState(() {
                    _promotionalOffers = value;
                  });
                },
                isTablet,
              ),
              
              _buildNotificationOption(
                'Alertes de sécurité',
                'Notifications importantes sur la sécurité',
                Icons.security_outlined,
                _securityAlerts,
                (value) {
                  setState(() {
                    _securityAlerts = value;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Paramètres sonores
              Text(
                'Paramètres sonores',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              _buildNotificationOption(
                'Son des notifications',
                'Jouer un son lors des notifications',
                Icons.volume_up_outlined,
                _soundEnabled,
                (value) {
                  setState(() {
                    _soundEnabled = value;
                  });
                },
                isTablet,
              ),
              
              _buildNotificationOption(
                'Vibration',
                'Vibrer lors des notifications',
                Icons.vibration_outlined,
                _vibrationEnabled,
                (value) {
                  setState(() {
                    _vibrationEnabled = value;
                  });
                },
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Section Heures silencieuses
              Text(
                'Heures silencieuses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 22 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              SizedBox(height: isTablet ? 20 : 16),
              
              Container(
                padding: EdgeInsets.all(isTablet ? 20 : 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activer les heures silencieuses',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Switch(
                          value: false,
                          onChanged: (value) {
                            // Logique pour activer/désactiver les heures silencieuses
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                        ),
                      ],
                    ),
                    
                    SizedBox(height: isTablet ? 16 : 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'De',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: isTablet ? 16 : 14,
                              ),
                            ),
                            SizedBox(height: isTablet ? 8 : 6),
                            Text(
                              '22:00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isTablet ? 18 : 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'À',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: isTablet ? 16 : 14,
                              ),
                            ),
                            SizedBox(height: isTablet ? 8 : 6),
                            Text(
                              '07:00',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isTablet ? 18 : 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Bouton Tester les notifications
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton(
                  onPressed: _testNotification,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Tester les notifications',
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

  Widget _buildNotificationOption(
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

  void _testNotification() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Test de notification',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Une notification de test a été envoyée. Vérifiez vos paramètres si vous ne la recevez pas.',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

