import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';

class FollowedCompaniesPage extends StatefulWidget {
  final Investor investor;
  final List<Company> followedCompanies;
  
  const FollowedCompaniesPage({
    super.key,
    required this.investor,
    required this.followedCompanies, required Null Function(dynamic company) onUnfollow,
  });

  @override
  State<FollowedCompaniesPage> createState() => _FollowedCompaniesPageState();
}

class _FollowedCompaniesPageState extends State<FollowedCompaniesPage> {
  List<Company> _filteredCompanies = [];
  String _selectedFilter = 'Tous';
  final List<String> _filters = ['Tous', 'Luxe', 'Technologie', 'Santé', 'Finance', 'Énergie'];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCompanies = widget.followedCompanies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Entreprises suivies',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Color(0xFF7533E8)),
            onPressed: _showSortOptions,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: 'Rechercher une entreprise...',
                              border: InputBorder.none,
                            ),
                            onChanged: _onSearchChanged,
                          ),
                        ),
                        if (_searchController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear, size: 20),
                            onPressed: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  bool isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          _selectedFilter = filter;
                          _applyFilters();
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

          // Statistics
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('${widget.followedCompanies.length}', 'Entreprises'),
                _buildStatItem(
                  '${_calculateTotalValuation()}B€',
                  'Valeur totale',
                ),
                _buildStatItem(
                  '${_calculateAverageGrowth()}%',
                  'Croissance moy.',
                ),
              ],
            ),
          ),

          // Companies List
          Expanded(
            child: _filteredCompanies.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredCompanies.length,
                    itemBuilder: (context, index) {
                      return _buildFollowedCompanyCard(_filteredCompanies[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7533E8),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildFollowedCompanyCard(Company company) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
          // Header
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: company.cardColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: company.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      company.logo,
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
                        company.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${company.industry} • ${company.location}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.trending_up, color: company.cardColor, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            '+${_calculateCompanyGrowth(company)}%',
                            style: TextStyle(
                              fontSize: 12,
                              color: company.cardColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Voir les détails'),
                      onTap: () => _showCompanyDetails(company),
                    ),
                    PopupMenuItem(
                      child: const Text('Analyses financières'),
                      onTap: () => _showFinancialAnalysis(company),
                    ),
                    PopupMenuItem(
                      child: const Text('Arrêter de suivre', style: TextStyle(color: Colors.red)),
                      onTap: () => _unfollowCompany(company),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFinancialInfo('Capitalisation', '${company.valuation}B€'),
                    _buildFinancialInfo('Revenus', '${company.revenue}B€'),
                    _buildFinancialInfo('Employés', '${company.employees}'),
                  ],
                ),
                const SizedBox(height: 15),
                
                // Performance Indicator
                const Text(
                  'Performance:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _calculateCompanyGrowth(company) / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(company.cardColor),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Croissance: +${_calculateCompanyGrowth(company)}%',
                      style: TextStyle(
                        fontSize: 12,
                        color: company.cardColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Recommandation: ACHETER',
                      style: TextStyle(
                        fontSize: 12,
                        color: company.cardColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialInfo(String label, String value) {
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
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF7533E8).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.star_border,
              size: 50,
              color: Color(0xFF7533E8),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Aucune entreprise suivie',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Commencez à suivre des entreprises pour les voir apparaître ici',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7533E8),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Explorer les entreprises',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== HELPER METHODS ====================

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCompanies = widget.followedCompanies;
      } else {
        _filteredCompanies = widget.followedCompanies.where((company) {
          return company.name.toLowerCase().contains(query.toLowerCase()) ||
              company.industry.toLowerCase().contains(query.toLowerCase()) ||
              company.sector.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
      _applyFilters();
    });
  }

  void _applyFilters() {
    setState(() {
      if (_selectedFilter == 'Tous') {
        return;
      }
      _filteredCompanies = _filteredCompanies
          .where((company) => company.industry == _selectedFilter)
          .toList();
    });
  }

  double _calculateTotalValuation() {
    return widget.followedCompanies.fold(0.0, (sum, company) => sum + company.valuation);
  }

  double _calculateAverageGrowth() {
    if (widget.followedCompanies.isEmpty) return 0.0;
    double totalGrowth = widget.followedCompanies.fold(0.0, (sum, company) => sum + _calculateCompanyGrowth(company));
    return double.parse((totalGrowth / widget.followedCompanies.length).toStringAsFixed(1));
  }

  double _calculateCompanyGrowth(Company company) {
    // Simuler une croissance basée sur l'industrie
    Map<String, double> industryGrowth = {
      'Luxe': 10.7,
      'Technologie': 12.5,
      'Santé': 15.2,
      'Finance': 5.9,
      'Énergie': 8.3,
      'Aéronautique': 7.2,
      'Pharmaceutique': 14.5,
      'Banque': 6.1,
      'Cosmétique': 9.8,
    };
    return industryGrowth[company.industry] ?? 8.0;
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.trending_up, color: Color(0xFF7533E8)),
                title: const Text('Par croissance'),
                onTap: () {
                  Navigator.pop(context);
                  _sortByGrowth();
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money, color: Color(0xFF7533E8)),
                title: const Text('Par capitalisation'),
                onTap: () {
                  Navigator.pop(context);
                  _sortByValuation();
                },
              ),
              ListTile(
                leading: const Icon(Icons.business, color: Color(0xFF7533E8)),
                title: const Text('Par secteur'),
                onTap: () {
                  Navigator.pop(context);
                  _sortBySector();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _sortByGrowth() {
    setState(() {
      _filteredCompanies.sort((a, b) => _calculateCompanyGrowth(b).compareTo(_calculateCompanyGrowth(a)));
    });
  }

  void _sortByValuation() {
    setState(() {
      _filteredCompanies.sort((a, b) => b.valuation.compareTo(a.valuation));
    });
  }

  void _sortBySector() {
    setState(() {
      _filteredCompanies.sort((a, b) => a.sector.compareTo(b.sector));
    });
  }

  void _showCompanyDetails(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(company.logo),
              const SizedBox(width: 10),
              Text(company.name),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  company.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Performance de suivi:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildDetailItem('Croissance moyenne', '+${_calculateCompanyGrowth(company)}%'),
                _buildDetailItem('Rendement estimé', '+${(_calculateCompanyGrowth(company) * 0.8).toStringAsFixed(1)}%'),
                _buildDetailItem('Risque', 'Modéré'),
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

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showFinancialAnalysis(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Analyse financière - ${company.name}'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Performance financière:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('• Croissance annuelle: +8.2%'),
                Text('• Marge bénéficiaire: 15.3%'),
                Text('• Ratio P/E: 24.5'),
                Text('• Dette/Capital: 0.42'),
                SizedBox(height: 20),
                Text(
                  'Recommandation:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Analyst consensus: ACHETER'),
                Text('Target price: +15%'),
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

  void _unfollowCompany(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Arrêter de suivre'),
          content: Text('Êtes-vous sûr de vouloir arrêter de suivre ${company.name} ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _removeCompany(company);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Arrêter de suivre'),
            ),
          ],
        );
      },
    );
  }

  void _removeCompany(Company company) {
    // Dans une vraie application, vous enverriez cela à une base de données
    setState(() {
      widget.followedCompanies.remove(company);
      _filteredCompanies.remove(company);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous ne suivez plus ${company.name}'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}