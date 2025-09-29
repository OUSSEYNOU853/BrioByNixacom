import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedFilter = 'Tous';

  final List<TransactionModel> _transactions = [
    TransactionModel(
      title: 'La Brioche Dorée',
      date: '10/10/2024-15:30',
      points: '-5000 pt',
      imagePath: 'images/brioche_logo.png',
      type: 'exchange',
    ),
    TransactionModel(
      title: 'Auchan',
      date: '09/10/2024-12:15',
      points: '+2500 pt',
      imagePath: 'images/auchan_logo.png',
      type: 'earn',
    ),
    TransactionModel(
      title: 'McDo',
      date: '08/10/2024-18:45',
      points: '-3000 pt',
      imagePath: 'images/mcdonald_logo.png',
      type: 'exchange',
    ),
    TransactionModel(
      title: 'Carrefour',
      date: '07/10/2024-14:20',
      points: '+1500 pt',
      imagePath: 'images/carrefour_logo.png',
      type: 'earn',
    ),
    TransactionModel(
      title: 'KFC',
      date: '06/10/2024-19:30',
      points: '-2000 pt',
      imagePath: 'images/kfc_logo.png',
      type: 'exchange',
    ),
    TransactionModel(
      title: 'Monoprix',
      date: '05/10/2024-11:00',
      points: '+3500 pt',
      imagePath: 'images/monoprix_logo.png',
      type: 'earn',
    ),
  ];

  List<TransactionModel> get _filteredTransactions {
    if (_selectedFilter == 'Tous') {
      return _transactions;
    } else if (_selectedFilter == 'Gains') {
      return _transactions.where((t) => t.type == 'earn').toList();
    } else {
      return _transactions.where((t) => t.type == 'exchange').toList();
    }
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
          'Historique des transactions',
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
              // Filtres
              Row(
                children: [
                  _buildFilterChip('Tous'),
                  const SizedBox(width: 12),
                  _buildFilterChip('Gains'),
                  const SizedBox(width: 12),
                  _buildFilterChip('Échanges'),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Résumé
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ce mois-ci',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: Colors.green,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Gains',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '+7500 pt',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_down,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Échanges',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '-10000 pt',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Liste des transactions
              Expanded(
                child: ListView.separated(
                  itemCount: _filteredTransactions.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final transaction = _filteredTransactions[index];
                    return _buildTransactionItem(transaction);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem(TransactionModel transaction) {
    Color pointsColor = transaction.type == 'earn' ? Colors.green : Colors.red;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                transaction.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.store,
                    color: Colors.white,
                    size: 24,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.card_giftcard,
                color: Colors.orange,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                transaction.points,
                style: TextStyle(
                  color: pointsColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionModel {
  final String title;
  final String date;
  final String points;
  final String imagePath;
  final String type; // 'earn' or 'exchange'

  TransactionModel({
    required this.title,
    required this.date,
    required this.points,
    required this.imagePath,
    required this.type,
  });
}