import 'package:flutter/material.dart';

class AllRewardsScreen extends StatefulWidget {
  const AllRewardsScreen({super.key});

  @override
  State<AllRewardsScreen> createState() => _AllRewardsScreenState();
}

class _AllRewardsScreenState extends State<AllRewardsScreen> {
  String _selectedCategory = 'Tous';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<RewardModel> _allRewards = [
    RewardModel(
      title: 'La Brioche Dorée',
      description: '50% de réduction sur votre prochain achat',
      progress: '50/50',
      category: 'Restaurants',
      imagePath: 'images/brioche_logo.png',
      canExchange: true,
      pointsRequired: 5000,
    ),
    RewardModel(
      title: 'Auchan',
      description: 'Livraison gratuite sur la prochaine commande',
      progress: '300/750',
      category: 'Magasins',
      imagePath: 'images/auchan_logo.png',
      canExchange: false,
      pointsRequired: 7500,
    ),
    RewardModel(
      title: 'McDonald\'s',
      description: 'Menu gratuit au choix',
      progress: '75/100',
      category: 'Restaurants',
      imagePath: 'images/mcdonald_logo.png',
      canExchange: false,
      pointsRequired: 10000,
    ),
    RewardModel(
      title: 'Hotel Teranga',
      description: '2 nuits gratuites + petit déjeuner',
      progress: '40/200',
      category: 'Hotels',
      imagePath: 'images/hotel_logo.png',
      canExchange: false,
      pointsRequired: 20000,
    ),
    RewardModel(
      title: 'KFC',
      description: 'Bucket familial gratuit',
      progress: '80/80',
      category: 'Restaurants',
      imagePath: 'images/kfc_logo.png',
      canExchange: true,
      pointsRequired: 8000,
    ),
    RewardModel(
      title: 'Carrefour',
      description: '25% de réduction sur tous vos achats',
      progress: '120/150',
      category: 'Magasins',
      imagePath: 'images/carrefour_logo.png',
      canExchange: false,
      pointsRequired: 15000,
    ),
    RewardModel(
      title: 'Radisson Blu',
      description: 'Une nuit gratuite en chambre deluxe',
      progress: '30/100',
      category: 'Hotels',
      imagePath: 'images/radisson_logo.png',
      canExchange: false,
      pointsRequired: 30000,
    ),
    RewardModel(
      title: 'Pizza Hut',
      description: 'Pizza large au choix gratuite',
      progress: '60/60',
      category: 'Restaurants',
      imagePath: 'images/pizzahut_logo.png',
      canExchange: true,
      pointsRequired: 6000,
    ),
  ];

  List<RewardModel> get _filteredRewards {
    List<RewardModel> filtered = _allRewards;
    
    // Filtrer par catégorie
    if (_selectedCategory != 'Tous') {
      filtered = filtered.where((reward) => reward.category == _selectedCategory).toList();
    }
    
    // Filtrer par recherche
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((reward) =>
        reward.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        reward.description.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Toutes les récompenses',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barre de recherche
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Rechercher une récompense...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Filtres par catégorie
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryFilter('Tous'),
                    const SizedBox(width: 12),
                    _buildCategoryFilter('Restaurants'),
                    const SizedBox(width: 12),
                    _buildCategoryFilter('Magasins'),
                    const SizedBox(width: 12),
                    _buildCategoryFilter('Hotels'),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Statistiques rapides
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Disponibles',
                      _filteredRewards.where((r) => r.canExchange).length.toString(),
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'En cours',
                      _filteredRewards.where((r) => !r.canExchange).length.toString(),
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Liste des récompenses
              Expanded(
                child: _filteredRewards.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      itemCount: _filteredRewards.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final reward = _filteredRewards[index];
                        return _buildRewardCard(reward);
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter(String category) {
    bool isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(RewardModel reward) {
    List<String> progressParts = reward.progress.split('/');
    double progressValue = double.parse(progressParts[0]) / double.parse(progressParts[1]);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: reward.canExchange 
          ? Border.all(color: Colors.orange.withOpacity(0.3), width: 1)
          : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: Colors.grey[600],
                    child: Icon(
                      _getCategoryIcon(reward.category),
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          reward.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(reward.category),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            reward.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reward.description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.card_giftcard,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${reward.pointsRequired} points',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: reward.canExchange ? () => _showExchangeDialog(reward) : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: reward.canExchange ? Colors.white : Colors.grey[600],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Échanger',
                    style: TextStyle(
                      color: reward.canExchange ? Colors.black : Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progression',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    reward.progress,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey[700],
                valueColor: AlwaysStoppedAnimation<Color>(
                  reward.canExchange ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            color: Colors.grey[600],
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            'Aucune récompense trouvée',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Essayez de modifier vos filtres ou votre recherche',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Restaurants':
        return Icons.restaurant;
      case 'Magasins':
        return Icons.shopping_bag;
      case 'Hotels':
        return Icons.hotel;
      default:
        return Icons.card_giftcard;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Restaurants':
        return Colors.red;
      case 'Magasins':
        return Colors.blue;
      case 'Hotels':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  void _showExchangeDialog(RewardModel reward) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF2A2A2A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Échanger ${reward.pointsRequired} points ?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  reward.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Annuler',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _showSuccessDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Confirmer'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF2A2A2A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Échange réussi !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Votre récompense a été échangée avec succès.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Fermer'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class RewardModel {
  final String title;
  final String description;
  final String progress;
  final String category;
  final String imagePath;
  final bool canExchange;
  final int pointsRequired;

  RewardModel({
    required this.title,
    required this.description,
    required this.progress,
    required this.category,
    required this.imagePath,
    required this.canExchange,
    required this.pointsRequired,
  });
}