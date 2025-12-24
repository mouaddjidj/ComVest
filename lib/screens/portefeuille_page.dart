import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';

class PortefeuillePage extends StatefulWidget {
  final Investor investor;

  const PortefeuillePage({super.key, required this.investor});

  @override
  State<PortefeuillePage> createState() => _PortefeuillePageState();
}

class _PortefeuillePageState extends State<PortefeuillePage> {
  String _selectedFilter = 'Tous';
  final List<String> _filters = ['Tous', 'Actions', 'Obligations', 'ETF', 'Cryptos'];

  // Données simulées du portefeuille
  final List<Asset> _assets = [
    Asset(
      name: 'LVMH',
      symbol: 'MC.PA',
      type: 'Action',
      quantity: 15,
      buyPrice: 650.5,
      currentPrice: 720.3,
      value: 10804.5,
      change: 10.7,
      sector: 'Luxe',
      logo: '👜',
    ),
    Asset(
      name: 'Airbus',
      symbol: 'AIR.PA',
      type: 'Action',
      quantity: 25,
      buyPrice: 120.2,
      currentPrice: 135.8,
      value: 3395.0,
      change: 13.0,
      sector: 'Aéronautique',
      logo: '✈️',
    ),
    Asset(
      name: 'Sanofi',
      symbol: 'SAN.PA',
      type: 'Action',
      quantity: 40,
      buyPrice: 85.4,
      currentPrice: 92.7,
      value: 3708.0,
      change: 8.5,
      sector: 'Pharmaceutique',
      logo: '💊',
    ),
    Asset(
      name: 'ETF CAC 40',
      symbol: 'CAC.PA',
      type: 'ETF',
      quantity: 8,
      buyPrice: 5500.0,
      currentPrice: 6100.5,
      value: 48804.0,
      change: 10.9,
      sector: 'Indice',
      logo: '📈',
    ),
    Asset(
      name: 'OAT 10 ans',
      symbol: 'FR0013',
      type: 'Obligation',
      quantity: 10000,
      buyPrice: 98.5,
      currentPrice: 99.2,
      value: 9920.0,
      change: 0.7,
      sector: 'État',
      logo: '📊',
    ),
    Asset(
      name: 'Ethereum',
      symbol: 'ETH',
      type: 'Crypto',
      quantity:  15,
      buyPrice: 2800.0,
      currentPrice: 3200.5,
      value: 1600.25,
      change: 14.3,
      sector: 'Crypto',
      logo: '₿',
    ),
    Asset(
      name: 'TotalEnergies',
      symbol: 'TTE.PA',
      type: 'Action',
      quantity: 20,
      buyPrice: 55.3,
      currentPrice: 60.1,
      value: 1202.0,
      change: 8.7,
      sector: 'Énergie',
      logo: '⛽',
    ),
    Asset(
      name: 'BNP Paribas',
      symbol: 'BNP.PA',
      type: 'Action',
      quantity: 30,
      buyPrice: 52.8,
      currentPrice: 58.4,
      value: 1752.0,
      change: 10.6,
      sector: 'Finance',
      logo: '🏦',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredAssets = _selectedFilter == 'Tous'
        ? _assets
        : _assets.where((asset) => asset.type == _selectedFilter).toList();

    final totalValue = _assets.fold(0.0, (sum, asset) => sum + asset.value);
    final totalInvested = _assets.fold(0.0, (sum, asset) => sum + (asset.buyPrice * asset.quantity));
    final totalGain = totalValue - totalInvested;
    final totalGainPercentage = totalInvested > 0 ? (totalGain / totalInvested) * 100 : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Portefeuille'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_chart, color: Color(0xFF7533E8)),
            onPressed: _showAddInvestment,
          ),
          IconButton(
            icon: const Icon(Icons.analytics, color: Color(0xFF7533E8)),
            onPressed: _showAnalytics,
          ),
        ],
      ),
      body: Column(
        children: [
          // En-tête du portefeuille
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7533E8), Color(0xFF9B59B6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Valeur totale du portefeuille',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${totalValue.toStringAsFixed(2)}€',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${totalGain >= 0 ? '+' : ''}${totalGain.toStringAsFixed(2)}€',
                      style: TextStyle(
                        color: totalGain >= 0 ? Colors.green[300] : Colors.red[300],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: totalGain >= 0 
                            ? Colors.green.withOpacity(0.2) 
                            : Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${totalGainPercentage >= 0 ? '+' : ''}${totalGainPercentage.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: totalGain >= 0 ? Colors.green[300] : Colors.red[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPortfolioStat(
                      label: 'Investi',
                      value: '${totalInvested.toStringAsFixed(2)}€',
                      color: Colors.white70,
                    ),
                    _buildPortfolioStat(
                      label: 'Performance',
                      value: '${totalGainPercentage.toStringAsFixed(2)}%',
                      color: totalGain >= 0 ? Colors.green : Colors.red, 
                    ),
                    _buildPortfolioStat(
                      label: 'Actifs',
                      value: '${_assets.length}',
                      color: Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Filtres
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: _selectedFilter == filter,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = selected ? filter : 'Tous';
                        });
                      },
                      selectedColor: const Color(0xFF7533E8),
                      checkmarkColor: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Répartition par type
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Répartition par type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildTypeChip('Actions', Colors.blue, 65),
                          const SizedBox(height: 10),
                          _buildTypeChip('ETF', Colors.green, 20),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _buildTypeChip('Obligations', Colors.purple, 10),
                          const SizedBox(height: 10),
                          _buildTypeChip('Cryptos', Colors.orange, 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Liste des actifs
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredAssets.length,
              itemBuilder: (context, index) {
                final asset = filteredAssets[index];
                return _buildAssetCard(asset);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddInvestment,
        backgroundColor: const Color(0xFF7533E8),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildPortfolioStat({
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChip(String type, Color color, int percentage) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              type,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '$percentage%',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetCard(Asset asset) {
    final gain = asset.currentPrice - asset.buyPrice;
    final gainPercentage = (gain / asset.buyPrice) * 100;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _showAssetDetails(asset),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Logo
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getAssetColor(asset.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      asset.logo,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Informations
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        asset.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${asset.symbol} • ${asset.quantity} ${asset.type == 'Action' || asset.type == 'ETF' ? 'actions' : 'unités'}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Valeur et performance
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${asset.value.toStringAsFixed(2)}€',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: gain >= 0 
                            ? Colors.green.withOpacity(0.1) 
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${gain >= 0 ? '+' : ''}${gainPercentage.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: gain >= 0 ? Colors.green : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getAssetColor(String type) {
    switch (type) {
      case 'Action':
        return Colors.blue;
      case 'ETF':
        return Colors.green;
      case 'Obligation':
        return Colors.purple;
      case 'Crypto':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _showAddInvestment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ajouter un investissement',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildFormField('Type d\'actif', Icons.category),
              const SizedBox(height: 15),
              _buildFormField('Symbole', Icons.tag),
              const SizedBox(height: 15),
              _buildFormField('Quantité', Icons.numbers),
              const SizedBox(height: 15),
              _buildFormField('Prix d\'achat', Icons.euro),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Investissement ajouté avec succès'),
                        backgroundColor: Color(0xFF2ECC71),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7533E8),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Ajouter'),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormField(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF7533E8)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF7533E8)),
        ),
      ),
    );
  }

  void _showAnalytics() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Analyses du portefeuille'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  leading: Icon(Icons.trending_up, color: Colors.green),
                  title: Text('Performance mensuelle'),
                  subtitle: Text('+5.2% ce mois'),
                ),
                const ListTile(
                  leading: Icon(Icons.pie_chart, color: Colors.blue),
                  title: Text('Diversification'),
                  subtitle: Text('Score: 8.5/10'),
                ),
                const ListTile(
                  leading: Icon(Icons.warning, color: Colors.orange),
                  title: Text('Niveau de risque'),
                  subtitle: Text('Modéré'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    _showDetailedAnalytics();
                  },
                  icon: const Icon(Icons.bar_chart),
                  label: const Text('Voir le rapport détaillé'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7533E8),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _showDetailedAnalytics() {
    // Implémentation pour un rapport détaillé
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Génération du rapport d\'analyses...'),
        backgroundColor: Color(0xFF7533E8),
      ),
    );
  }

  void _showAssetDetails(Asset asset) {
    final gain = asset.currentPrice - asset.buyPrice;
    final gainPercentage = (gain / asset.buyPrice) * 100;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getAssetColor(asset.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        asset.logo,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          asset.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${asset.symbol} • ${asset.type}',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Statistiques
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAssetStat('Quantité', '${asset.quantity}'),
                  _buildAssetStat('Prix actuel', '${asset.currentPrice}€'),
                  _buildAssetStat('Valeur', '${asset.value.toStringAsFixed(2)}€'),
                ],
              ),
              const SizedBox(height: 20),
              
              // Performance
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: gain >= 0 
                      ? Colors.green.withOpacity(0.1) 
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gain/Perte',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${gain >= 0 ? '+' : ''}${gain.toStringAsFixed(2)}€',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: gain >= 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Performance',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${gain >= 0 ? '+' : ''}${gainPercentage.toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: gain >= 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Actions
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _showSellDialog(asset),
                      icon: const Icon(Icons.sell),
                      label: const Text('Vendre'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _showBuyMoreDialog(asset),
                      icon: const Icon(Icons.add),
                      label: const Text('Acheter'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7533E8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAssetStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showSellDialog(Asset asset) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Vendre cet actif'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Combien d\'unités souhaitez-vous vendre ?'),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Quantité (max: ${asset.quantity})',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Vente de ${asset.name} effectuée'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Vendre'),
            ),
          ],
        );
      },
    );
  }

  void _showBuyMoreDialog(Asset asset) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Acheter plus d\'actions'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Combien d\'unités supplémentaires souhaitez-vous acheter ?'),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Quantité',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Text(
                'Prix actuel: ${asset.currentPrice}€ par unité',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Achat de ${asset.name} effectué'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Acheter'),
            ),
          ],
        );
      },
    );
  }
}

// Modèle pour les actifs
class Asset {
  final String name;
  final String symbol;
  final String type;
  final int quantity;
  final double buyPrice;
  final double currentPrice;
  final double value;
  final double change;
  final String sector;
  final String logo;

  Asset({
    required this.name,
    required this.symbol,
    required this.type,
    required this.quantity,
    required this.buyPrice,
    required this.currentPrice,
    required this.value,
    required this.change,
    required this.sector,
    required this.logo,
  });
}