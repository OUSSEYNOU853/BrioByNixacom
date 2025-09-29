import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
      id: '1',
      type: 'Carte de crédit',
      details: '**** **** **** 1234',
      icon: Icons.credit_card,
      isDefault: true,
    ),
    PaymentMethod(
      id: '2',
      type: 'Mobile Money',
      details: '+221 77 123 45 67',
      icon: Icons.phone_android,
      isDefault: false,
    ),
    PaymentMethod(
      id: '3',
      type: 'Compte bancaire',
      details: 'Banque Atlantique - ****5678',
      icon: Icons.account_balance,
      isDefault: false,
    ),
  ];

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
          'Modes de paiement',
          style: TextStyle(
            color: Colors.white,
            fontSize: isTablet ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 32 : 24),
          child: Column(
            children: [
              // Bouton Ajouter un mode de paiement
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton.icon(
                  onPressed: _showAddPaymentMethodDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: Icon(
                    Icons.add,
                    size: isTablet ? 28 : 24,
                  ),
                  label: Text(
                    'Ajouter un mode de paiement',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Liste des modes de paiement
              Expanded(
                child: ListView.builder(
                  itemCount: _paymentMethods.length,
                  itemBuilder: (context, index) {
                    return _buildPaymentMethodCard(
                      _paymentMethods[index],
                      isTablet,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(PaymentMethod method, bool isTablet) {
    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 16 : 12),
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
        border: method.isDefault
            ? Border.all(color: Colors.white, width: 2)
            : null,
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
              method.icon,
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
                      method.type,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (method.isDefault) ...[
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
                          'Par défaut',
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
                  method.details,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ],
            ),
          ),
          
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey,
              size: isTablet ? 28 : 24,
            ),
            color: const Color(0xFF2A2A2A),
            onSelected: (value) {
              switch (value) {
                case 'default':
                  _setAsDefault(method);
                  break;
                case 'edit':
                  _editPaymentMethod(method);
                  break;
                case 'delete':
                  _deletePaymentMethod(method);
                  break;
              }
            },
            itemBuilder: (context) => [
              if (!method.isDefault)
                PopupMenuItem(
                  value: 'default',
                  child: Text(
                    'Définir par défaut',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 16 : 14,
                    ),
                  ),
                ),
              PopupMenuItem(
                value: 'edit',
                child: Text(
                  'Modifier',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  'Supprimer',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: isTablet ? 16 : 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddPaymentMethodDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Ajouter un mode de paiement',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPaymentOption('Carte de crédit', Icons.credit_card),
            _buildPaymentOption('Mobile Money', Icons.phone_android),
            _buildPaymentOption('Compte bancaire', Icons.account_balance),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        // Logique pour ajouter le mode de paiement
      },
    );
  }

  void _setAsDefault(PaymentMethod method) {
    setState(() {
      for (var pm in _paymentMethods) {
        pm.isDefault = pm.id == method.id;
      }
    });
  }

  void _editPaymentMethod(PaymentMethod method) {
    // Logique pour modifier le mode de paiement
  }

  void _deletePaymentMethod(PaymentMethod method) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Supprimer le mode de paiement',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Êtes-vous sûr de vouloir supprimer ce mode de paiement ?',
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
              setState(() {
                _paymentMethods.remove(method);
              });
              Navigator.pop(context);
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
}

class PaymentMethod {
  final String id;
  final String type;
  final String details;
  final IconData icon;
  bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.details,
    required this.icon,
    required this.isDefault,
  });
}

