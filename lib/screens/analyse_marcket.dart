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
      sector: 'E-commerce',
      trend: '+15.2%',
      description: 'Fort développement du commerce en ligne en Algérie',
      companies: ['TalabaStore', 'Okadoo'],
      color: Color(0xFF2ECC71),
    ),
    MarketTrend(
      sector: 'Fintech',
      trend: '+18.7%',
      description: 'Adoption rapide des solutions de paiement digital',
      companies: ['ALPAY'],
      color: Color(0xFF3498DB),
    ),
    MarketTrend(
      sector: 'Mobilité',
      trend: '+12.4%',
      description: 'Services de transport digital en pleine expansion',
      companies: ['TemTem'],
      color: Color(0xFFE67E22),
    ),
    MarketTrend(
      sector: 'Technologie',
      trend: '+22.3%',
      description: 'Startups technologiques algériennes en forte croissance',
      companies: ['TalabaStore', 'ALPAY'],
      color: Color(0xFF9B59B6),
    ),
    MarketTrend(
      sector: 'Services',
      trend: '+8.9%',
      description: 'Services digitaux B2B en développement constant',
      companies: ['Okadoo', 'TemTem'],
      color: Color(0xFF7533E8),
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
            // Welcome Card - Même style que le dashboard
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
                    'Analyses marché',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bonjour, ${widget.investor.firstName}!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Suivez les tendances et identifiez les opportunités en Algérie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Market Overview - Adapter pour le marché algérien
            const Text(
              'Vue d\'ensemble du marché algérien',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            Row(
              children: [
                _buildMarketOverviewCard('Startups', '+25.3%', '46.7B DA', Color(0xFF2ECC71)),
                const SizedBox(width: 10),
                _buildMarketOverviewCard('Investissements', '+18.7%', '12.4B DA', Color(0xFF3498DB)),
                const SizedBox(width: 10),
                _buildMarketOverviewCard('PME Tech', '+22.1%', '8.9B DA', Color(0xFF9B59B6)),
              ],
            ),
            const SizedBox(height: 20),

            // Filters - Garder le même style
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

            // Market Trends - Adapter aux entreprises algériennes
            const Text(
              'Tendances par secteur en Algérie',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            ..._marketTrends.map((trend) => _buildTrendCard(trend)),
            const SizedBox(height: 20),

            // Investment Recommendations - Basé sur les entreprises du dashboard
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
                    'Basé sur les entreprises disponibles et votre profil',
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
                          title: Text('Opportunités en $industry'),
                          subtitle: Text('Croissance attendue: +15-20%'),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: () {
                              // Naviguer vers les entreprises de ce secteur
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                          ),
                        );
                      }).toList(),
                    ),
                  
                  const SizedBox(height: 10),
                  
                  // Recommandations spécifiques pour les entreprises du dashboard
                  ListTile(
                    leading: const Icon(Icons.trending_up, color: Colors.green),
                    title: const Text('Fintech: Fort potentiel de croissance'),
                    subtitle: const Text('ALPAY: +35% de croissance prévue'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart, color: Colors.orange),
                    title: const Text('E-commerce: Marché en expansion'),
                    subtitle: const Text('TalabaStore: +28% de croissance'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_car, color: Colors.blue),
                    title: const Text('Mobilité: Services en demande'),
                    subtitle: const Text('TemTem: +22% de croissance'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.business, color: Colors.purple),
                    title: const Text('Marketplace B2B: Opportunité stable'),
                    subtitle: const Text('Okadoo: +18% de croissance'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Market News - Actualités algériennes
            const Text(
              '📰 Actualités marché algérien',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            _buildNewsCard(
              'Levée de fonds record pour une startup algérienne',
              'Une startup de fintech algérienne lève 5M Dollar pour son expansion régionale',
              'Il y a 2 jours',
            ),
            _buildNewsCard(
              'Croissance du e-commerce en Algérie',
              'Le marché du e-commerce enregistre une croissance de 40% cette année',
              'Il y a 3 jours',
            ),
            _buildNewsCard(
              'Nouvelle régulation pour les fintech',
              'La banque centrale algérienne simplifie les régulations pour les startups fintech',
              'Il y a 1 semaine',
            ),
            _buildNewsCard(
              'Investissement dans la mobilité urbaine',
              'Plusieurs investisseurs s\'intéressent aux solutions de mobilité en Algérie',
              'Il y a 1 semaine',
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
                  'Entreprises: ${trend.companies.join(", ")}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF7533E8),
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