import 'package:comvest/screens/InvestorLogin.dart';
import 'package:comvest/screens/company_detail_page.dart';
import 'package:comvest/widgets/models.dart';
import 'package:flutter/material.dart';
import 'analyse_marcket.dart';
import 'settings_page.dart';
import 'followed_companies.dart';
import 'actualites_page.dart';
import '../l10n/app_localizations.dart';

class InvestorDashboard extends StatefulWidget {
  final Investor investor;

  const InvestorDashboard({super.key, required this.investor});

  @override
  State<InvestorDashboard> createState() => _InvestorDashboardState();
}

class _InvestorDashboardState extends State<InvestorDashboard> {
  int _selectedTab = 0;
  List<Company> _companies = [];
  final List<Company> _followedCompanies = [];

  @override
  void initState() {
    super.initState();
    _initializeCompanies();
  }

  void _initializeCompanies() {
    // Companies will be initialized in build method based on localizations
    // This is just a placeholder
    _companies = [];
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    // Initialize companies only once with localizations
    if (_companies.isEmpty) {
      _companies = [
        Company(
          name: localizations.companyTalabaStoreName,
          description: localizations.companyTalabaStoreDescription,
          industry: localizations.companyTalabaStoreIndustry,
          sector: localizations.companyTalabaStoreSector,
          type: localizations.companyTalabaStoreType,
          valuation: 12.5,
          employees: 50,
          location: localizations.companyTalabaStoreLocation,
          founded: localizations.companyTalabaStoreFounded,
          ceo: localizations.companyTalabaStoreCEO,
          revenue: 3.2,
          products: [
            localizations.companyTalabaStoreProduct1,
            localizations.companyTalabaStoreProduct2,
            localizations.companyTalabaStoreProduct3,
            localizations.companyTalabaStoreProduct4,
            localizations.companyTalabaStoreProduct5,
          ],
          cardColor: const Color(0xFF2ECC71),
          logo: '🎓',
          imagePath: 'assets/images/talabastore.png',
          website: 'https://www.talabastore.dz/',
          mobileApps: [localizations.android, localizations.ios],
          users: localizations.companyTalabaStoreUsers,
          coverage: localizations.companyTalabaStoreCoverage,
          businessModel: localizations.companyTalabaStoreBusinessModel,
        ),
        Company(
          name: localizations.companyTemTemName,
          description: localizations.companyTemTemDescription,
          industry: localizations.companyTemTemIndustry,
          sector: localizations.companyTemTemSector,
          type: localizations.companyTemTemType,
          valuation: 8.7,
          employees: 120,
          location: localizations.companyTemTemLocation,
          founded: localizations.companyTemTemFounded,
          ceo: localizations.companyTemTemCEO,
          revenue: 2.8,
          products: [
            localizations.companyTemTemProduct1,
            localizations.companyTemTemProduct2,
            localizations.companyTemTemProduct3,
          ],
          cardColor: const Color(0xFFE67E22),
          logo: '🚗',
          imagePath: 'assets/images/temtem.png',
          website: 'temtem.taxi',
          mobileApps: [localizations.android, localizations.ios],
          users: localizations.companyTemTemUsers,
          coverage: localizations.companyTemTemCoverage,
          businessModel: localizations.companyTemTemBusinessModel,
        ),
        Company(
          name: localizations.companyALPAYName,
          description: localizations.companyALPAYDescription,
          industry: localizations.companyALPAYIndustry,
          sector: localizations.companyALPAYSector,
          type: localizations.companyALPAYType,
          valuation: 15.3,
          employees: 85,
          location: localizations.companyALPAYLocation,
          founded: localizations.companyALPAYFounded,
          ceo: localizations.companyALPAYCEO,
          revenue: 4.1,
          products: [
            localizations.companyALPAYProduct1,
            localizations.companyALPAYProduct2,
            localizations.companyALPAYProduct3,
          ],
          cardColor: const Color.fromARGB(255, 114, 233, 18),
          logo: '💳',
          imagePath: 'assets/images/alpay.png',
          website: 'https://alpay.dz/',
          mobileApps: [localizations.android, localizations.ios],
          users: localizations.companyALPAYUsers,
          coverage: localizations.companyALPAYCoverage,
          businessModel: localizations.companyALPAYBusinessModel,
        ),
        Company(
          name: localizations.companyOkadooName,
          description: localizations.companyOkadooDescription,
          industry: localizations.companyOkadooIndustry,
          sector: localizations.companyOkadooSector,
          type: localizations.companyOkadooType,
          valuation: 10.2,
          employees: 65,
          location: localizations.companyOkadooLocation,
          founded: localizations.companyOkadooFounded,
          ceo: localizations.companyOkadooCEO,
          revenue: 2.5,
          products: [
            localizations.companyOkadooProduct1,
            localizations.companyOkadooProduct2,
            localizations.companyOkadooProduct3,
          ],
          cardColor: const Color(0xFF3498DB),
          logo: '🛒',
          imagePath: 'assets/images/okadoo.png',
          website: 'https://okadoo.com/',
          mobileApps: [],
          users: localizations.companyOkadooUsers,
          coverage: localizations.companyOkadooCoverage,
          businessModel: localizations.companyOkadooBusinessModel,
        ),
      ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${localizations.welcome}, ${widget.investor.firstName} 👋',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (widget.investor.investorType != null)
              Text(
                widget.investor.investorType!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7533E8),
                ),
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              _showNotifications(localizations);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              _showSearch(localizations);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
      drawer: _buildDrawer(localizations),
      body: _selectedTab == 0
          ? _buildDashboard(localizations)
          : _buildCompanies(localizations),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        selectedItemColor: const Color(0xFF7533E8),
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: localizations.dashboard,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: localizations.companyName,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(AppLocalizations localizations) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7533E8), Color(0xFF9B59B6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF7533E8),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.investor.firstName} ${widget.investor.lastName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.investor.email,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                if (widget.investor.experienceLevel != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.investor.experienceLevel!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Color(0xFF7533E8)),
            title: Text(localizations.dashboard),
            onTap: () {
              setState(() {
                _selectedTab = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business, color: Color(0xFF7533E8)),
            title: Text(localizations.companyName),
            onTap: () {
              setState(() {
                _selectedTab = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Color(0xFF7533E8)),
            title: Text(localizations.followedCompanies),
            trailing: _followedCompanies.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7533E8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${_followedCompanies.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FollowedCompaniesPage(
                    investor: widget.investor,
                    followedCompanies: _followedCompanies,
                    onUnfollow: (company) {
                      _unfollowCompany(company, localizations);
                    },
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics, color: Color(0xFF7533E8)),
            title: Text(localizations.marketAnalysis),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MarketAnalysisPage(investor: widget.investor),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper, color: Color(0xFF7533E8)),
            title: Text(localizations.news),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ActualitesPage(investor: widget.investor),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF7533E8)),
            title: Text(localizations.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(investor: widget.investor),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Color(0xFF7533E8)),
            title: Text(localizations.help),
            onTap: () {
              Navigator.pop(context);
              _showHelpSupport(localizations);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: Text(localizations.logout),
            onTap: () {
              Navigator.pop(context);
              _showLogoutConfirmation(localizations);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard(AppLocalizations localizations) {
    return SingleChildScrollView(
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
                  localizations.investorDashboard,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  localizations.followCompaniesAndDiscoverOpportunities,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF7533E8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    localizations.exploreCompanies,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Personalization based on selected industries
          if (widget.investor.selectedIndustries.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.recommendedForYou,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${localizations.basedOnYourInterests}: ${widget.investor.selectedIndustries.join(", ")}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),

          // Quick Stats
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: localizations.companies,
                  value: '${_companies.length}',
                  icon: Icons.business,
                  color: const Color(0xFF4A90E2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  title: localizations.marketCap,
                  value: '46.7B DA',
                  icon: Icons.trending_up,
                  color: const Color(0xFF2ECC71),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: localizations.sectors,
                  value: '4',
                  icon: Icons.category,
                  color: const Color(0xFF9B59B6),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  title: localizations.growth,
                  value: '+25.3%',
                  icon: Icons.attach_money,
                  color: const Color(0xFFE67E22),
                ),
              ),
            ],
          ),

          // Companies Followed Stats
          if (_followedCompanies.isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.followedCompanies,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${_followedCompanies.length} ${localizations.companies.toLowerCase()}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowedCompaniesPage(
                            investor: widget.investor,
                            followedCompanies: _followedCompanies,
                            onUnfollow: (company) {
                              _unfollowCompany(company, localizations);
                            },
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.star, size: 16),
                    label: Text(localizations.view),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7533E8),
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 30),

          // Top Companies
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations.topCompanies,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: Text(
                  localizations.viewAll,
                  style: const TextStyle(
                    color: Color(0xFF7533E8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ..._companies
              .take(3)
              .map((company) => _buildCompanyCard(company, localizations)),

          // Quick Actions
          const SizedBox(height: 30),
          Text(
            localizations.quickActions,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  title: localizations.marketAnalysis,
                  icon: Icons.analytics,
                  color: const Color(0xFF7533E8),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MarketAnalysisPage(investor: widget.investor),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildQuickActionCard(
                  title: localizations.followedCompanies,
                  icon: Icons.star,
                  color: const Color(0xFFF1C40F),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FollowedCompaniesPage(
                          investor: widget.investor,
                          followedCompanies: _followedCompanies,
                          onUnfollow: (company) {
                            _unfollowCompany(company, localizations);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  title: localizations.settings,
                  icon: Icons.settings,
                  color: const Color(0xFF2ECC71),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SettingsPage(investor: widget.investor),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildQuickActionCard(
                  title: localizations.news,
                  icon: Icons.newspaper,
                  color: const Color(0xFF9B59B6),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActualitesPage(investor: widget.investor),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanies(AppLocalizations localizations) {
    return Column(
      children: [
        // Search and Filter Bar
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
                          decoration: InputDecoration(
                            hintText: localizations.searchCompanyHint,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Color(0xFF7533E8)),
                onPressed: () {
                  _showFilterDialog(localizations);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Industry Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              FilterChip(
                label: Text(localizations.all),
                selected: true,
                onSelected: (_) {},
                selectedColor: const Color(0xFF7533E8),
                checkmarkColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ...[
                'E-commerce',
                'Fintech',
                'Mobilité',
                'Technologie',
                'Services'
              ].map((industry) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(industry),
                    selected: false,
                    onSelected: (_) {},
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Companies List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _companies.length,
            itemBuilder: (context, index) {
              return _buildCompanyCard(_companies[index], localizations);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyCard(Company company, AppLocalizations localizations) {
    final isFollowed = _followedCompanies.any((c) => c.name == company.name);

    // Map pour contrôler la taille de chaque image d'entreprise
    final Map<String, Size> companyImageSizes = {
      'TalabaStore': const Size(60, 60), // Plus grande
      'TemTem': const Size(55, 55), // Légèrement plus grande
      'ALPAY': const Size(50, 50), // Taille standard
      'Okadoo': const Size(45, 45), // Plus petite
    };

    // Récupérer la taille spécifique ou utiliser une taille par défaut
    final Size imageSize =
        companyImageSizes[company.name] ?? const Size(50, 50);

    // Map pour contrôler le mode d'ajustement de chaque image
    final Map<String, BoxFit> companyImageFit = {
      'TalabaStore': BoxFit.contain, // Garde les proportions
      'TemTem': BoxFit.fitWidth, // Remplit l'espace
      'ALPAY': BoxFit.fitWidth, // S'adapte à la largeur
      'Okadoo': BoxFit.fitHeight, // S'adapte à la hauteur
    };

    final BoxFit imageFit = companyImageFit[company.name] ?? BoxFit.cover;

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
          // Header - Make this part clickable
          GestureDetector(
            onTap: () {
              _showCompanyDetails(company, localizations);
            },
            child: Container(
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
                  // CONTAINER AVEC TAILLE DYNAMIQUE
                  Container(
                    width: imageSize.width,
                    height: imageSize.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: company.imagePath.isNotEmpty
                          ? Image.asset(
                              company.imagePath,
                              width: imageSize.width,
                              height: imageSize.height,
                              fit: imageFit,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback si l'image n'existe pas
                                return Container(
                                  color: company.cardColor,
                                  child: Center(
                                    child: Text(
                                      company.logo,
                                      style: TextStyle(
                                        fontSize: imageSize.width *
                                            0.35, // Taille proportionnelle
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              color: company.cardColor,
                              child: Center(
                                child: Text(
                                  company.logo,
                                  style: TextStyle(
                                    fontSize: imageSize.width * 0.35,
                                  ),
                                ),
                              ),
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
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.grey),
                    onPressed: () {
                      _showCompanyOptions(company, localizations);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),

          // Content - Make this part clickable too
          GestureDetector(
            onTap: () {
              _showCompanyDetails(company, localizations);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company.description,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Key Info
                  Row(
                    children: [
                      _buildInfoItem('CEO', company.ceo),
                      const SizedBox(width: 20),
                      _buildInfoItem(localizations.founded, company.founded),
                      const SizedBox(width: 20),
                      _buildInfoItem(
                          localizations.employees, '${company.employees}'),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Additional Info
                  if (company.website.isNotEmpty)
                    _buildInfoRow(localizations.website, company.website),
                  if (company.mobileApps.isNotEmpty)
                    _buildInfoRow(localizations.applications,
                        company.mobileApps.join(', ')),
                  if (company.users.isNotEmpty)
                    _buildInfoRow(localizations.users, company.users),
                  if (company.coverage.isNotEmpty)
                    _buildInfoRow(localizations.coverage, company.coverage),
                  if (company.businessModel.isNotEmpty)
                    _buildInfoRow(
                        localizations.businessModel, company.businessModel),
                  const SizedBox(height: 15),

                  // Products/Services
                  Text(
                    localizations.productsServices,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: company.products.map((product) {
                      return Chip(
                        label: Text(product),
                        backgroundColor: company.cardColor.withOpacity(0.1),
                        labelStyle: TextStyle(color: company.cardColor),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),

                  // Financial Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizations.valuation,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${company.valuation}B DA',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizations.revenue,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${company.revenue}B DA',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localizations.sector,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            company.sector,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Action Buttons - KEEP BOTH BUTTONS
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _showCompanyDetails(company, localizations);
                    },
                    icon: const Icon(Icons.info_outline),
                    label: Text(localizations.details),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: company.cardColor),
                      foregroundColor: company.cardColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: isFollowed
                      ? OutlinedButton.icon(
                          onPressed: () {
                            _unfollowCompany(company, localizations);
                          },
                          icon: const Icon(Icons.star, size: 16),
                          label: Text(localizations.followed),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFF1C40F)),
                            foregroundColor: const Color(0xFFF1C40F),
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: () {
                            _followCompany(company, localizations);
                          },
                          icon: const Icon(Icons.star_border, size: 16),
                          label: Text(localizations.follow),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: company.cardColor,
                            foregroundColor: Colors.white,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100), // Limits width
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2, // Allows text to wrap to 2 lines
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== HELPER FUNCTIONS ====================

  void _showNotifications(AppLocalizations localizations) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(localizations.noNewNotifications),
        backgroundColor: const Color(0xFF7533E8),
      ),
    );
  }

  void _showSearch(AppLocalizations localizations) {
    showSearch(
      context: context,
      delegate: _CompanySearchDelegate(_companies, localizations),
    );
  }

  void _showHelpSupport(AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.help),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.email, color: Color(0xFF7533E8)),
                title: Text(localizations.email),
                subtitle: const Text('support@comvest.com'),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFF7533E8)),
                title: Text(localizations.phone),
                subtitle: const Text('+213 23 45 67 89'),
              ),
              ListTile(
                leading: const Icon(Icons.schedule, color: Color(0xFF7533E8)),
                title: Text(localizations.hours),
                subtitle: const Text('Lun-Ven: 9h-18h'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.close),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmation(AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.logout),
          content: Text(localizations.confirmLogout),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);

                // IMPORTANT: Add a small delay to ensure dialog is closed
                Future.delayed(const Duration(milliseconds: 100), () {
                  // Navigate to login and clear everything
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InvestorLoginScreen(),
                    ),
                    (route) => false,
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: Text(localizations.logoutConfirm),
            ),
          ],
        );
      },
    );
  }

  void _showFilterDialog(AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.filterCompanies),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(localizations.sector),
                ...[
                  'E-commerce',
                  'Fintech',
                  'Mobilité',
                  'Technologie',
                  'Services'
                ].map((sector) {
                  return CheckboxListTile(
                    title: Text(sector),
                    value: true,
                    onChanged: (value) {},
                  );
                }),
                const SizedBox(height: 20),
                Text(localizations.size),
                ...['Startup', 'PME', 'Grande entreprise'].map((size) {
                  return CheckboxListTile(
                    title: Text(size),
                    value: true,
                    onChanged: (value) {},
                  );
                }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localizations.filtersApplied),
                    backgroundColor: const Color(0xFF7533E8),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: Text(localizations.apply),
            ),
          ],
        );
      },
    );
  }

  void _showCompanyOptions(Company company, AppLocalizations localizations) {
    final isFollowed = _followedCompanies.any((c) => c.name == company.name);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF7533E8)),
                title: Text(localizations.viewDetails),
                onTap: () {
                  Navigator.pop(context);
                  _showCompanyDetails(company, localizations);
                },
              ),
              ListTile(
                leading: Icon(
                  isFollowed ? Icons.star : Icons.star_border,
                  color: const Color(0xFF7533E8),
                ),
                title: Text(isFollowed
                    ? localizations.removeFromFavorites
                    : localizations.addToFavorites),
                onTap: () {
                  Navigator.pop(context);
                  if (isFollowed) {
                    _unfollowCompany(company, localizations);
                  } else {
                    _followCompany(company, localizations);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart, color: Color(0xFF7533E8)),
                title: Text(localizations.financialAnalysis),
                onTap: () {
                  Navigator.pop(context);
                  _showFinancialAnalysis(company, localizations);
                },
              ),
              ListTile(
                leading: const Icon(Icons.newspaper, color: Color(0xFF7533E8)),
                title: Text(localizations.recentNews),
                onTap: () {
                  Navigator.pop(context);
                  _showCompanyNews(company, localizations);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Color(0xFF7533E8)),
                title: Text(localizations.share),
                onTap: () {
                  Navigator.pop(context);
                  _shareCompany(company, localizations);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCompanyDetails(Company company, AppLocalizations localizations) {
    final isFollowed = _followedCompanies.any((c) => c.name == company.name);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompanyDetailPage(
          company: company,
          isFollowed: isFollowed,
          onFollowToggle: () {
            Navigator.pop(context); // Close detail page
            if (isFollowed) {
              _unfollowCompany(company, localizations);
            } else {
              _followCompany(company, localizations);
            }
          },
        ),
      ),
    );
  }

  void _followCompany(Company company, AppLocalizations localizations) {
    setState(() {
      if (!_followedCompanies.any((c) => c.name == company.name)) {
        _followedCompanies.add(company);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${localizations.youNowFollow} ${company.name}'),
        backgroundColor: const Color(0xFF2ECC71),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _unfollowCompany(Company company, AppLocalizations localizations) {
    setState(() {
      _followedCompanies.removeWhere((c) => c.name == company.name);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${localizations.youNoLongerFollow} ${company.name}'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showFinancialAnalysis(Company company, AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${localizations.financialAnalysis} - ${company.name}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.financialPerformance,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                    '• ${localizations.annualGrowth}: ${company.name == "ALPAY" ? "+35.2%" : company.name == "TalabaStore" ? "+28.7%" : company.name == "TemTem" ? "+22.4%" : "+18.9%"}'),
                Text(
                    '• ${localizations.profitMargin}: ${company.name == "ALPAY" ? "18.3%" : company.name == "TalabaStore" ? "12.5%" : company.name == "TemTem" ? "15.7%" : "10.8%"}'),
                Text(
                    '• ${localizations.expectedROI}: ${company.name == "ALPAY" ? "42%" : company.name == "TalabaStore" ? "38%" : company.name == "TemTem" ? "35%" : "32%"}'),
                const SizedBox(height: 20),
                Text(
                  localizations.recommendation,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                    '${localizations.analystConsensus}: ${company.name == "ALPAY" || company.name == "TalabaStore" ? localizations.strongBuy : localizations.buy}'),
                Text(
                    '${localizations.targetPrice}: ${company.name == "ALPAY" ? "+45%" : company.name == "TalabaStore" ? "+38%" : company.name == "TemTem" ? "+32%" : "+28%"}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.close),
            ),
          ],
        );
      },
    );
  }

  void _showCompanyNews(Company company, AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${localizations.news} - ${company.name}'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '${company.name} ${localizations.announcesNewFunding}'),
                    subtitle: Text(localizations
                        .algerianStartupConfirmsRegionalExpansion),
                  ),
                  ListTile(
                    title: Text(
                        '${localizations.strategicPartnershipFor} ${company.name}'),
                    subtitle: Text(localizations
                        .collaborationWithMajorSectorPlayers),
                  ),
                  ListTile(
                    title: Text(
                        '${company.name} ${localizations.launchesNewFeatures}'),
                    subtitle: Text(localizations
                        .technologicalInnovationToImproveUserExperience),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.close),
            ),
          ],
        );
      },
    );
  }

  void _shareCompany(Company company, AppLocalizations localizations) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '${localizations.shareLinkFor} ${company.name} ${localizations.copied}'),
        backgroundColor: const Color(0xFF3498DB),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Search Delegate for Company Search
class _CompanySearchDelegate extends SearchDelegate<String> {
  final List<Company> companies;
  final AppLocalizations localizations;

  _CompanySearchDelegate(this.companies, this.localizations);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = companies.where((company) =>
        company.name.toLowerCase().contains(query.toLowerCase()) ||
        company.industry.toLowerCase().contains(query.toLowerCase()) ||
        company.sector.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final company = results.elementAt(index);
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: company.cardColor,
            child: Text(company.logo),
          ),
          title: Text(company.name),
          subtitle: Text('${company.industry} • ${company.sector}'),
          onTap: () {
            close(context, company.name);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = companies.where((company) =>
        company.name.toLowerCase().contains(query.toLowerCase()) ||
        company.industry.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final company = suggestions.elementAt(index);
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: company.cardColor,
            child: Text(company.logo),
          ),
          title: Text(company.name),
          subtitle: Text('${company.industry} • ${company.sector}'),
          onTap: () {
            query = company.name;
            showResults(context);
          },
        );
      },
    );
  }
}