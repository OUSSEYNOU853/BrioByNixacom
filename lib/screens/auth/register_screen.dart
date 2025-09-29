import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  String? _profileImagePath;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 40 : 24,
            vertical: isTablet ? 32 : 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: isTablet ? 40 : 20),
              
              // Logo BRIO
              Container(
                margin: EdgeInsets.only(bottom: isTablet ? 60 : 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: isTablet ? 60 : 50,
                      height: isTablet ? 60 : 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Titre
              Text(
                'Créez votre compte',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 28 : 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isTablet ? 40 : 30),
              
              // Photo de profil
              GestureDetector(
                onTap: _selectProfileImage,
                child: Container(
                  width: isTablet ? 120 : 100,
                  height: isTablet ? 120 : 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: Colors.grey[600]!,
                      width: 2,
                    ),
                  ),
                  child: _profileImagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Image.asset(
                            _profileImagePath!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[400],
                          size: isTablet ? 40 : 32,
                        ),
                ),
              ),
              
              SizedBox(height: isTablet ? 8 : 6),
              
              Text(
                'Ajouter une photo de profil',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: isTablet ? 16 : 14,
                ),
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Champs Prénom et Nom sur la même ligne
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _firstNameController,
                      label: 'Prénom',
                      hint: 'Votre prénom',
                      icon: Icons.person_outline,
                      isTablet: isTablet,
                    ),
                  ),
                  SizedBox(width: isTablet ? 16 : 12),
                  Expanded(
                    child: _buildTextField(
                      controller: _lastNameController,
                      label: 'Nom',
                      hint: 'Votre nom',
                      icon: Icons.person_outline,
                      isTablet: isTablet,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              // Champ Email
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'votre@email.com',
                icon: Icons.email_outlined,
                isTablet: isTablet,
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              // Champ Mot de passe
              _buildTextField(
                controller: _passwordController,
                label: 'Mot de passe',
                hint: 'Votre mot de passe',
                icon: Icons.lock_outline,
                isPassword: true,
                isTablet: isTablet,
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              // Champ Confirmer mot de passe
              _buildTextField(
                controller: _confirmPasswordController,
                label: 'Confirmer le mot de passe',
                hint: 'Confirmez votre mot de passe',
                icon: Icons.lock_outline,
                isPassword: true,
                isTablet: isTablet,
              ),
              
              SizedBox(height: isTablet ? 40 : 30),
              
              // Bouton S'inscrire
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Logique d'inscription
                    _showSuccessDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              // Déjà un compte
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Déjà un compte? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isTablet ? 18 : 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Se connecter',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: isTablet ? 40 : 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    required bool isTablet,
  }) {
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
            obscureText: isPassword,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 18 : 16,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: isTablet ? 18 : 16,
              ),
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

  void _selectProfileImage() {
    // Simuler la sélection d'image
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2A2A2A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choisir une photo de profil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageOption(
                    'Caméra',
                    Icons.camera_alt,
                    () {
                      Navigator.pop(context);
                      setState(() {
                        _profileImagePath = 'assets/images/logo.png';
                      });
                    },
                  ),
                  _buildImageOption(
                    'Galerie',
                    Icons.photo_library,
                    () {
                      Navigator.pop(context);
                      setState(() {
                        _profileImagePath = 'assets/images/logo.png';
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageOption(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A2A2A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Inscription réussie',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter.',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

