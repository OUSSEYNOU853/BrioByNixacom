import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Gagnez des récompenses',
      description: 'Collectez des points à chaque achat et échangez-les contre des récompenses exclusives.',
      icon: Icons.card_giftcard,
      color: Colors.orange,
    ),
    OnboardingPage(
      title: 'Transférez facilement',
      description: 'Envoyez de l\'argent à vos proches en quelques clics, de manière sécurisée.',
      icon: Icons.send_rounded,
      color: Colors.blue,
    ),
    OnboardingPage(
      title: 'Suivez vos transactions',
      description: 'Gardez un œil sur toutes vos transactions et votre historique de points.',
      icon: Icons.analytics_rounded,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Header avec logo
            Padding(
              padding: EdgeInsets.all(isTablet ? 32 : 24),
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
            
            // PageView pour les slides
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(_pages[index], isTablet);
                },
              ),
            ),
            
            // Indicateurs de page
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isTablet ? 32 : 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildPageIndicator(index, isTablet),
                ),
              ),
            ),
            
            // Bouton Get Started
            Padding(
              padding: EdgeInsets.all(isTablet ? 32 : 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: isTablet ? 64 : 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  if (_currentPage < _pages.length - 1) ...[
                    SizedBox(height: isTablet ? 16 : 12),
                    TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'Suivant',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: isTablet ? 18 : 16,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingPage page, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 60 : 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icône
          Container(
            width: isTablet ? 120 : 100,
            height: isTablet ? 120 : 100,
            decoration: BoxDecoration(
              color: page.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              page.icon,
              size: isTablet ? 60 : 50,
              color: page.color,
            ),
          ),
          
          SizedBox(height: isTablet ? 40 : 32),
          
          // Titre
          Text(
            page.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 32 : 28,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: isTablet ? 24 : 20),
          
          // Description
          Text(
            page.description,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: isTablet ? 20 : 18,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index, bool isTablet) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: isTablet ? 6 : 4),
      width: _currentPage == index 
          ? (isTablet ? 32 : 24) 
          : (isTablet ? 12 : 8),
      height: isTablet ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey[600],
        borderRadius: BorderRadius.circular(isTablet ? 6 : 4),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

