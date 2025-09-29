import 'package:flutter/material.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final TextEditingController _firstNameController = TextEditingController(text: 'Ousmane');
  final TextEditingController _lastNameController = TextEditingController(text: 'Ndiaye');
  final TextEditingController _emailController = TextEditingController(text: 'ousmanendiaye99@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+221 77 123 45 67');
  final TextEditingController _addressController = TextEditingController(text: 'Dakar, Sénégal');
  
  bool _isEditing = false;

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
          'Informations sur le compte',
          style: TextStyle(
            color: Colors.white,
            fontSize: isTablet ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
            child: Text(
              _isEditing ? 'Sauvegarder' : 'Modifier',
              style: TextStyle(
                color: Colors.white,
                fontSize: isTablet ? 18 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isTablet ? 32 : 24),
          child: Column(
            children: [
              // Photo de profil
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: isTablet ? 120 : 100,
                      height: isTablet ? 120 : 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: isTablet ? 60 : 50,
                      ),
                    ),
                    if (_isEditing)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: isTablet ? 36 : 32,
                          height: isTablet ? 36 : 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: isTablet ? 20 : 18,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              
              SizedBox(height: isTablet ? 40 : 32),
              
              // Champs d'information
              _buildInfoField(
                'Prénom',
                _firstNameController,
                Icons.person_outline,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              _buildInfoField(
                'Nom',
                _lastNameController,
                Icons.person_outline,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              _buildInfoField(
                'Email',
                _emailController,
                Icons.email_outlined,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              _buildInfoField(
                'Téléphone',
                _phoneController,
                Icons.phone_outlined,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              _buildInfoField(
                'Adresse',
                _addressController,
                Icons.location_on_outlined,
                isTablet,
              ),
              
              SizedBox(height: isTablet ? 40 : 32),
              
              // Informations du compte
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isTablet ? 24 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informations du compte',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 20 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    SizedBox(height: isTablet ? 20 : 16),
                    
                    _buildAccountInfo('Date de création', '15 Octobre 2024', isTablet),
                    _buildAccountInfo('Statut du compte', 'Actif', isTablet),
                    _buildAccountInfo('Type de compte', 'Standard', isTablet),
                    _buildAccountInfo('Dernière connexion', 'Aujourd\'hui, 15:30', isTablet),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField(
    String label,
    TextEditingController controller,
    IconData icon,
    bool isTablet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: isTablet ? 18 : 16,
          ),
        ),
        SizedBox(height: isTablet ? 10 : 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            enabled: _isEditing,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 18 : 16,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
                size: isTablet ? 28 : 24,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: isTablet ? 20 : 16,
                vertical: isTablet ? 20 : 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountInfo(String label, String value, bool isTablet) {
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
}

