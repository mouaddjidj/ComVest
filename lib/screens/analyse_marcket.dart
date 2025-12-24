import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';

class MarketAnalysisPage extends StatefulWidget {
  final Investor investor;
  
  const MarketAnalysisPage({super.key, required this.investor});

  @override
  State<MarketAnalysisPage> createState() => _MarketAnalysisPageState();
}

class _MarketAnalysisPageState extends State<MarketAnalysisPage> {
  int _selectedFilter = 0;
  
  final List<String> _filters = ['Tous', 'Croissance', 'Rendement', 'Risque'];
  final List<MarketTrend> _marketTrends = [
    MarketTrend(
      sector: 'Technologie',
      trend: '+12.5%',
      description: 'Croissance forte grâce aux innovations IA',
      companies: ['Capgemini', 'Dassault Systèmes'],
      color: Colors.blue,
    ),
    MarketTrend(
      sector: 'Énergie',
      trend: '+8.3%',
      description: 'Transition énergétique booste les investissements',
      companies: ['TotalEnergies', 'EDF'],
      color: Colors.orange,
    ),
    MarketTrend(
      sector: 'Santé',
      trend: '+15.2%',
      description: 'Biotechnologies en forte progression',
      companies: ['Sanofi', 'Biomérieux'],
      color: Colors.green,
    ),
    MarketTrend(
      sector: 'Luxe',
      trend: '+10.7%',
      description: 'Demande asiatique soutient la croissance',
      companies: ['LVMH', 'Hermès'],
      color: Colors.purple,
    ),
    MarketTrend(
      sector: 'Finance',
      trend: '+5.9%',
      description: 'Stabilité malgré l\'environnement de taux',
      companies: ['BNP Paribas', 'Société Générale'],
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Analyses marché',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7533E8), Color(0xFF9B59B6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7533E8).withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bonjour, ${widget.investor.firstName}!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Analysez les tendances du marché et identifiez les opportunités',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Market Overview
            const Text(
              'Vue d\'ensemble du marché',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            Row(
              children: [
                _buildMarketOverviewCard('CAC 40', '+7.8%', '7200 pts', Colors.green),
                const SizedBox(width: 10),
                _buildMarketOverviewCard('S&P 500', '+12.3%', '5200 pts', Colors.blue),
                const SizedBox(width: 10),
                _buildMarketOverviewCard('DAX', '+5.4%', '18200 pts', Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            // Filters
            const Text(
              'Filtrer par tendance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.asMap().entries.map((entry) {
                  int index = entry.key;
                  String filter = entry.value;
                  bool isSelected = _selectedFilter == index;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = index;
                        });
                      },
                      selectedColor: const Color(0xFF7533E8),
                      checkmarkColor: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Market Trends
            const Text(
              'Tendances par secteur',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            ..._marketTrends.map((trend) => _buildTrendCard(trend)),
            const SizedBox(height: 20),

            // Investment Recommendations
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
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
                    '💡 Recommandations d\'investissement',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Basé sur votre profil et les tendances actuelles',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  if (widget.investor.selectedIndustries.isNotEmpty)
                    Column(
                      children: widget.investor.selectedIndustries.map((industry) {
                        return ListTile(
                          leading: const Icon(Icons.star, color: Color(0xFF7533E8)),
                          title: Text('Augmenter l\'exposition en $industry'),
                          subtitle: Text('Croissance attendue: +10-15%'),
                        );
                      }).toList(),
                    ),
                  
                  const ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.green),
                    title: Text('Diversifier vers les énergies renouvelables'),
                    subtitle: Text('Potentiel de croissance: +20%'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.security, color: Colors.blue),
                    title: Text('Maintenir une position défensive en finance'),
                    subtitle: Text('Rendement stable: 4-6%'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Market News
            const Text(
              '📰 Actualités marché',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            _buildNewsCard(
              'Banque Centrale Européenne maintient ses taux',
              'Les taux directeurs restent stables, impact positif attendu sur les marchés',
              'Il y a 2h',
            ),
            _buildNewsCard(
              'Nouveaux records pour l\'IA en bourse',
              'Les valeurs technologiques atteignent de nouveaux sommets',
              'Il y a 5h',
            ),
            _buildNewsCard(
              'Accord commercial UE-Asie signé',
              'Nouvelles opportunités pour les exportateurs européens',
              'Il y a 1 jour',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketOverviewCard(String index, String change, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
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
            Text(
              index,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              change,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendCard(MarketTrend trend) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: trend.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.trending_up,
                color: trend.color,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trend.sector,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      trend.trend,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: trend.trend.startsWith('+') ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  trend.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Entreprises clés: ${trend.companies.join(", ")}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String content, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class MarketTrend {
  final String sector;
  final String trend;
  final String description;
  final List<String> companies;
  final Color color;

  MarketTrend({
    required this.sector,
    required this.trend,
    required this.description,
    required this.companies,
    required this.color,
  });
}