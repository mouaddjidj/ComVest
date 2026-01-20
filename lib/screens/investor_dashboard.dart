import 'package:comvest/screens/company_detail_page.dart';
import 'package:comvest/widgets/models.dart';
import 'package:flutter/material.dart';
import 'analyse_marcket.dart';
import 'settings_page.dart';
import 'followed_companies.dart';
import 'actualites_page.dart';


class InvestorDashboard extends StatefulWidget {
  final Investor investor;

  const InvestorDashboard({super.key, required this.investor});

  @override
  State<InvestorDashboard> createState() => _InvestorDashboardState();
}

class _InvestorDashboardState extends State<InvestorDashboard> {
  int _selectedTab = 0;
  final List<Company> _companies = [
    Company(
      name: 'TalabaStore',
      description:
          'Plateforme e‑commerce destinée aux étudiants, offrant des réductions sur des produits variés (électronique, vêtements, accessoires, loisirs) et facilitant l\'accès aux services éducatifs.',
      industry: 'E-commerce',
      sector: 'Technologie',
       type: 'SARL / Startup digitale',
      valuation: 12.5,
      employees: 50,
      location: 'Alger, Algérie',
      founded: 'Juin 2017',
      ceo: 'Sami Aliouche',
      revenue: 3.2,
      products: [
        'Électronique',
        'Vêtements',
        'Accessoires',
        'Loisirs',
        'Services éducatifs'
      ],
      cardColor: const Color(0xFF2ECC71),
      logo: '🎓',
      imagePath: 'assets/images/talabastore.png',
      website: 'https://www.talabastore.dz/',
      mobileApps: ['Android', 'iOS'],
      users: 'Plus de 50 000 étudiants actifs',
      coverage: 'Livraison dans 48 wilayas en Algérie',
      businessModel: 'Commission sur ventes + partenariats avec entreprises locales',
    ),
    Company(
      name: 'TemTem',
      description:
          'Application de mobilité urbaine offrant des services de taxi/VTC, livraison de produits et services urbains digitaux (réservation et paiements).',
      industry: 'Mobilité',
      sector: 'Services',
       type: ' Startup mobilité ',
      valuation: 8.7,
      employees: 120,
      location: 'Alger, Algérie',
      founded: '2018',
      ceo: 'Jeunes  algériens',
      revenue: 2.8,
      products: [
        'Taxi / VTC',
        'Livraison de produits',
        'Services urbains digitaux'
      ],
      cardColor: const Color(0xFFE67E22),
      logo: '🚗',
       imagePath: 'assets/images/temtem.png',
      website: 'temtem.taxi',
      mobileApps: ['Android', 'iOS'],
      users: 'Plusieurs milliers d\'utilisateurs actifs',
      coverage: 'Alger, Oran, Constantine',
      businessModel: 'Commissions sur trajets + partenariats avec commerces locaux',
    ),
    Company(
      name: 'ALPAY',
      description:
          'Solution de paiement digital et e-wallet pour particuliers et commerçants, offrant des paiements sécurisés et une gestion de comptes digitaux.',
      industry: 'Fintech',
      sector: 'Finance',
       type: 'Fintech ',
      valuation: 15.3,
      employees: 85,
      location: 'Alger, Algérie',
      founded: '2019',
      ceo: 'Jeunes algériens',
      revenue: 4.1,
      products: [
        'Paiements sécurisés',
        'Gestion de comptes digitaux',
        'Paiement en ligne et mobile'
      ],
      cardColor: const Color.fromARGB(255, 114, 233, 18),
      logo: '💳',
      imagePath: 'assets/images/alpay.png',
      website: 'https://alpay.dz/',
      mobileApps: ['Android', 'iOS'],
      users: 'Plusieurs milliers d\'utilisateurs',
      coverage: 'Services en ligne à l\'échelle nationale',
      businessModel: 'Commissions sur transactions + abonnements entreprises',
    ),
    Company(
      name: 'Okadoo',
      description:
          'Marketplace numérique connectant entreprises, fournisseurs et acheteurs, permettant aux entreprises de vendre ou d\'acheter en ligne avec suivi digital des transactions.',
      industry: 'Marketplace B2B',
      sector: 'E-commerce',
       type: 'Marketplace B2B ',
      valuation: 10.2,
      employees: 65,
      location: 'Algérie',
      founded: '2019',
      ceo: 'Jeunes ',
      revenue: 2.5,
      products: [
        'Marketplace B2B',
        'Suivi digital des transactions',
        'Connexion fournisseurs-acheteurs'
      ],
      cardColor: const Color(0xFF3498DB),
      logo: '🛒',
       imagePath: 'assets/images/okadoo.png',
      website: 'https://okadoo.com/',
      mobileApps: [],
      users: 'Non spécifié',
      coverage: 'Algérie',
      businessModel: 'Commission sur transactions + abonnements entreprises', 
    ),
  ];

  // Liste des entreprises suivies
  final List<Company> _followedCompanies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bonjour, ${widget.investor.firstName} 👋',
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
              _showNotifications();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              _showSearch();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _selectedTab == 0 ? _buildDashboard() : _buildCompanies(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        selectedItemColor: const Color(0xFF7533E8),
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Entreprises',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
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
                  strutStyle: const StrutStyle(
    forceStrutHeight: true,)
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
            title: const Text('Tableau de bord'),
            onTap: () {
              setState(() {
                _selectedTab = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business, color: Color(0xFF7533E8)),
            title: const Text('Entreprises'),
            onTap: () {
              setState(() {
                _selectedTab = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Color(0xFF7533E8)),
            title: const Text('Entreprises suivies'),
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
                      _unfollowCompany(company);
                    },
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics, color: Color(0xFF7533E8)),
            title: const Text('Analyses marché'),
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
          // SECTION PORTEFEUILLE SUPPRIMÉE ICI
          ListTile(
            leading: const Icon(Icons.newspaper, color: Color(0xFF7533E8)),
            title: const Text('Actualités'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActualitesPage(investor: widget.investor),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF7533E8)),
            title: const Text('Paramètres'),
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
            title: const Text('Aide & Support'),
            onTap: () {
              Navigator.pop(context);
              _showHelpSupport();
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Déconnexion'),
            onTap: () {
              Navigator.pop(context);
              _showLogoutConfirmation();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard() {
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
                const Text(
                  'Dashboard Investisseur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Suivez vos entreprises préférées et découvrez de nouvelles opportunités',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Explorer les entreprises',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                const Text(
                  'Recommandé pour vous',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Basé sur vos intérêts: ${widget.investor.selectedIndustries.join(", ")}',
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
                  title: 'Entreprises',
                  value: '${_companies.length}',
                  icon: Icons.business,
                  color: const Color(0xFF4A90E2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  title: 'Capitalisation',
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
                  title: 'Secteurs',
                  value: '4',
                  icon: Icons.category,
                  color: const Color(0xFF9B59B6),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  title: 'Croissance',
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
                      const Text(
                        'Entreprises suivies',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${_followedCompanies.length} entreprises',
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
                              _unfollowCompany(company);
                            },
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.star, size: 16),
                    label: const Text('Voir'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7533E8),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
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
              const Text(
                'Top entreprises',
                style: TextStyle(
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
                child: const Text(
                  'Voir tout',
                  style: TextStyle(
                    color: Color(0xFF7533E8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ..._companies.take(3).map((company) => _buildCompanyCard(company)),

          // Quick Actions
          const SizedBox(height: 30),
          const Text(
            'Actions rapides',
            style: TextStyle(
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
                  title: 'Analyser marché',
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
                  title: 'Entreprises suivies',
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
                            _unfollowCompany(company);
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
                  title: 'Paramètres',
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
                  title: 'Actualités',
                  icon: Icons.newspaper,
                  color: const Color(0xFF9B59B6),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActualitesPage(investor: widget.investor),
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

  Widget _buildCompanies() {
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
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Rechercher une entreprise...',
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
                  _showFilterDialog();
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
                label: const Text('Tous'),
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
              return _buildCompanyCard(_companies[index]);
            },
          ),
        ),
      ],
    );
  }

Widget _buildCompanyCard(Company company) {
  final isFollowed = _followedCompanies.any((c) => c.name == company.name);
  
  // Map pour contrôler la taille de chaque image d'entreprise
  final Map<String, Size> companyImageSizes = {
    'TalabaStore': const Size(60, 60),    // Plus grande
     'TemTem': const Size(55, 55),          // Légèrement plus grande
    'ALPAY': const Size(50, 50),          // Taille standard
    'Okadoo': const Size(45, 45),         // Plus petite
  };
  
  // Récupérer la taille spécifique ou utiliser une taille par défaut
  final Size imageSize = companyImageSizes[company.name] ?? const Size(50, 50);
  
  // Map pour contrôler le mode d'ajustement de chaque image
  final Map<String, BoxFit> companyImageFit = {
    'TalabaStore': BoxFit.contain,  // Garde les proportions
    'TemTem': BoxFit.fitWidth,         // Remplit l'espace
    'ALPAY': BoxFit.fitWidth,       // S'adapte à la largeur
    'Okadoo': BoxFit.fitHeight,     // S'adapte à la hauteur
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
            _showCompanyDetails(company);
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
                                    fontSize: imageSize.width * 0.35, // Taille proportionnelle
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
                    _showCompanyOptions(company);
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
            _showCompanyDetails(company);
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
                    _buildInfoItem('Fondé', company.founded),
                    const SizedBox(width: 20),
                    _buildInfoItem('Employés', '${company.employees}'),
                  ],
                ),
                const SizedBox(height: 15),

                // Additional Info
                if (company.website.isNotEmpty)
                  _buildInfoRow('Site web', company.website),
                if (company.mobileApps.isNotEmpty)
                  _buildInfoRow('Applications', company.mobileApps.join(', ')),
                if (company.users.isNotEmpty)
                  _buildInfoRow('Utilisateurs', company.users),
                if (company.coverage.isNotEmpty)
                  _buildInfoRow('Couverture', company.coverage),
                if (company.businessModel.isNotEmpty)
                  _buildInfoRow('Modèle économique', company.businessModel),
                const SizedBox(height: 15),

                // Products/Services
                const Text(
                  'Produits & Services:',
                  style: TextStyle(
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
                        const Text(
                          'Valuation',
                          style: TextStyle(
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
                        const Text(
                          'Revenus',
                          style: TextStyle(
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
                        const Text(
                          'Secteur',
                          style: TextStyle(
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showCompanyDetails(company);
                  },
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Détails'),
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
                          _unfollowCompany(company);
                        },
                        icon: const Icon(Icons.star, size: 16),
                        label: const Text('Suivie'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFF1C40F)),
                          foregroundColor: const Color(0xFFF1C40F),
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: () {
                          _followCompany(company);
                        },
                        icon: const Icon(Icons.star_border, size: 16),
                        label: const Text('Suivre'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: company.cardColor,
                          foregroundColor: Colors.white,
                        ),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
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

  void _showNotifications() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Aucune nouvelle notification'),
        backgroundColor: Color(0xFF7533E8),
      ),
    );
  }

  void _showSearch() {
    showSearch(
      context: context,
      delegate: _CompanySearchDelegate(_companies),
    );
  }

  void _showHelpSupport() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aide & Support'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.email, color: Color(0xFF7533E8)),
                title: Text('Email'),
                subtitle: Text('support@comvest.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF7533E8)),
                title: Text('Téléphone'),
                subtitle: Text('+213 23 45 67 89'),
              ),
              ListTile(
                leading: Icon(Icons.schedule, color: Color(0xFF7533E8)),
                title: Text('Horaires'),
                subtitle: Text('Lun-Ven: 9h-18h'),
              ),
            ],
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

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Déconnexion'),
          content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Ferme la dialog
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Déconnexion'),
            ),
          ],
        );
      },
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtrer les entreprises'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('Secteur:'),
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
                const Text('Taille:'),
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
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Filtres appliqués'),
                    backgroundColor: Color(0xFF7533E8),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Appliquer'),
            ),
          ],
        );
      },
    );
  }

  void _showCompanyOptions(Company company) {
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
                title: const Text('Voir les détails'),
                onTap: () {
                  Navigator.pop(context);
                  _showCompanyDetails(company);
                },
              ),
              ListTile(
                leading: Icon(
                  isFollowed ? Icons.star : Icons.star_border,
                  color: const Color(0xFF7533E8),
                ),
                title: Text(isFollowed ? 'Retirer des favoris' : 'Ajouter aux favoris'),
                onTap: () {
                  Navigator.pop(context);
                  if (isFollowed) {
                    _unfollowCompany(company);
                  } else {
                    _followCompany(company);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart, color: Color(0xFF7533E8)),
                title: const Text('Analyses financières'),
                onTap: () {
                  Navigator.pop(context);
                  _showFinancialAnalysis(company);
                },
              ),
              ListTile(
                leading: const Icon(Icons.newspaper, color: Color(0xFF7533E8)),
                title: const Text('Actualités récentes'),
                onTap: () {
                  Navigator.pop(context);
                  _showCompanyNews(company);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Color(0xFF7533E8)),
                title: const Text('Partager'),
                onTap: () {
                  Navigator.pop(context);
                  _shareCompany(company);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCompanyDetails(Company company) {
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
            _unfollowCompany(company);
          } else {
            _followCompany(company);
          }
        },
      ),
    ),
  );
}


  void _followCompany(Company company) {
    setState(() {
      if (!_followedCompanies.any((c) => c.name == company.name)) {
        _followedCompanies.add(company);
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous suivez maintenant ${company.name}'),
        backgroundColor: const Color(0xFF2ECC71),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _unfollowCompany(Company company) {
    setState(() {
      _followedCompanies.removeWhere((c) => c.name == company.name);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous ne suivez plus ${company.name}'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showFinancialAnalysis(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Analyse financière - ${company.name}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Performance financière:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('• Croissance annuelle: ${company.name == "ALPAY" ? "+35.2%" : company.name == "TalabaStore" ? "+28.7%" : company.name == "TemTem" ? "+22.4%" : "+18.9%"}'),
                Text('• Marge bénéficiaire: ${company.name == "ALPAY" ? "18.3%" : company.name == "TalabaStore" ? "12.5%" : company.name == "TemTem" ? "15.7%" : "10.8%"}'),
                Text('• ROI attendu: ${company.name == "ALPAY" ? "42%" : company.name == "TalabaStore" ? "38%" : company.name == "TemTem" ? "35%" : "32%"}'),
                const SizedBox(height: 20),
                const Text(
                  'Recommandation:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('Analyst consensus: ${company.name == "ALPAY" || company.name == "TalabaStore" ? "ACHETER FORTEMENT" : "ACHETER"}'),
                Text('Target price: ${company.name == "ALPAY" ? "+45%" : company.name == "TalabaStore" ? "+38%" : company.name == "TemTem" ? "+32%" : "+28%"}'),
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

  void _showCompanyNews(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Actualités - ${company.name}'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('${company.name} annonce une nouvelle levée de fonds'),
                    subtitle: Text('La startup algérienne confirme son expansion régionale'),
                  ),
                  ListTile(
                    title: Text('Partnership stratégique pour ${company.name}'),
                    subtitle: Text('Collaboration avec des acteurs majeurs du secteur'),
                  ),
                  ListTile(
                    title: Text('${company.name} lance de nouvelles fonctionnalités'),
                    subtitle: Text('Innovation technologique pour améliorer l\'expérience utilisateur'),
                  ),
                ],
              ),
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

  void _shareCompany(Company company) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lien de partage pour ${company.name} copié!'),
        backgroundColor: const Color(0xFF3498DB),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Search Delegate for Company Search
class _CompanySearchDelegate extends SearchDelegate<String> {
  final List<Company> companies;

  _CompanySearchDelegate(this.companies);

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