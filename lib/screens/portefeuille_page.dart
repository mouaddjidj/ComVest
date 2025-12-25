import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';
import 'package:intl/intl.dart';

class PortefeuillePage extends StatefulWidget {
  final Investor investor;

  const PortefeuillePage({super.key, required this.investor});

  @override
  State<PortefeuillePage> createState() => _PortefeuillePageState();
}

class _PortefeuillePageState extends State<PortefeuillePage> {
  String _selectedFilter = 'Tous';
  final List<String> _filters = ['Tous', 'Startups', 'E-commerce', 'Fintech', 'Mobilité'];

  // Données simulées du portefeuille avec entreprises algériennes
  final List<Asset> _assets = [
    Asset(
      name: 'ALPAY',
      symbol: 'ALPAY',
      type: 'Fintech',
      quantity: 1600,
      buyPrice: 8500,
      currentPrice: 15000,
      value: 24000000,
      change: 76.5,
      sector: 'Fintech',
      logo: '💳',
      imagePath: 'assets/images/alpay.png',
    ),
    Asset(
      name: 'TalabaStore',
      symbol: 'TALABA',
      type: 'E-commerce',
      quantity: 600,
      buyPrice: 1250,
      currentPrice: 2100,
      value: 1260000,
      change: 68.0,
      sector: 'E-commerce',
      logo: '🎓',
      imagePath: 'assets/images/talabastore.png',
    ),
    Asset(
      name: 'TemTem',
      symbol: 'TEMTEM',
      type: 'Mobilité',
      quantity: 2000,
      buyPrice: 4350,
      currentPrice: 10000,
      value: 20000000,
      change: 129.9,
      sector: 'Mobilité',
      logo: '🚗',
      imagePath: 'assets/images/temtem.png',
    ),
    Asset(
      name: 'Okadoo',
      symbol: 'OKADOO',
      type: 'Marketplace',
      quantity: 1200,
      buyPrice: 8500,
      currentPrice: 11016,
      value: 13219200,
      change: 29.6,
      sector: 'E-commerce',
      logo: '🛒',
      imagePath: 'assets/images/okadoo.png',
    ),
    Asset(
      name: 'Djezzy',
      symbol: 'DJEZZY',
      type: 'Télécom',
      quantity: 500,
      buyPrice: 28000,
      currentPrice: 32000,
      value: 16000000,
      change: 14.3,
      sector: 'Télécommunications',
      logo: '📱',
      imagePath: 'assets/images/djezzy.png',
    ),
    Asset(
      name: 'NCA-Rouiba',
      symbol: 'NCA',
      type: 'Agroalimentaire',
      quantity: 800,
      buyPrice: 18500,
      currentPrice: 21000,
      value: 16800000,
      change: 13.5,
      sector: 'Agroalimentaire',
      logo: '🥫',
      imagePath: 'assets/images/nca.png',
    ),
    Asset(
      name: 'Cevital',
      symbol: 'CEVITAL',
      type: 'Conglomérat',
      quantity: 300,
      buyPrice: 45000,
      currentPrice: 52000,
      value: 15600000,
      change: 15.6,
      sector: 'Industrie',
      logo: '🏭',
      imagePath: 'assets/images/cevital.png',
    ),
    Asset(
      name: 'Sofac',
      symbol: 'SOFAC',
      type: 'Finance',
      quantity: 1000,
      buyPrice: 12000,
      currentPrice: 14500,
      value: 14500000,
      change: 20.8,
      sector: 'Finance',
      logo: '🏦',
      imagePath: 'assets/images/sofac.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredAssets = _selectedFilter == 'Tous'
        ? _assets
        : _assets.where((asset) => _selectedFilter == 'Startups'
            ? ['Fintech', 'E-commerce', 'Mobilité', 'Marketplace'].contains(asset.type)
            : asset.type == _selectedFilter).toList();

    final totalValue = _assets.fold(0.0, (sum, asset) => sum + asset.value);
    final totalInvested = _assets.fold(0.0, (sum, asset) => sum + (asset.buyPrice * asset.quantity));
    final totalGain = totalValue - totalInvested;
    final totalGainPercentage = totalInvested > 0 ? (totalGain / totalInvested) * 100 : 0;

    final currencyFormat = NumberFormat.currency(locale: 'fr_DZ', symbol: 'DA', decimalDigits: 0);

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
                  '${currencyFormat.format(totalValue)}',
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
                      '${totalGain >= 0 ? '+' : ''}${currencyFormat.format(totalGain)}',
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
                      value: '${currencyFormat.format(totalInvested)}',
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

          // Répartition par secteur
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
                  'Répartition par secteur',
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
                          _buildTypeChip('Fintech', Colors.purple, 25),
                          const SizedBox(height: 10),
                          _buildTypeChip('E-commerce', Colors.blue, 20),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _buildTypeChip('Mobilité', Colors.orange, 15),
                          const SizedBox(height: 10),
                          _buildTypeChip('Télécom', Colors.green, 12),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _buildTypeChip('Industrie', Colors.red, 18),
                          const SizedBox(height: 10),
                          _buildTypeChip('Finance', Colors.teal, 10),
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
                return _buildAssetCard(asset, currencyFormat);
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

  Widget _buildAssetCard(Asset asset, NumberFormat currencyFormat) {
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
                // Logo/Image
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getAssetColor(asset.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: _getAssetColor(asset.type).withOpacity(0.3)),
                  ),
                  child: Center(
                    child: asset.imagePath.isNotEmpty
                        ? Image.asset(
                            asset.imagePath,
                            width: 35,
                            height: 35,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                asset.logo,
                                style: const TextStyle(fontSize: 20),
                              );
                            },
                          )
                        : Text(
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
                        '${asset.symbol} • ${asset.quantity} actions',
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
                      currencyFormat.format(asset.value),
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
                        '${gain >= 0 ? '+' : ''}${gainPercentage.toStringAsFixed(1)}%',
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
      case 'Fintech':
        return Colors.purple;
      case 'E-commerce':
        return Colors.blue;
      case 'Mobilité':
        return Colors.orange;
      case 'Marketplace':
        return Colors.blueAccent;
      case 'Télécom':
        return Colors.green;
      case 'Agroalimentaire':
        return Colors.brown;
      case 'Conglomérat':
        return Colors.red;
      case 'Finance':
        return Colors.teal;
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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Entreprise',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.business, color: Color(0xFF7533E8)),
                ),
                items: _assets.map((asset) {
                  return DropdownMenuItem(
                    value: asset.name,
                    child: Text(asset.name),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nombre d\'actions',
                  prefixIcon: Icon(Icons.numbers, color: Color(0xFF7533E8)),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Prix par action',
                  prefixIcon: const Icon(Icons.money, color: Color(0xFF7533E8)),
                  suffixText: 'DA',
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
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
                  subtitle: Text('+8.2% ce mois'),
                ),
                const ListTile(
                  leading: Icon(Icons.pie_chart, color: Colors.blue),
                  title: Text('Diversification'),
                  subtitle: Text('Score: 7.8/10'),
                ),
                const ListTile(
                  leading: Icon(Icons.warning, color: Colors.orange),
                  title: Text('Niveau de risque'),
                  subtitle: Text('Modéré-Élevé'),
                ),
                ListTile(
                  leading: const Icon(Icons.star, color: Color(0xFF7533E8)),
                  title: const Text('Meilleure performance'),
                  subtitle: Text('TemTem: +129.9%'),
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Génération du rapport d\'analyses...'),
        backgroundColor: Color(0xFF7533E8),
      ),
    );
  }

  void _showAssetDetails(Asset asset) {
    final currencyFormat = NumberFormat.currency(locale: 'fr_DZ', symbol: 'DA', decimalDigits: 0);
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
                      border: Border.all(color: _getAssetColor(asset.type).withOpacity(0.3)),
                    ),
                    child: Center(
                      child: asset.imagePath.isNotEmpty
                          ? Image.asset(
                              asset.imagePath,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            )
                          : Text(
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
                  _buildAssetStat('Prix actuel', currencyFormat.format(asset.currentPrice)),
                  _buildAssetStat('Valeur', currencyFormat.format(asset.value)),
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
                          '${gain >= 0 ? '+' : ''}${currencyFormat.format(asset.currentPrice * asset.quantity - asset.buyPrice * asset.quantity)}',
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
                          '${gain >= 0 ? '+' : ''}${gainPercentage.toStringAsFixed(1)}%',
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
    final currencyFormat = NumberFormat.currency(locale: 'fr_DZ', symbol: 'DA', decimalDigits: 0);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Vendre ${asset.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Prix actuel: ${currencyFormat.format(asset.currentPrice)} par action'),
              const SizedBox(height: 10),
              Text('Actions disponibles: ${asset.quantity}'),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Quantité à vendre (max: ${asset.quantity})',
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
    final currencyFormat = NumberFormat.currency(locale: 'fr_DZ', symbol: 'DA', decimalDigits: 0);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Acheter ${asset.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Prix actuel: ${currencyFormat.format(asset.currentPrice)} par action'),
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
              const Text(
                'Montant estimé:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currencyFormat.format(asset.currentPrice * 10), // Exemple pour 10 actions
                style: const TextStyle(
                  fontSize: 18,
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

// Modèle pour les actifs avec image
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
  final String imagePath;

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
    this.imagePath = '',
  });
}