import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';
import '../l10n/app_localizations.dart'; // IMPORT IMPORTANT !

class MarketAnalysisPage extends StatefulWidget {
  final Investor investor;
  
  const MarketAnalysisPage({super.key, required this.investor});

  @override
  State<MarketAnalysisPage> createState() => _MarketAnalysisPageState();
}

class _MarketAnalysisPageState extends State<MarketAnalysisPage> {
  int _selectedFilter = 0;
  List<String> _filters = [];
  List<MarketTrend> _marketTrends = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    // Initialiser les filtres et tendances avec les localisations
    if (_filters.isEmpty) {
      _filters = [
        localizations.all,
        localizations.growth,
        localizations.yield,
        localizations.risk,
      ];
    }
    
    if (_marketTrends.isEmpty) {
      _marketTrends = [
        MarketTrend(
          sector: localizations.ecommerce,
          trend: '+15.2%',
          description: localizations.ecommerceGrowthDescription,
          companies: ['TalabaStore', 'Okadoo'],
          color: const Color(0xFF2ECC71),
        ),
        MarketTrend(
          sector: localizations.fintech,
          trend: '+18.7%',
          description: localizations.fintechGrowthDescription,
          companies: ['ALPAY'],
          color: const Color(0xFF3498DB),
        ),
        MarketTrend(
          sector: localizations.mobility,
          trend: '+12.4%',
          description: localizations.mobilityGrowthDescription,
          companies: ['TemTem'],
          color: const Color(0xFFE67E22),
        ),
        MarketTrend(
          sector: localizations.technology,
          trend: '+22.3%',
          description: localizations.techGrowthDescription,
          companies: ['TalabaStore', 'ALPAY'],
          color: const Color(0xFF9B59B6),
        ),
        MarketTrend(
          sector: localizations.services,
          trend: '+8.9%',
          description: localizations.servicesGrowthDescription,
          companies: ['Okadoo', 'TemTem'],
          color: const Color(0xFF7533E8),
        ),
      ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          localizations.marketAnalysis,
          style: const TextStyle(
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
                    localizations.marketAnalysis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${localizations.hello}, ${widget.investor.firstName}!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localizations.marketAnalysisDescription,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Market Overview - Adapter pour le marché algérien
            Text(
              localizations.marketOverviewAlgeria,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            Row(
              children: [
                _buildMarketOverviewCard(localizations.startups, '+25.3%', '46.7B DA', const Color(0xFF2ECC71), localizations),
                const SizedBox(width: 10),
                _buildMarketOverviewCard(localizations.investments, '+18.7%', '12.4B DA', const Color(0xFF3498DB), localizations),
                const SizedBox(width: 10),
                _buildMarketOverviewCard(localizations.techSMEs, '+22.1%', '8.9B DA', const Color(0xFF9B59B6), localizations),
              ],
            ),
            const SizedBox(height: 20),

            // Filters - Garder le même style
            Text(
              localizations.filterByTrend,
              style: const TextStyle(
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
            Text(
              localizations.sectorTrendsAlgeria,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            ..._marketTrends.map((trend) => _buildTrendCard(trend, localizations)),
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
                  Text(
                    '💡 ${localizations.investmentRecommendations}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    localizations.basedOnCompaniesAndProfile,
                    style: const TextStyle(
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
                          title: Text('${localizations.opportunitiesIn} $industry'),
                          subtitle: Text('${localizations.expectedGrowth}: +15-20%'),
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
                    title: Text('${localizations.fintech}: ${localizations.highGrowthPotential}'),
                    subtitle: Text('ALPAY: ${localizations.expectedGrowth} +35%'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart, color: Colors.orange),
                    title: Text('${localizations.ecommerce}: ${localizations.expandingMarket}'),
                    subtitle: Text('TalabaStore: ${localizations.expectedGrowth} +28%'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_car, color: Colors.blue),
                    title: Text('${localizations.mobility}: ${localizations.highDemandServices}'),
                    subtitle: Text('TemTem: ${localizations.expectedGrowth} +22%'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.business, color: Colors.purple),
                    title: Text('${localizations.marketplaceB2B}: ${localizations.stableOpportunity}'),
                    subtitle: Text('Okadoo: ${localizations.expectedGrowth} +18%'),
                    trailing: const Icon(Icons.business, color: Color(0xFF7533E8)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Market News - Actualités algériennes
            Text(
              '📰 ${localizations.algerianMarketNews}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            
            _buildNewsCard(
              localizations.newsTitle1,
              localizations.newsContent1,
              localizations.twoDaysAgo,
              localizations,
            ),
            _buildNewsCard(
              localizations.newsTitle2,
              localizations.newsContent2,
              localizations.threeDaysAgo,
              localizations,
            ),
            _buildNewsCard(
              localizations.newsTitle3,
              localizations.newsContent3,
              localizations.oneWeekAgo,
              localizations,
            ),
            _buildNewsCard(
              localizations.newsTitle4,
              localizations.newsContent4,
              localizations.oneWeekAgo,
              localizations,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketOverviewCard(String index, String change, String value, Color color, AppLocalizations localizations) {
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

  Widget _buildTrendCard(MarketTrend trend, AppLocalizations localizations) {
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
                  '${localizations.companies}: ${trend.companies.join(", ")}',
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

  Widget _buildNewsCard(String title, String content, String time, AppLocalizations localizations) {
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