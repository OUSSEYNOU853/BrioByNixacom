import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              SizedBox(height: isTablet ? 60 : 40),
              
              // Logo BRIO
              Container(
                margin: EdgeInsets.only(bottom: isTablet ? 60 : 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: isTablet ? 80 : 60,
                      height: isTablet ? 80 : 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
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
                'Connectez vous à votre compte',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 28 : 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isTablet ? 40 : 30),
              
              // Champ Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
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
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'ousmanendiaye99@gmail.com',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: isTablet ? 18 : 16,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
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
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              // Champ Mot de passe
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mot de Passe',
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
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 18 : 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Votre Mot de Passe',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: isTablet ? 18 : 16,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
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
              ),
              
              SizedBox(height: isTablet ? 16 : 12),
              
              // Mot de passe oublié
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Mot de Passe oublié?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isTablet ? 18 : 16,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 40 : 30),
              
              // Bouton Se connecter
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Se Connecter',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 24 : 20),
              
              // Pas de compte
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pas de compte? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isTablet ? 18 : 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: isTablet ? 40 : 30),
              
              // Divider OU
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[600],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isTablet ? 20 : 16),
                    child: Text(
                      'OU',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: isTablet ? 32 : 24),
              
              // Bouton Google
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logique de connexion Google
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A2A2A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: Icon(
                    Icons.g_mobiledata,
                    size: isTablet ? 32 : 28,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Se Connecter avec Google',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 16 : 12),
              
              // Bouton Facebook
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logique de connexion Facebook
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A2A2A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: Icon(
                    Icons.facebook,
                    size: isTablet ? 32 : 28,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'Se Connecter avec Facebook',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 16 : 12),
              
              // Bouton Apple
              SizedBox(
                width: double.infinity,
                height: isTablet ? 64 : 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logique de connexion Apple
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A2A2A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: Icon(
                    Icons.apple,
                    size: isTablet ? 32 : 28,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Se connecter avec Apple',
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isTablet ? 40 : 20),
            ],
          ),
        ),
      ),
    );
  }
}

