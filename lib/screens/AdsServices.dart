import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forfaits tarifaires',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const PricingScreen(),
    );
  }
}

// Model Classes
class PricingPackage {
  final String title;
  final String description;
  final String monthlyPrice;
  final String annualPrice;
  final List<String> features;
  final Color primaryColor;
  final Color? secondaryColor;
  final String details;
  final List<String> additionalInfo;
  final List<ServiceFeature> serviceFeatures;
  final Map<String, dynamic> metrics;

  PricingPackage({
    required this.title,
    required this.description,
    required this.monthlyPrice,
    required this.annualPrice,
    required this.features,
    required this.primaryColor,
    this.secondaryColor,
    required this.details,
    required this.additionalInfo,
    required this.serviceFeatures,
    this.metrics = const {},
  });
}

class ServiceFeature {
  final String title;
  final String description;
  final IconData icon;
  final String status;
  final String actionButtonText;
  final Color color;
  final double progress;
  final List<String> steps;
  final DateTime? startDate;
  final DateTime? endDate;

  ServiceFeature({
    required this.title,
    required this.description,
    required this.icon,
    this.status = 'En attente',
    this.actionButtonText = 'Démarrer',
    required this.color,
    this.progress = 0.0,
    this.steps = const [],
    this.startDate,
    this.endDate,
  });
}

enum PaymentMethod {
  baridimob,
  dahabiya,
  creditCard,
  paypal,
  none
}

enum PaymentStatus {
  pending,
  completed,
  failed,
  cancelled,
  refunded
}

class PaymentInfo {
  final PaymentMethod method;
  final double amount;
  final String packageTitle;
  final DateTime date;
  final PricingPackage package;
  final String? transactionId;
  final PaymentStatus status;
  final String invoiceNumber;
  final String period;
  
  PaymentInfo({
    required this.method,
    required this.amount,
    required this.packageTitle,
    required this.date,
    required this.package,
    this.transactionId,
    this.status = PaymentStatus.pending,
    required this.invoiceNumber,
    required this.period,
  });
}

class ActiveService {
  final PaymentInfo paymentInfo;
  final DateTime startDate;
  final DateTime endDate;
  final List<ServiceFeature> features;
  final String status;
  final double overallProgress;
  final List<ServiceUpdate> updates;
  final Map<String, dynamic> usageStats;
  final List<SupportTicket> supportTickets;

  ActiveService({
    required this.paymentInfo,
    required this.startDate,
    required this.endDate,
    required this.features,
    this.status = 'Active',
    this.overallProgress = 0.0,
    this.updates = const [],
    this.usageStats = const {},
    this.supportTickets = const [],
  });
}

class ServiceUpdate {
  final String title;
  final String description;
  final DateTime date;
  final IconData icon;
  final Color color;

  ServiceUpdate({
    required this.title,
    required this.description,
    required this.date,
    required this.icon,
    required this.color,
  });
}

class SupportTicket {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String status;
  final String priority;

  SupportTicket({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.status = 'Ouvert',
    this.priority = 'Normal',
  });
}

class ResourceItem {
  final String title;
  final String description;
  final IconData icon;
  final String url;
  final Color color;

  ResourceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.url,
    required this.color,
  });
}

// Service Dashboard Page
class ServiceDashboard extends StatefulWidget {
  final ActiveService activeService;

  const ServiceDashboard({super.key, required this.activeService});

  @override
  State<ServiceDashboard> createState() => _ServiceDashboardState();
}

class _ServiceDashboardState extends State<ServiceDashboard> {
  int _selectedTab = 0;
  final PageController _pageController = PageController();
  final List<ResourceItem> _resources = [
    ResourceItem(
      title: 'Guide d\'utilisation',
      description: 'Documentation complète',
      icon: Icons.book,
      url: 'https://docs.example.com',
      color: const Color(0xFF4A90E2),
    ),
    ResourceItem(
      title: 'Tutoriels Vidéo',
      description: 'Formation en vidéo',
      icon: Icons.video_library,
      url: 'https://videos.example.com',
      color: const Color(0xFFE91E63),
    ),
    ResourceItem(
      title: 'FAQ',
      description: 'Questions fréquentes',
      icon: Icons.help,
      url: 'https://faq.example.com',
      color: const Color(0xFF00C853),
    ),
    ResourceItem(
      title: 'Modèles',
      description: 'Templates prêts à utiliser',
      icon: Icons.dashboard,
      url: 'https://templates.example.com',
      color: const Color(0xFF9C27B0),
    ),
    // Removed API Documentation
    ResourceItem(
      title: 'Communauté',
      description: 'Forum et discussions',
      icon: Icons.group,
      url: 'https://community.example.com',
      color: const Color(0xFF2196F3),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final package = widget.activeService.paymentInfo.package;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final currencyFormat = NumberFormat.currency(symbol: 'DA ', decimalDigits: 0);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tableau de Bord',
              style: GoogleFonts.poppins(
                color: const Color(0xFF2D3748),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Text(
              package.title,
              style: GoogleFonts.poppins(
                color: const Color(0xFF718096),
                fontSize: 12,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4A5568)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF4A5568)),
            onPressed: () => _showNotifications(context),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF4A5568)),
            onPressed: () => _showMoreOptions(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTabButton('Vue d\'ensemble', 0),
                _buildTabButton('Services', 1),
                _buildTabButton('Ressources', 2),
              ],
            ),
          ),
          
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
              children: [
                _buildOverviewTab(context, package, dateFormat, currencyFormat),
                _buildServicesTab(context, package),
                _buildResourcesTab(context),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Icon(Icons.home, color: package.primaryColor, size: 24),
                  const SizedBox(height: 4),
                  Text(
                    'Accueil',
                    style: GoogleFonts.poppins(
                      color: package.primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Icon(Icons.settings, color: const Color(0xFF718096), size: 24),
                  const SizedBox(height: 4),
                  Text(
                    'Paramètres',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF718096),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _showQuickActions(context),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        package.primaryColor,
                        package.secondaryColor ?? package.primaryColor,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: package.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Icon(Icons.help, color: const Color(0xFF718096), size: 24),
                  const SizedBox(height: 4),
                  Text(
                    'Aide',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF718096),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Icon(Icons.person, color: const Color(0xFF718096), size: 24),
                  const SizedBox(height: 4),
                  Text(
                    'Profil',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF718096),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final isSelected = _selectedTab == index;
    final package = widget.activeService.paymentInfo.package;
    
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedTab = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: isSelected
                  ? Border(
                      bottom: BorderSide(
                        color: package.primaryColor,
                        width: 3,
                      ),
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: isSelected ? package.primaryColor : const Color(0xFF718096),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context, PricingPackage package, DateFormat dateFormat, NumberFormat currencyFormat) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    package.primaryColor,
                    package.secondaryColor ?? package.primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: package.primaryColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.verified, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Service Actif',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              package.title,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.activeService.status,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(
                        Icons.calendar_today,
                        'Date de début',
                        dateFormat.format(widget.activeService.startDate),
                        Colors.white,
                      ),
                      _buildStatCard(
                        Icons.date_range,
                        'Date de fin',
                        dateFormat.format(widget.activeService.endDate),
                        Colors.white,
                      ),
                      _buildStatCard(
                        Icons.access_time,
                        'Jours restants',
                        '${_daysRemaining(widget.activeService.endDate)} jours',
                        Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                      Text(
                        'Progression Globale',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${(widget.activeService.overallProgress * 100).toStringAsFixed(1)}%',
                        style: GoogleFonts.poppins(
                          color: package.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    value: widget.activeService.overallProgress,
                    backgroundColor: const Color(0xFFE2E8F0),
                    valueColor: AlwaysStoppedAnimation<Color>(package.primaryColor),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMiniStat(
                        'Services terminés',
                        '${widget.activeService.features.where((f) => f.status == 'Terminé').length}',
                        const Color(0xFF00A859),
                        Icons.check_circle,
                      ),
                      _buildMiniStat(
                        'En cours',
                        '${widget.activeService.features.where((f) => f.status == 'En cours').length}',
                        const Color(0xFF4A90E2),
                        Icons.autorenew,
                      ),
                      _buildMiniStat(
                        'En attente',
                        '${widget.activeService.features.where((f) => f.status == 'En attente').length}',
                        const Color(0xFFE67E22),
                        Icons.hourglass_empty,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                      Text(
                        'Activités Récentes',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _showAllActivities(context),
                        child: Text(
                          'Voir tout',
                          style: GoogleFonts.poppins(
                            color: package.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ...widget.activeService.updates.take(3).map((update) => _buildActivityItem(update)),
                  if (widget.activeService.updates.isEmpty) ...[
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.history, color: const Color(0xFFCBD5E0), size: 48),
                          const SizedBox(height: 10),
                          Text(
                            'Aucune activité récente',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF718096),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    'Actions Rapides',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.download,
                          'Rapport',
                          package.primaryColor,
                          () => _downloadReport(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.share,
                          'Partager',
                          const Color(0xFF9B59B6),
                          () => _shareService(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.print,
                          'Imprimer',
                          const Color(0xFFE67E22),
                          () => _printInvoice(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.settings_backup_restore,
                          'Renouveler',
                          const Color(0xFF00A859),
                          () => _renewService(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.upgrade,
                          'Améliorer',
                          const Color(0xFF3498DB),
                          () => _showUpgradeOptions(context, package),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.support_agent,
                          'Support',
                          const Color(0xFFE74C3C),
                          () => _contactSupport(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesTab(BuildContext context, PricingPackage package) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: widget.activeService.features.length,
              itemBuilder: (context, index) {
                final feature = widget.activeService.features[index];
                return _buildServiceCard(feature);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    'Détails du Service',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildDetailItem('Facture N°', widget.activeService.paymentInfo.invoiceNumber),
                  _buildDetailItem('Transaction ID', widget.activeService.paymentInfo.transactionId ?? 'N/A'),
                  _buildDetailItem('Mode de paiement', _getPaymentMethodText(widget.activeService.paymentInfo.method)),
                  _buildDetailItem('Montant payé', 'DA ${widget.activeService.paymentInfo.amount.toStringAsFixed(0)}'),
                  _buildDetailItem('Prochaine facturation', DateFormat('dd/MM/yyyy').format(widget.activeService.endDate)),
                  _buildDetailItem('Cycle de facturation', widget.activeService.paymentInfo.period),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                      Text(
                        'Historique des Services',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.history, color: package.primaryColor),
                        onPressed: () => _showServiceHistory(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ...widget.activeService.supportTickets.take(2).map((ticket) => _buildHistoryItem(ticket)),
                  if (widget.activeService.supportTickets.isEmpty) ...[
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.history_toggle_off, color: const Color(0xFFCBD5E0), size: 48),
                          const SizedBox(height: 10),
                          Text(
                            'Aucun historique',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF718096),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourcesTab(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: _resources.length,
              itemBuilder: (context, index) {
                final resource = _resources[index];
                return _buildResourceCard(resource);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    'Communauté et Apprentissage',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildCommunityItem(
                    'Forum Communautaire',
                    'Discutez avec d\'autres utilisateurs',
                    Icons.forum,
                    const Color(0xFF9B59B6),
                  ),
                  _buildCommunityItem(
                    'Blog Technique',
                    'Articles et tutoriels avancés',
                    Icons.article,
                    const Color(0xFF3498DB),
                  ),
                  _buildCommunityItem(
                    'Webinaires',
                    'Sessions de formation en ligne',
                    Icons.live_tv,
                    const Color(0xFFE74C3C),
                  ),
                  _buildCommunityItem(
                    'Centre d\'apprentissage',
                    'Cours et certifications',
                    Icons.school,
                    const Color(0xFF2ECC71),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    'Paramètres Rapides',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSettingButton(
                          Icons.notifications,
                          'Notifications',
                          () => _manageNotifications(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.security,
                          'Sécurité',
                          () => _securitySettings(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.payment,
                          'Paiements',
                          () => _paymentSettings(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSettingButton(
                          Icons.privacy_tip,
                          'Confidentialité',
                          () => _privacySettings(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.download,
                          'Téléchargements',
                          () => _downloadSettings(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.language,
                          'Langue',
                          () => _languageSettings(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: color.withOpacity(0.8),
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildMiniStat(String title, String value, Color color, IconData icon) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: const Color(0xFF2D3748),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: const Color(0xFF718096),
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(ServiceUpdate update) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: update.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(update.icon, color: update.color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  update.title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  update.description,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            DateFormat('HH:mm').format(update.date),
            style: GoogleFonts.poppins(
              color: const Color(0xFF718096),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(IconData icon, String label, Color color, VoidCallback onPressed) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(ServiceFeature feature) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => _showServiceDetails(context, feature),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: feature.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(feature.icon, color: feature.color),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(feature.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        feature.status,
                        style: GoogleFonts.poppins(
                          color: _getStatusColor(feature.status),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  feature.title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  feature.description,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: feature.progress,
                  backgroundColor: const Color(0xFFE2E8F0),
                  valueColor: AlwaysStoppedAnimation<Color>(feature.color),
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(feature.progress * 100).toStringAsFixed(0)}%',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF718096),
                        fontSize: 11,
                      ),
                    ),
                    if (feature.startDate != null)
                      Text(
                        DateFormat('dd/MM').format(feature.startDate!),
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF718096),
                          fontSize: 11,
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

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color(0xFF718096),
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: const Color(0xFF2D3748),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(SupportTicket ticket) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: _getPriorityColor(ticket.priority).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.support_agent,
              color: _getPriorityColor(ticket.priority),
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  ticket.description,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('dd/MM').format(ticket.date),
                style: GoogleFonts.poppins(
                  color: const Color(0xFF718096),
                  fontSize: 11,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(ticket.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ticket.status,
                  style: GoogleFonts.poppins(
                    color: _getStatusColor(ticket.status),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(ResourceItem resource) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => _openResource(resource),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: resource.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(resource.icon, color: resource.color),
                ),
                const SizedBox(height: 12),
                Text(
                  resource.title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  resource.description,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Accéder',
                      style: GoogleFonts.poppins(
                        color: resource.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: resource.color, size: 14),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityItem(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: color, size: 16),
        ],
      ),
    );
  }

  Widget _buildSettingButton(IconData icon, String label, VoidCallback onPressed) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFF4A90E2), size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF4A5568),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _daysRemaining(DateTime endDate) {
    final now = DateTime.now();
    final difference = endDate.difference(now);
    return difference.inDays > 0 ? difference.inDays : 0;
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Terminé':
        return const Color(0xFF00A859);
      case 'En cours':
        return const Color(0xFF4A90E2);
      case 'Ouvert':
        return const Color(0xFF3498DB);
      case 'Fermé':
        return const Color(0xFF95A5A6);
      default:
        return const Color(0xFFE67E22);
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Haute':
        return const Color(0xFFE74C3C);
      case 'Moyenne':
        return const Color(0xFFF39C12);
      default:
        return const Color(0xFF3498DB);
    }
  }

  String _getPaymentMethodText(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.baridimob:
        return 'Baridimob';
      case PaymentMethod.dahabiya:
        return 'Carte Dahabiya';
      case PaymentMethod.creditCard:
        return 'Carte de crédit';
      case PaymentMethod.paypal:
        return 'PayPal';
      default:
        return 'Autre';
    }
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notifications'),
        content: SizedBox(
          height: 300,
          child: ListView(
            children: [
              _buildNotificationItem('Nouveau message', 'Vous avez reçu un nouveau message du support', Icons.message, Colors.blue),
              _buildNotificationItem('Facture disponible', 'Votre facture de juin est disponible', Icons.receipt, Colors.green),
              _buildNotificationItem('Mise à jour système', 'Nouvelle mise à jour disponible', Icons.system_update, Colors.orange),
              _buildNotificationItem('Rappel de paiement', 'Votre paiement est dû dans 3 jours', Icons.payment, Colors.red),
              _buildNotificationItem('Service terminé', 'Votre audit SEO est terminé', Icons.check_circle, Colors.purple),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tout marquer comme lu'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String message, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      subtitle: Text(message),
      trailing: Text(DateFormat('HH:mm').format(DateTime.now())),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Mon profil'),
                onTap: () {
                  Navigator.pop(context);
                  _showProfile(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Paramètres'),
                onTap: () {
                  Navigator.pop(context);
                  _showSettings(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_center),
                title: const Text('Centre d\'aide'),
                onTap: () {
                  Navigator.pop(context);
                  _showHelpCenter(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Donner votre avis'),
                onTap: () {
                  Navigator.pop(context);
                  _showFeedback(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('À propos'),
                onTap: () {
                  Navigator.pop(context);
                  _showAbout(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Déconnexion', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  _logout(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final package = widget.activeService.paymentInfo.package;
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Actions Rapides',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildQuickActionChip(Icons.add_chart, 'Nouveau rapport', package.primaryColor),
                  _buildQuickActionChip(Icons.calendar_today, 'Planifier', const Color(0xFF00A859)),
                  _buildQuickActionChip(Icons.share, 'Partager', const Color(0xFF9B59B6)),
                  _buildQuickActionChip(Icons.download, 'Exporter', const Color(0xFFE67E22)),
                  _buildQuickActionChip(Icons.print, 'Imprimer', const Color(0xFF3498DB)),
                  _buildQuickActionChip(Icons.backup, 'Sauvegarder', const Color(0xFFE91E63)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Fermer'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuickActionChip(IconData icon, String label, Color color) {
    return ActionChip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(label),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: TextStyle(color: color),
      onPressed: () {},
    );
  }

  void _showAllActivities(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Toutes les activités'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.activeService.updates.length,
            itemBuilder: (context, index) {
              final update = widget.activeService.updates[index];
              return ListTile(
                leading: Icon(update.icon, color: update.color),
                title: Text(update.title),
                subtitle: Text(update.description),
                trailing: Text(DateFormat('dd/MM/yy').format(update.date)),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _downloadReport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Téléchargement du rapport en cours...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareService(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Partager le service'),
        content: const Text('Choisissez une plateforme pour partager votre service:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Partager'),
          ),
        ],
      ),
    );
  }

  void _printInvoice(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Imprimer la facture'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.print, size: 60, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              'Facture N°: ${widget.activeService.paymentInfo.invoiceNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Montant: DA ${widget.activeService.paymentInfo.amount}'),
            const SizedBox(height: 10),
            Text('Date: ${DateFormat('dd/MM/yyyy').format(widget.activeService.paymentInfo.date)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Imprimer'),
          ),
        ],
      ),
    );
  }

  void _renewService(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Renouveler le service'),
        content: const Text('Voulez-vous renouveler votre abonnement pour un mois supplémentaire?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Plus tard'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Service renouvelé avec succès!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Renouveler'),
          ),
        ],
      ),
    );
  }

  void _showUpgradeOptions(BuildContext context, PricingPackage package) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Améliorer votre forfait',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF4A90E2)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Forfait Premium',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('DA 10,500/mois'),
                    const SizedBox(height: 15),
                    const Icon(Icons.arrow_upward, size: 40, color: Color(0xFF4A90E2)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('VOIR LES OPTIONS'),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('PLUS TARD'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _contactSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contactez le support'),
        content: const Text('Comment souhaitez-vous contacter notre équipe de support?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Chat'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Email'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Téléphone'),
          ),
        ],
      ),
    );
  }

  void _showServiceDetails(BuildContext context, ServiceFeature feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(feature.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(feature.icon, size: 60, color: feature.color),
            const SizedBox(height: 20),
            Text(feature.description),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: feature.progress,
              backgroundColor: const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(feature.color),
            ),
            const SizedBox(height: 10),
            Text('${(feature.progress * 100).toStringAsFixed(0)}% complété'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _showServiceHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Historique complet'),
        content: SizedBox(
          height: 400,
          width: 400,
          child: ListView.builder(
            itemCount: widget.activeService.supportTickets.length,
            itemBuilder: (context, index) {
              final ticket = widget.activeService.supportTickets[index];
              return Card(
                child: ListTile(
                  title: Text(ticket.title),
                  subtitle: Text(ticket.description),
                  trailing: Chip(
                    label: Text(ticket.status),
                    backgroundColor: _getStatusColor(ticket.status).withOpacity(0.1),
                    labelStyle: TextStyle(color: _getStatusColor(ticket.status)),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _openResource(ResourceItem resource) async {
    final url = Uri.parse(resource.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _manageNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Gestion des notifications')),
          body: const Center(child: Text('Page de gestion des notifications')),
        ),
      ),
    );
  }

  void _securitySettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Paramètres de sécurité')),
          body: const Center(child: Text('Page des paramètres de sécurité')),
        ),
      ),
    );
  }

  void _paymentSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Paramètres de paiement')),
          body: const Center(child: Text('Page des paramètres de paiement')),
        ),
      ),
    );
  }

  void _privacySettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Confidentialité')),
          body: const Center(child: Text('Page des paramètres de confidentialité')),
        ),
      ),
    );
  }

  void _downloadSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Téléchargements')),
          body: const Center(child: Text('Page des paramètres de téléchargement')),
        ),
      ),
    );
  }

  void _languageSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Changer la langue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Français'),
              leading: const Icon(Icons.language),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Anglais'),
              leading: const Icon(Icons.language),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Arabe'),
              leading: const Icon(Icons.language),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Mon profil')),
          body: const Center(child: Text('Page de profil utilisateur')),
        ),
      ),
    );
  }

  void _showSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Paramètres')),
          body: const Center(child: Text('Page des paramètres généraux')),
        ),
      ),
    );
  }

  void _showHelpCenter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Centre d\'aide')),
          body: const Center(child: Text('Page du centre d\'aide')),
        ),
      ),
    );
  }

  void _showFeedback(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Donner votre avis'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Écrivez votre avis ici...',
            border: OutlineInputBorder(),
          ),
          maxLines: 5,
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
                const SnackBar(content: Text('Merci pour votre avis!')),
              );
            },
            child: const Text('Envoyer'),
          ),
        ],
      ),
    );
  }

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Service Dashboard',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2024 Votre Entreprise. Tous droits réservés.',
      children: const [
        Text('Cette application permet de gérer vos services et forfaits.'),
      ],
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Déconnexion', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// Detail Dialog Widget
class PackageDetailDialog extends StatelessWidget {
  final PricingPackage package;

  const PackageDetailDialog({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      package.primaryColor,
                      package.secondaryColor ??
                          package.primaryColor.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      package.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      package.description,
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          package.monthlyPrice,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF2D3748),
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '/mois',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF718096),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      package.annualPrice,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF4A90E2),
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '/an',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF4A90E2),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  package.details,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF4A5568),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fonctionnalités Clés:',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2D3748),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ...package.features.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              color: package.primaryColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: package.primaryColor,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              feature,
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF4A5568),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Services Inclus:',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2D3748),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ...package.serviceFeatures.take(3).map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: feature.color.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              feature.icon,
                              color: feature.color,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feature.title,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF2D3748),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  feature.description,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF718096),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    if (package.serviceFeatures.length > 3) ...[
                      const SizedBox(height: 10),
                      Text(
                        '+ ${package.serviceFeatures.length - 3} autres services...',
                        style: GoogleFonts.poppins(
                          color: package.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              if (package.additionalInfo.isNotEmpty) ...[
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informations additionnelles :',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ...package.additionalInfo.map((info) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                color: package.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                info,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF4A5568),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ],
              
              const SizedBox(height: 25),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE2E8F0),
                            width: 1.5,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => Navigator.pop(context),
                            child: Center(
                              child: Text(
                                'FERMER',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF4A5568),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pricing Screen
class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  late List<PricingPackage> packages;

  @override
  void initState() {
    super.initState();
    
    packages = [
      PricingPackage(
        title: 'PACK START',
        description: 'Idéal pour débuter',
        monthlyPrice: 'DA 4,500',
        annualPrice: 'DA 48,000',
        features: [
          'Création de 3 comptes sociaux',
          'Branding personnalisé',
          '5 posts initiaux',
          'Site vitrine simple',
          'Accès au tableau de bord',
          'Support email 24/7',
        ],
        primaryColor: const Color(0xFF4A90E2),
        secondaryColor: const Color(0xFF357ABD),
        details: 'Idéal pour les jeunes entreprises souhaitant développer leur présence en ligne. Ce pack comprend tout le nécessaire pour débuter en marketing digital.',
        additionalInfo: [
          'Garantie de remboursement de 30 jours',
          'Assistance par e-mail sous 24 heures',
          'Assistance à la configuration gratuite',
          'Annuler à tout moment',
          'Mises à jour régulières incluses',
          'Accès à la communauté',
        ],
        serviceFeatures: [
          ServiceFeature(
            title: 'Création Comptes',
            description: 'Configuration des réseaux sociaux',
            icon: Icons.account_circle,
            status: 'En attente',
            actionButtonText: 'Commencer',
            color: const Color(0xFF4A90E2),
            progress: 0.0,
            steps: ['Analyse', 'Configuration', 'Validation'],
          ),
          ServiceFeature(
            title: 'Branding',
            description: 'Design de logo et identité visuelle',
            icon: Icons.palette,
            status: 'En attente',
            actionButtonText: 'Démarrer',
            color: const Color(0xFF9B59B6),
            progress: 0.0,
            steps: ['Briefing', 'Conception', 'Révision', 'Finalisation'],
          ),
          ServiceFeature(
            title: 'Contenu Initial',
            description: 'Création des premiers posts',
            icon: Icons.create,
            status: 'En attente',
            actionButtonText: 'Planifier',
            color: const Color(0xFFE67E22),
            progress: 0.0,
            steps: ['Stratégie', 'Création', 'Approbation', 'Publication'],
          ),
          ServiceFeature(
            title: 'Site Vitrine',
            description: 'Développement site web simple',
            icon: Icons.language,
            status: 'En attente',
            actionButtonText: 'Configurer',
            color: const Color(0xFF00A859),
            progress: 0.0,
            steps: ['Wireframe', 'Développement', 'Test', 'Lancement'],
          ),
        ],
        metrics: {
          'performance': 85,
          'storage': 65,
          'users': 3,
          'uptime': 99.9,
        },
      ),
      PricingPackage(
        title: 'PACK PREMIUM',
        description: 'Solution complète',
        monthlyPrice: 'DA 8,500',
        annualPrice: 'DA 91,800',
        features: [
          'Gestion de 2 réseaux sociaux',
          'Calendrier éditorial',
          '12 posts/mois',
          'Reporting léger',
          'Analytics avancés',
          'Support prioritaire',
        ],
        primaryColor: const Color(0xFF9B59B6),
        secondaryColor: const Color(0xFFE91E8C),
        details: 'Idéal pour les jeunes entreprises et les micro-entreprises en pleine croissance. Cet abonnement mensuel comprend la gestion continue des médias sociaux et la planification du contenu.',
        additionalInfo: [
          'Assistance prioritaire sous 12 heures',
          'Review stratégique mensuel',
          'Planification du calendrier éditorial',
          'Tableau de bord d\'analyse de performance',
          'Accès aux webinaires exclusifs',
          'Mentorat mensuel',
        ],
        serviceFeatures: [
          ServiceFeature(
            title: 'Gestion Social Media',
            description: 'Gestion quotidienne des comptes',
            icon: Icons.thumb_up,
            status: 'En cours',
            actionButtonText: 'Continuer',
            color: const Color(0xFF9B59B6),
            progress: 0.6,
            steps: ['Audit', 'Stratégie', 'Exécution', 'Optimisation'],
            startDate: DateTime.now().subtract(const Duration(days: 15)),
            endDate: DateTime.now().add(const Duration(days: 15)),
          ),
          ServiceFeature(
            title: 'Calendrier Éditorial',
            description: 'Planification du contenu mensuel',
            icon: Icons.calendar_today,
            status: 'Terminé',
            actionButtonText: 'Voir',
            color: const Color(0xFF4A90E2),
            progress: 1.0,
            steps: ['Planification', 'Création', 'Validation'],
            startDate: DateTime.now().subtract(const Duration(days: 30)),
            endDate: DateTime.now().subtract(const Duration(days: 10)),
          ),
          ServiceFeature(
            title: 'Création Contenu',
            description: '12 posts par mois',
            icon: Icons.edit,
            status: 'En cours',
            actionButtonText: 'Éditer',
            color: const Color(0xFFE67E22),
            progress: 0.4,
            steps: ['Briefing', 'Création', 'Révision', 'Publication'],
            startDate: DateTime.now().subtract(const Duration(days: 10)),
            endDate: DateTime.now().add(const Duration(days: 20)),
          ),
          ServiceFeature(
            title: 'Analytics',
            description: 'Rapports de performance',
            icon: Icons.analytics,
            status: 'En attente',
            actionButtonText: 'Configurer',
            color: const Color(0xFF00A859),
            progress: 0.0,
            steps: ['Configuration', 'Collecte', 'Analyse', 'Reporting'],
          ),
        ],
        metrics: {
          'performance': 92,
          'storage': 85,
          'users': 5,
          'uptime': 99.95,
        },
      ),
      PricingPackage(
         title: 'SERVICE SUR MESURE',
        description: 'Solution personnalisée',
        monthlyPrice: 'Sur Devis',
        annualPrice: 'Sur Devis',
        features: [
          'Audit SEO complet',
          'Campagnes de publicité (Ads)',
          'Création de contenu vidéo avancé',
          'Analyse d\'entreprise',
          'Consultation stratégique',
          'Support VIP 24/7',
        ],
        primaryColor: const Color(0xFFE67E22),
        secondaryColor: const Color(0xFFF39C12),
        details: 'Services à la carte haut de gamme pour les entreprises établies. Choisissez parmi des services marketing avancés adaptés à vos besoins spécifiques. Contactez-nous pour un devis personnalisé.',
        additionalInfo: [
          'Gestionnaire de compte dédié',
          'Assistance téléphonique 24/7',
          'Rapports personnalisés',
          'Séances de consultation stratégique',
          'Accès illimité aux ressources',
          'Formations personnalisées',
        ],
        serviceFeatures: [
          ServiceFeature(
            title: 'Audit SEO',
            description: 'Analyse complète SEO',
            icon: Icons.search,
            status: 'Terminé',
            actionButtonText: 'Voir rapport',
            color: const Color(0xFFE67E22),
            progress: 1.0,
            steps: ['Analyse technique', 'Audit contenu', 'Analyse concurrentielle', 'Rapport'],
            startDate: DateTime.now().subtract(const Duration(days: 45)),
            endDate: DateTime.now().subtract(const Duration(days: 15)),
          ),
          ServiceFeature(
            title: 'Campagnes Ads',
            description: 'Gestion publicités digitales',
            icon: Icons.ads_click,
            status: 'En cours',
            actionButtonText: 'Optimiser',
            color: const Color(0xFF9B59B6),
            progress: 0.75,
            steps: ['Stratégie', 'Création', 'Lancement', 'Optimisation'],
            startDate: DateTime.now().subtract(const Duration(days: 30)),
            endDate: DateTime.now().add(const Duration(days: 30)),
          ),
          ServiceFeature(
            title: 'Vidéo Marketing',
            description: 'Création contenu vidéo',
            icon: Icons.videocam,
            status: 'En attente',
            actionButtonText: 'Planifier',
            color: const Color(0xFF4A90E2),
            progress: 0.0,
            steps: ['Script', 'Tournage', 'Montage', 'Publication'],
          ),
          ServiceFeature(
            title: 'Analyse Stratégique',
            description: 'Consultation business',
            icon: Icons.business_center,
            status: 'Terminé',
            actionButtonText: 'Voir analyse',
            color: const Color(0xFF00A859),
            progress: 1.0,
            steps: ['Diagnostic', 'Analyse', 'Recommandations', 'Plan d\'action'],
            startDate: DateTime.now().subtract(const Duration(days: 60)),
            endDate: DateTime.now().subtract(const Duration(days: 30)),
          ),
        ],
        metrics: {
          'performance': 97,
          'storage': 95,
          'users': 10,
          'uptime': 99.99,
        },
      ),
    ];
    
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: _currentPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showPackageDetails(BuildContext context, PricingPackage package) {
    showDialog(
      context: context,
      builder: (context) => PackageDetailDialog(package: package),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Choisissez votre Plan',
          style: GoogleFonts.poppins(
            color: const Color(0xFF2D3748),
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Color(0xFF4A5568)),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Sélectionnez le plan parfait pour vos besoins',
            style: GoogleFonts.poppins(
              color: const Color(0xFF718096),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: packages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.0);
                    }
                    return Center(
                      child: Transform.scale(
                        scale: value,
                        child: PricingCard(
                          package: packages[index],
                          onViewDetails: () =>
                              _showPackageDetails(context, packages[index]),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                packages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 30 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? packages[index].primaryColor
                        : const Color(0xFFCBD5E0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Comment choisir?'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHelpItem(
                Icons.business,
                'Pack Start',
                'Idéal pour les nouvelles entreprises qui débutent en ligne',
              ),
              _buildHelpItem(
                Icons.trending_up,
                'Pack Premium',
                'Parfait pour les entreprises en croissance avec des besoins réguliers',
              ),
              _buildHelpItem(
                Icons.star,
                'Service A LA CARTE',
                'Pour les entreprises établies ayant besoin de services avancés',
              ),
              const SizedBox(height: 20),
              Text(
                'Conseil: Commencez par le pack Start et améliorez selon vos besoins!',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF4A5568),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('COMPRIS'),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF4A90E2), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pricing Card Widget
class PricingCard extends StatelessWidget {
  final PricingPackage package;
  final VoidCallback onViewDetails;

  const PricingCard({
    super.key,
    required this.package,
    required this.onViewDetails,
  });

  void _showPaymentOptions(BuildContext context, PricingPackage package) {
    if (package.title == 'SERVICE SUR MESURE') {
      _showContactForm(context, package);
      return;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choisissez votre mode de paiement',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 20),
              
              // Baridimob Option with Image
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A859).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/baridimob.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(
                  'Baridimob',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('Paiement mobile sécurisé'),
                onTap: () {
                  Navigator.pop(context);
                  _payWithBaridimob(context, package);
                },
              ),
              
              // Dahabiya Option with Image
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0056A3).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/dahabiya.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(
                  'Carte Dahabiya',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('Carte bancaire algérienne'),
                onTap: () {
                  Navigator.pop(context);
                  _payWithDahabiya(context, package);
                },
              ),
              
              const SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    'ANNULER',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF718096),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showContactForm(BuildContext context, PricingPackage package) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Service Sur Mesure'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.contact_mail, size: 60, color: Color(0xFFE67E22)),
              const SizedBox(height: 20),
              const Text(
                'Contactez-nous pour un devis personnalisé',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nom complet',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description de vos besoins',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ANNULER'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE67E22),
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Demande envoyée! Nous vous contacterons sous 24h.'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('ENVOYER LA DEMANDE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _payWithBaridimob(BuildContext context, PricingPackage package) {
    final monthlyAmount = package.title == 'PACK START' ? 4500 : 8500;
    final annualAmount = package.title == 'PACK START' ? 48000 : 91800;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Paiement Baridimob'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Baridimob Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/baridimob.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Paiement mobile sécurisé',
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                'Forfait: ${package.title}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Instructions de paiement:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text('1. Composez *111# sur votre mobile'),
                    Text('2. Sélectionnez "Paiement de facture"'),
                    Text('3. Entrez le code: BARIDI12345'),
                    SizedBox(height: 10),
                    Text('Prix Mensuel: DA 4,500'),
                    Text('Prix Annuel: DA 48,000'),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ANNULER'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A859),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, 'Baridimob', monthlyAmount.toDouble(), 'Mensuel');
            },
            child: const Text('PAYER MENSUEL', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A90E2),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, 'Baridimob', annualAmount.toDouble(), 'Annuel');
            },
            child: const Text('PAYER ANNUEL', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _payWithDahabiya(BuildContext context, PricingPackage package) {
    final monthlyAmount = package.title == 'PACK START' ? 4500 : 8500;
    final annualAmount = package.title == 'PACK START' ? 48000 : 91800;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Paiement Carte Dahabiya'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dahabiya Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/dahabiya.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Paiement sécurisé par carte bancaire',
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                'Forfait: ${package.title}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                'Prix Mensuel: DA ${monthlyAmount.toStringAsFixed(0).replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]},'
                )}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                'Prix Annuel: DA ${annualAmount.toStringAsFixed(0).replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]},'
                )}',
                style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF00A859)),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Numéro de carte',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.credit_card),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Date d\'expiration',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'MM/AA',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CVV',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: '123',
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ANNULER'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0056A3),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, 'Carte Dahabiya', monthlyAmount.toDouble(), 'Mensuel');
            },
            child: const Text('PAYER MENSUEL', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A90E2),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, 'Carte Dahabiya', annualAmount.toDouble(), 'Annuel');
            },
            child: const Text('PAYER ANNUEL', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showPaymentSuccess(BuildContext context, PricingPackage package, String method, double amount, String period) {
    final invoiceNumber = 'INV-${DateTime.now().millisecondsSinceEpoch}';
    final transactionId = 'TXN-${DateTime.now().millisecondsSinceEpoch}';
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 20),
              Text(
                'Paiement Réussi!',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Votre abonnement a été activé avec succès',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF4A5568),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    _buildSuccessDetail('Forfait', package.title),
                    const SizedBox(height: 8),
                    _buildSuccessDetail('Mode de paiement', method),
                    const SizedBox(height: 8),
                    _buildSuccessDetail('Période', period),
                    const SizedBox(height: 8),
                    _buildSuccessDetail('Montant', 'DA ${amount.toStringAsFixed(0)}'),
                    const SizedBox(height: 8),
                    _buildSuccessDetail('Facture N°', invoiceNumber),
                    const SizedBox(height: 8),
                    _buildSuccessDetail('Transaction ID', transactionId),
                    const SizedBox(height: 8),
                    _buildSuccessDetail('Date', DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('RETOUR À L\'ACCUEIL'),
          ),
          ElevatedButton(
            onPressed: () {
              final paymentInfo = PaymentInfo(
                method: _getPaymentMethod(method),
                amount: amount,
                packageTitle: package.title,
                date: DateTime.now(),
                package: package,
                transactionId: transactionId,
                status: PaymentStatus.completed,
                invoiceNumber: invoiceNumber,
                period: period,
              );
              
              final updates = [
                ServiceUpdate(
                  title: 'Service activé',
                  description: 'Votre forfait ${package.title} a été activé',
                  date: DateTime.now(),
                  icon: Icons.check_circle,
                  color: const Color(0xFF00A859),
                ),
                ServiceUpdate(
                  title: 'Paiement confirmé',
                  description: 'Paiement ${method} confirmé',
                  date: DateTime.now(),
                  icon: Icons.payment,
                  color: const Color(0xFF4A90E2),
                ),
                ServiceUpdate(
                  title: 'Configuration initiale',
                  description: 'Configuration de votre tableau de bord',
                  date: DateTime.now(),
                  icon: Icons.settings,
                  color: const Color(0xFFE67E22),
                ),
              ];
              
              final supportTickets = [
                SupportTicket(
                  id: 'TICKET-001',
                  title: 'Bienvenue à bord!',
                  description: 'Votre compte a été créé avec succès',
                  date: DateTime.now(),
                  status: 'Fermé',
                  priority: 'Normal',
                ),
              ];
              
              final activeService = ActiveService(
                paymentInfo: paymentInfo,
                startDate: DateTime.now(),
                endDate: period == 'Annuel' 
                  ? DateTime.now().add(const Duration(days: 365))
                  : DateTime.now().add(const Duration(days: 30)),
                features: package.serviceFeatures,
                status: 'Active',
                overallProgress: 0.25,
                updates: updates,
                usageStats: {
                  'dailyUsage': 2,
                  'weeklyUsage': 14,
                  'monthlyUsage': 60,
                  'storageUsed': '15GB',
                  'apiCalls': 1250,
                },
                supportTickets: supportTickets,
              );
              
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDashboard(activeService: activeService),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: package.primaryColor,
            ),
            child: const Text('ACCÉDER À MON TABLEAU DE BORD', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  PaymentMethod _getPaymentMethod(String method) {
    switch (method) {
      case 'Baridimob':
        return PaymentMethod.baridimob;
      case 'Carte Dahabiya':
        return PaymentMethod.dahabiya;
      default:
        return PaymentMethod.none;
    }
  }

  Widget _buildSuccessDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            '$label:',
            style: GoogleFonts.poppins(
              color: const Color(0xFF718096),
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              color: const Color(0xFF2D3748),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: package.primaryColor.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    package.primaryColor,
                    package.secondaryColor ??
                        package.primaryColor.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    package.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    package.description,
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        package.monthlyPrice,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 52,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          '/mois',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF718096),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    package.annualPrice,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF4A90E2),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      '/an',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF4A90E2),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatPreview(Icons.speed, '${package.metrics['performance']}%', 'Performance'),
                  _buildStatPreview(Icons.people, '${package.metrics['users']}', 'Utilisateurs'),
                  _buildStatPreview(Icons.storage, '${package.metrics['storage']}%', 'Stockage'),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: package.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: package.primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: onViewDetails,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: package.primaryColor,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'VOIR LES DÉTAILS COMPLETS',
                          style: GoogleFonts.poppins(
                            color: package.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 1,
              color: const Color(0xFFE2E8F0),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: package.features.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: package.primaryColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: package.primaryColor,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              package.features[index],
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF4A5568),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.widgets, color: package.primaryColor, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    '${package.serviceFeatures.length} services inclus',
                    style: GoogleFonts.poppins(
                      color: package.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      package.primaryColor,
                      package.secondaryColor ?? package.primaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: package.primaryColor.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      _showPaymentOptions(context, package);
                    },
                    child: Center(
                      child: Text(
                        package.title == 'SERVICE SUR MESURE' 
                          ? 'CONTACTER POUR DEVIS'
                          : 'ACHETER MAINTENANT',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatPreview(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: package.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: package.primaryColor, size: 20),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: const Color(0xFF2D3748),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: const Color(0xFF718096),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}