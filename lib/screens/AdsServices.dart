import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
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
      title: 'Pricing Plans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
    this.status = 'pending',
    this.actionButtonText = 'start',
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
    this.status = 'active',
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
    this.status = 'open',
    this.priority = 'normal',
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final package = widget.activeService.paymentInfo.package;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final currencyFormat = NumberFormat.currency(symbol: 'DA ', decimalDigits: 0);
    
    final _resources = [
      ResourceItem(
        title: l10n.userGuide,
        description: l10n.completeDocumentation,
        icon: Icons.book,
        url: 'https://docs.example.com',
        color: const Color(0xFF4A90E2),
      ),
      ResourceItem(
        title: l10n.videoTutorials,
        description: l10n.videoTraining,
        icon: Icons.video_library,
        url: 'https://videos.example.com',
        color: const Color(0xFFE91E63),
      ),
      ResourceItem(
        title: l10n.faq,
        description: l10n.frequentQuestions,
        icon: Icons.help,
        url: 'https://faq.example.com',
        color: const Color(0xFF00C853),
      ),
      ResourceItem(
        title: l10n.templates,
        description: l10n.readyToUseTemplates,
        icon: Icons.dashboard,
        url: 'https://templates.example.com',
        color: const Color(0xFF9C27B0),
      ),
      ResourceItem(
        title: l10n.community,
        description: l10n.forumAndDiscussions,
        icon: Icons.group,
        url: 'https://community.example.com',
        color: const Color(0xFF2196F3),
      ),
    ];
    
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
              l10n.dashboardTitle,
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
            onPressed: () => _showNotifications(context, l10n),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF4A5568)),
            onPressed: () => _showMoreOptions(context, l10n),
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
                _buildTabButton(l10n.overview, 0, package, l10n),
                _buildTabButton(l10n.services, 1, package, l10n),
                _buildTabButton(l10n.resources, 2, package, l10n),
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
                _buildOverviewTab(context, package, dateFormat, currencyFormat, l10n),
                _buildServicesTab(context, package, l10n),
                _buildResourcesTab(context, _resources, l10n),
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
                    l10n.home,
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
                    l10n.settings,
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
                onTap: () => _showQuickActions(context, package, l10n),
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
                    l10n.help,
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
                    l10n.profile,
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

  Widget _buildTabButton(String title, int index, PricingPackage package, AppLocalizations l10n) {
    final isSelected = _selectedTab == index;
    
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

  Widget _buildOverviewTab(BuildContext context, PricingPackage package, DateFormat dateFormat, NumberFormat currencyFormat, AppLocalizations l10n) {
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
                              l10n.activeService,
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
                        l10n.startDate,
                        dateFormat.format(widget.activeService.startDate),
                        Colors.white,
                        l10n,
                      ),
                      _buildStatCard(
                        Icons.date_range,
                        l10n.endDate,
                        dateFormat.format(widget.activeService.endDate),
                        Colors.white,
                        l10n,
                      ),
                      _buildStatCard(
                        Icons.access_time,
                        l10n.daysRemaining,
                        '${_daysRemaining(widget.activeService.endDate)} ${l10n.days}',
                        Colors.white,
                        l10n,
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
                        l10n.globalProgress,
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
                        l10n.servicesCompleted,
                        '${widget.activeService.features.where((f) => f.status == 'completed').length}',
                        const Color(0xFF00A859),
                        Icons.check_circle,
                        l10n,
                      ),
                      _buildMiniStat(
                        l10n.inProgress,
                        '${widget.activeService.features.where((f) => f.status == 'in_progress').length}',
                        const Color(0xFF4A90E2),
                        Icons.autorenew,
                        l10n,
                      ),
                      _buildMiniStat(
                        l10n.pending,
                        '${widget.activeService.features.where((f) => f.status == 'pending').length}',
                        const Color(0xFFE67E22),
                        Icons.hourglass_empty,
                        l10n,
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
                        l10n.recentActivities,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _showAllActivities(context, l10n),
                        child: Text(
                          l10n.viewAll,
                          style: GoogleFonts.poppins(
                            color: package.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ...widget.activeService.updates.take(3).map((update) => _buildActivityItem(update, l10n)),
                  if (widget.activeService.updates.isEmpty) ...[
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.history, color: const Color(0xFFCBD5E0), size: 48),
                          const SizedBox(height: 10),
                          Text(
                            l10n.noRecentActivity,
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
                    l10n.quickActions,
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
                          l10n.report,
                          package.primaryColor,
                          () => _downloadReport(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.share,
                          l10n.share,
                          const Color(0xFF9B59B6),
                          () => _shareService(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.print,
                          l10n.print,
                          const Color(0xFFE67E22),
                          () => _printInvoice(context, l10n),
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
                          l10n.renew,
                          const Color(0xFF00A859),
                          () => _renewService(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.upgrade,
                          l10n.upgrade,
                          const Color(0xFF3498DB),
                          () => _showUpgradeOptions(context, package, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildQuickActionButton(
                          Icons.support_agent,
                          l10n.support,
                          const Color(0xFFE74C3C),
                          () => _contactSupport(context, l10n),
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

  Widget _buildServicesTab(BuildContext context, PricingPackage package, AppLocalizations l10n) {
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
                return _buildServiceCard(feature, l10n);
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
                    l10n.serviceDetails,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildDetailItem(l10n.invoiceNumber, widget.activeService.paymentInfo.invoiceNumber, l10n),
                  _buildDetailItem(l10n.transactionId, widget.activeService.paymentInfo.transactionId ?? l10n.na, l10n),
                  _buildDetailItem(l10n.paymentMethod, _getPaymentMethodText(widget.activeService.paymentInfo.method, l10n), l10n),
                  _buildDetailItem(l10n.amount, 'DA ${widget.activeService.paymentInfo.amount.toStringAsFixed(0)}', l10n),
                  _buildDetailItem(l10n.nextBilling, DateFormat('dd/MM/yyyy').format(widget.activeService.endDate), l10n),
                  _buildDetailItem(l10n.billingCycle, widget.activeService.paymentInfo.period, l10n),
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
                        l10n.serviceHistory,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF2D3748),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.history, color: package.primaryColor),
                        onPressed: () => _showServiceHistory(context, l10n),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ...widget.activeService.supportTickets.take(2).map((ticket) => _buildHistoryItem(ticket, l10n)),
                  if (widget.activeService.supportTickets.isEmpty) ...[
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.history_toggle_off, color: const Color(0xFFCBD5E0), size: 48),
                          const SizedBox(height: 10),
                          Text(
                            l10n.noHistory,
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

  Widget _buildResourcesTab(BuildContext context, List<ResourceItem> resources, AppLocalizations l10n) {
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
              itemCount: resources.length,
              itemBuilder: (context, index) {
                final resource = resources[index];
                return _buildResourceCard(resource, l10n);
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
                    l10n.communityLearning,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildCommunityItem(
                    l10n.communityForum,
                    l10n.discussWithOtherUsers,
                    Icons.forum,
                    const Color(0xFF9B59B6),
                    l10n,
                  ),
                  _buildCommunityItem(
                    l10n.technicalBlog,
                    l10n.advancedArticlesAndTutorials,
                    Icons.article,
                    const Color(0xFF3498DB),
                    l10n,
                  ),
                  _buildCommunityItem(
                    l10n.webinars,
                    l10n.onlineTrainingSessions,
                    Icons.live_tv,
                    const Color(0xFFE74C3C),
                    l10n,
                  ),
                  _buildCommunityItem(
                    l10n.learningCenter,
                    l10n.coursesAndCertifications,
                    Icons.school,
                    const Color(0xFF2ECC71),
                    l10n,
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
                    l10n.quickSettings,
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
                          l10n.notifications,
                          () => _manageNotifications(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.security,
                          l10n.security,
                          () => _securitySettings(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.payment,
                          l10n.payments,
                          () => _paymentSettings(context, l10n),
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
                          l10n.privacy,
                          () => _privacySettings(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.download,
                          l10n.downloads,
                          () => _downloadSettings(context, l10n),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSettingButton(
                          Icons.language,
                          l10n.language,
                          () => _languageSettings(context, l10n),
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

  Widget _buildStatCard(IconData icon, String title, String value, Color color, AppLocalizations l10n) {
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

  Widget _buildMiniStat(String title, String value, Color color, IconData icon, AppLocalizations l10n) {
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

  Widget _buildActivityItem(ServiceUpdate update, AppLocalizations l10n) {
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

  Widget _buildServiceCard(ServiceFeature feature, AppLocalizations l10n) {
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
          onTap: () => _showServiceDetails(context, feature, l10n),
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

  Widget _buildDetailItem(String label, String value, AppLocalizations l10n) {
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

  Widget _buildHistoryItem(SupportTicket ticket, AppLocalizations l10n) {
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

  Widget _buildResourceCard(ResourceItem resource, AppLocalizations l10n) {
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
                      l10n.access,
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

  Widget _buildCommunityItem(String title, String description, IconData icon, Color color, AppLocalizations l10n) {
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
    switch (status.toLowerCase()) {
      case 'completed':
      case 'termine':
      case 'مكتمل':
        return const Color(0xFF00A859);
      case 'in_progress':
      case 'en cours':
      case 'قيد التنفيذ':
        return const Color(0xFF4A90E2);
      case 'open':
      case 'ouvert':
      case 'مفتوح':
        return const Color(0xFF3498DB);
      case 'closed':
      case 'ferme':
      case 'مغلق':
        return const Color(0xFF95A5A6);
      default:
        return const Color(0xFFE67E22);
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
      case 'haute':
      case 'عالية':
        return const Color(0xFFE74C3C);
      case 'medium':
      case 'moyenne':
      case 'متوسطة':
        return const Color(0xFFF39C12);
      default:
        return const Color(0xFF3498DB);
    }
  }

  String _getPaymentMethodText(PaymentMethod method, AppLocalizations l10n) {
    switch (method) {
      case PaymentMethod.baridimob:
        return 'Baridimob';
      case PaymentMethod.dahabiya:
        return l10n.algerianCard;
      case PaymentMethod.creditCard:
        return l10n.creditCard;
      case PaymentMethod.paypal:
        return 'PayPal';
      default:
        return l10n.other;
    }
  }

  void _showNotifications(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.notifications),
        content: SizedBox(
          height: 300,
          child: ListView(
            children: [
              _buildNotificationItem(l10n.newMessage, l10n.receivedNewMessageFromSupport, Icons.message, Colors.blue),
              _buildNotificationItem(l10n.invoiceAvailable, l10n.yourJuneInvoiceIsAvailable, Icons.receipt, Colors.green),
              _buildNotificationItem(l10n.systemUpdate, l10n.newUpdateAvailable, Icons.system_update, Colors.orange),
              _buildNotificationItem(l10n.paymentReminder, l10n.yourPaymentIsDueIn3Days, Icons.payment, Colors.red),
              _buildNotificationItem(l10n.serviceCompleted, l10n.yourSeoAuditIsCompleted, Icons.check_circle, Colors.purple),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.markAllAsRead),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
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

  void _showMoreOptions(BuildContext context, AppLocalizations l10n) {
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
                title: Text(l10n.myProfile),
                onTap: () {
                  Navigator.pop(context);
                  _showProfile(context, l10n);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(l10n.settings),
                onTap: () {
                  Navigator.pop(context);
                  _showSettings(context, l10n);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_center),
                title: Text(l10n.helpCenter),
                onTap: () {
                  Navigator.pop(context);
                  _showHelpCenter(context, l10n);
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: Text(l10n.feedback),
                onTap: () {
                  Navigator.pop(context);
                  _showFeedback(context, l10n);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: Text(l10n.about),
                onTap: () {
                  Navigator.pop(context);
                  _showAbout(context, l10n);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(l10n.logout, style: const TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  _logout(context, l10n);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuickActions(BuildContext context, PricingPackage package, AppLocalizations l10n) {
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
                l10n.quickActions,
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
                  _buildQuickActionChip(Icons.add_chart, l10n.newReport, package.primaryColor),
                  _buildQuickActionChip(Icons.calendar_today, l10n.schedule, const Color(0xFF00A859)),
                  _buildQuickActionChip(Icons.share, l10n.share, const Color(0xFF9B59B6)),
                  _buildQuickActionChip(Icons.download, l10n.export, const Color(0xFFE67E22)),
                  _buildQuickActionChip(Icons.print, l10n.print, const Color(0xFF3498DB)),
                  _buildQuickActionChip(Icons.backup, l10n.backup, const Color(0xFFE91E63)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.close),
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

  void _showAllActivities(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.allActivities),
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
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _downloadReport(BuildContext context, AppLocalizations l10n) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.downloadingReport),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _shareService(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.shareService),
        content: Text(l10n.choosePlatformToShare),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.share),
          ),
        ],
      ),
    );
  }

  void _printInvoice(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.printInvoice),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.print, size: 60, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              '${l10n.invoiceNumber}: ${widget.activeService.paymentInfo.invoiceNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('${l10n.amount}: DA ${widget.activeService.paymentInfo.amount}'),
            const SizedBox(height: 10),
            Text('${l10n.date}: ${DateFormat('dd/MM/yyyy').format(widget.activeService.paymentInfo.date)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.print),
          ),
        ],
      ),
    );
  }

  void _renewService(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.renewService),
        content: Text(l10n.renewConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.later),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.renewedSuccess),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(l10n.renew),
          ),
        ],
      ),
    );
  }

  void _showUpgradeOptions(BuildContext context, PricingPackage package, AppLocalizations l10n) {
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
                l10n.upgradePlan,
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
                      l10n.premiumPlan,
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
                  child: Text(l10n.upgradeOptions),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.later),
              ),
            ],
          ),
        );
      },
    );
  }

  void _contactSupport(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.contactSupport),
        content: Text(l10n.howToContact),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.chat),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.email),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.call),
          ),
        ],
      ),
    );
  }

  void _showServiceDetails(BuildContext context, ServiceFeature feature, AppLocalizations l10n) {
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
            Text('${(feature.progress * 100).toStringAsFixed(0)}% ${l10n.completed}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  void _showServiceHistory(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.serviceHistoryFull),
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
            child: Text(l10n.close),
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

  void _manageNotifications(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.notificationManagement)),
          body: Center(child: Text(l10n.notificationManagementPage)),
        ),
      ),
    );
  }

  void _securitySettings(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.securitySettings)),
          body: Center(child: Text(l10n.securitySettingsPage)),
        ),
      ),
    );
  }

  void _paymentSettings(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.paymentSettings)),
          body: Center(child: Text(l10n.paymentSettingsPage)),
        ),
      ),
    );
  }

  void _privacySettings(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.privacy)),
          body: Center(child: Text(l10n.privacySettingsPage)),
        ),
      ),
    );
  }

  void _downloadSettings(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.downloads)),
          body: Center(child: Text(l10n.downloadSettingsPage)),
        ),
      ),
    );
  }

  void _languageSettings(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.changeLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l10n.french),
              leading: const Icon(Icons.language),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text(l10n.english),
              leading: const Icon(Icons.language),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text(l10n.arabic),
              leading: const Icon(Icons.language),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfile(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.myProfile)),
          body: Center(child: Text(l10n.userProfilePage)),
        ),
      ),
    );
  }

  void _showSettings(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.settings)),
          body: Center(child: Text(l10n.generalSettingsPage)),
        ),
      ),
    );
  }

  void _showHelpCenter(BuildContext context, AppLocalizations l10n) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(l10n.helpCenter)),
          body: Center(child: Text(l10n.helpCenterPage)),
        ),
      ),
    );
  }

  void _showFeedback(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.giveFeedback),
        content: TextField(
          decoration: InputDecoration(
            hintText: l10n.writeYourFeedbackHere,
            border: const OutlineInputBorder(),
          ),
          maxLines: 5,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.thanksForYourFeedback)),
              );
            },
            child: Text(l10n.send),
          ),
        ],
      ),
    );
  }

  void _showAbout(BuildContext context, AppLocalizations l10n) {
    showAboutDialog(
      context: context,
      applicationName: l10n.serviceDashboard,
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2024 ${l10n.yourCompany}. ${l10n.allRightsReserved}.',
      children: [
        Text(l10n.thisAppHelpsManageServices),
      ],
    );
  }

  void _logout(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.confirmLogout),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(l10n.logoutConfirm, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// Detail Dialog Widget
class PackageDetailDialog extends StatelessWidget {
  final PricingPackage package;
  final AppLocalizations l10n;

  const PackageDetailDialog({super.key, required this.package, required this.l10n});

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
                            '/${l10n.monthly.toLowerCase()}',
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
                        '/${l10n.annually.toLowerCase()}',
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
                      l10n.keyFeatures,
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
                      l10n.includedServices,
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
                        '+ ${package.serviceFeatures.length - 3} ${l10n.services}', 
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
                        l10n.additionalInfo,
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
                                l10n.close.toUpperCase(),
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

  @override
  void initState() {
    super.initState();
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

  void _showPackageDetails(BuildContext context, PricingPackage package, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => PackageDetailDialog(package: package, l10n: l10n),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Define packages inside build method to access l10n
    final packages = [
      PricingPackage(
        title: l10n.packStart,
        description: l10n.packStartDesc,
        monthlyPrice: l10n.packStartMonthlyPrice,
        annualPrice: l10n.packStartAnnualPrice,
        features: [
          l10n.feature1,
          l10n.feature2,
          l10n.feature3,
          l10n.feature4,
          l10n.feature5,
          l10n.feature6,
        ],
        primaryColor: const Color(0xFF4A90E2),
        secondaryColor: const Color(0xFF357ABD),
        details: l10n.packStartDetails,
        additionalInfo: [
          l10n.info1,
          l10n.info2,
          l10n.info3,
          l10n.info4,
          l10n.info5,
          l10n.info6,
        ],
        serviceFeatures: [
          ServiceFeature(
            title: l10n.serviceFeature1Title,
            description: l10n.serviceFeature1Desc,
            icon: Icons.account_circle,
            status: 'pending',
            actionButtonText: l10n.start,
            color: const Color(0xFF4A90E2),
            progress: 0.0,
            steps: [l10n.analysis, l10n.setup, l10n.validation],
          ),
          ServiceFeature(
            title: l10n.serviceFeature2Title,
            description: l10n.serviceFeature2Desc,
            icon: Icons.palette,
            status: 'pending',
            actionButtonText: l10n.start,
            color: const Color(0xFF9B59B6),
            progress: 0.0,
            steps: [l10n.briefing, l10n.design, l10n.revision, l10n.finalization],
          ),
          ServiceFeature(
            title: l10n.serviceFeature3Title,
            description: l10n.serviceFeature3Desc,
            icon: Icons.create,
            status: 'pending',
            actionButtonText: l10n.schedule,
            color: const Color(0xFFE67E22),
            progress: 0.0,
            steps: [l10n.strategy, l10n.creation, l10n.approval, l10n.publication],
          ),
          ServiceFeature(
            title: l10n.serviceFeature4Title,
            description: l10n.serviceFeature4Desc,
            icon: Icons.language,
            status: 'pending',
            actionButtonText: l10n.configure,
            color: const Color(0xFF00A859),
            progress: 0.0,
            steps: [l10n.wireframe, l10n.development, l10n.test, l10n.launch],
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
        title: l10n.packPremium,
        description: l10n.packPremiumDesc,
        monthlyPrice: l10n.packPremiumMonthlyPrice,
        annualPrice: l10n.packPremiumAnnualPrice,
        features: [
          l10n.premiumFeature1,
          l10n.premiumFeature2,
          l10n.premiumFeature3,
          l10n.premiumFeature4,
          l10n.premiumFeature5,
          l10n.premiumFeature6,
        ],
        primaryColor: const Color(0xFF9B59B6),
        secondaryColor: const Color(0xFFE91E8C),
        details: l10n.packPremiumDetails,
        additionalInfo: [
          l10n.premiumInfo1,
          l10n.premiumInfo2,
          l10n.premiumInfo3,
          l10n.premiumInfo4,
          l10n.premiumInfo5,
          l10n.premiumInfo6,
        ],
        serviceFeatures: [
          ServiceFeature(
            title: l10n.premiumService1Title,
            description: l10n.premiumService1Desc,
            icon: Icons.thumb_up,
            status: 'in_progress',
            actionButtonText: l10n.continueText,
            color: const Color(0xFF9B59B6),
            progress: 0.6,
            steps: [l10n.audit, l10n.strategy, l10n.execution, l10n.optimization],
            startDate: DateTime.now().subtract(const Duration(days: 15)),
            endDate: DateTime.now().add(const Duration(days: 15)),
          ),
          ServiceFeature(
            title: l10n.premiumService2Title,
            description: l10n.premiumService2Desc,
            icon: Icons.calendar_today,
            status: 'completed',
            actionButtonText: l10n.view,
            color: const Color(0xFF4A90E2),
            progress: 1.0,
            steps: [l10n.planning, l10n.creation, l10n.validation],
            startDate: DateTime.now().subtract(const Duration(days: 30)),
            endDate: DateTime.now().subtract(const Duration(days: 10)),
          ),
          ServiceFeature(
            title: l10n.premiumService3Title,
            description: l10n.premiumService3Desc,
            icon: Icons.edit,
            status: 'in_progress',
            actionButtonText: l10n.edit,
            color: const Color(0xFFE67E22),
            progress: 0.4,
            steps: [l10n.briefing, l10n.creation, l10n.revision, l10n.publication],
            startDate: DateTime.now().subtract(const Duration(days: 10)),
            endDate: DateTime.now().add(const Duration(days: 20)),
          ),
          ServiceFeature(
            title: l10n.premiumService4Title,
            description: l10n.premiumService4Desc,
            icon: Icons.analytics,
            status: 'pending',
            actionButtonText: l10n.configure,
            color: const Color(0xFF00A859),
            progress: 0.0,
            steps: [l10n.setup, l10n.collection, l10n.analysis, l10n.reporting],
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
        title: l10n.customService,
        description: l10n.customServiceDesc,
        monthlyPrice: l10n.customServiceMonthlyPrice,
        annualPrice: l10n.customServiceAnnualPrice,
        features: [
          l10n.customFeature1,
          l10n.customFeature2,
          l10n.customFeature3,
          l10n.customFeature4,
          l10n.customFeature5,
          l10n.customFeature6,
        ],
        primaryColor: const Color(0xFFE67E22),
        secondaryColor: const Color(0xFFF39C12),
        details: l10n.customServiceDetails,
        additionalInfo: [
          l10n.customInfo1,
          l10n.customInfo2,
          l10n.customInfo3,
          l10n.customInfo4,
          l10n.customInfo5,
          l10n.customInfo6,
        ],
        serviceFeatures: [
          ServiceFeature(
            title: l10n.customService1Title,
            description: l10n.customService1Desc,
            icon: Icons.search,
            status: 'completed',
            actionButtonText: l10n.viewReport,
            color: const Color(0xFFE67E22),
            progress: 1.0,
            steps: [l10n.technicalAnalysis, l10n.contentAudit, l10n.competitiveAnalysis, l10n.report],
            startDate: DateTime.now().subtract(const Duration(days: 45)),
            endDate: DateTime.now().subtract(const Duration(days: 15)),
          ),
          ServiceFeature(
            title: l10n.customService2Title,
            description: l10n.customService2Desc,
            icon: Icons.ads_click,
            status: 'in_progress',
            actionButtonText: l10n.optimize,
            color: const Color(0xFF9B59B6),
            progress: 0.75,
            steps: [l10n.strategy, l10n.creation, l10n.launch, l10n.optimization],
            startDate: DateTime.now().subtract(const Duration(days: 30)),
            endDate: DateTime.now().add(const Duration(days: 30)),
          ),
          ServiceFeature(
            title: l10n.customService3Title,
            description: l10n.customService3Desc,
            icon: Icons.videocam,
            status: 'pending',
            actionButtonText: l10n.schedule,
            color: const Color(0xFF4A90E2),
            progress: 0.0,
            steps: [l10n.script, l10n.shooting, l10n.editing, l10n.publication],
          ),
          ServiceFeature(
            title: l10n.customService4Title,
            description: l10n.customService4Desc,
            icon: Icons.business_center,
            status: 'completed',
            actionButtonText: l10n.viewAnalysis,
            color: const Color(0xFF00A859),
            progress: 1.0,
            steps: [l10n.diagnosis, l10n.analysis, l10n.recommendations, l10n.actionPlan],
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
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.pricingTitle,
          style: GoogleFonts.poppins(
            color: const Color(0xFF2D3748),
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Color(0xFF4A5568)),
            onPressed: () => _showHelpDialog(context, l10n),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            l10n.pricingSubtitle,
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
                              _showPackageDetails(context, packages[index], l10n),
                          l10n: l10n,
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

  void _showHelpDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.howToChoose),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHelpItem(
                Icons.business,
                l10n.packStart,
                l10n.idealForNewBusinesses,
                l10n,
              ),
              _buildHelpItem(
                Icons.trending_up,
                l10n.packPremium,
                l10n.perfectForGrowingBusinesses,
                l10n,
              ),
              _buildHelpItem(
                Icons.star,
                l10n.customService,
                l10n.forEstablishedBusinesses,
                l10n,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.advice,
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
            child: Text(l10n.gotIt.toUpperCase()),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(IconData icon, String title, String description, AppLocalizations l10n) {
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
  final AppLocalizations l10n;
  
  bool _isArabic(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ar';
  }
  
  const PricingCard({
    super.key,
    required this.package,
    required this.onViewDetails,
    required this.l10n,
  });

  void _showPaymentOptions(BuildContext context, PricingPackage package, AppLocalizations l10n) {
    if (package.title == l10n.customService) {
      _showContactForm(context, package, l10n);
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
                l10n.choosePaymentMethod,
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
                subtitle: Text(l10n.mobilePayment),
                onTap: () {
                  Navigator.pop(context);
                  _payWithBaridimob(context, package, l10n);
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
                  l10n.algerianCard,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('Dahabiya bank card'),
                onTap: () {
                  Navigator.pop(context);
                  _payWithDahabiya(context, package, l10n);
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
                    l10n.cancel.toUpperCase(),
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

  void _showContactForm(BuildContext context, PricingPackage package, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.customServiceTitle),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.contact_mail, size: 60, color: Color(0xFFE67E22)),
              const SizedBox(height: 20),
              Text(
                l10n.contactForCustomQuote,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: l10n.fullName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: l10n.email,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: l10n.phone,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: l10n.describeYourNeeds,
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
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE67E22),
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.requestSentWeWillContactYou),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(l10n.sendRequest.toUpperCase(), style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _payWithBaridimob(BuildContext context, PricingPackage package, AppLocalizations l10n) {
    final monthlyAmount = package.title == l10n.packStart ? 4500 : 8500;
    final annualAmount = package.title == l10n.packStart ? 48000 : 91800;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Baridimob ${l10n.payment}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF00A859).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/images/baridimob.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.secureMobilePayment,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                '${l10n.plan}: ${package.title}',
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
                  children: [
                    Text(
                      l10n.paymentInstructions,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text('1. ${l10n.dialCodeOnYourMobile}'),
                    Text('2. ${l10n.selectBillPayment}'),
                    Text('3. ${l10n.enterCodeBARIDI12345}'),
                    const SizedBox(height: 10),
                    Text('${l10n.monthlyPrice}: DA $monthlyAmount'),
                    Text('${l10n.annualPrice}: DA $annualAmount'),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A859),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, 'Baridimob', monthlyAmount.toDouble(), l10n.monthly, l10n);
            },
            child: Text(l10n.payMonthly.toUpperCase(), style: const TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A90E2),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, 'Baridimob', annualAmount.toDouble(), l10n.annually, l10n);
            },
            child: Text(l10n.payAnnually.toUpperCase(), style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _payWithDahabiya(BuildContext context, PricingPackage package, AppLocalizations l10n) {
    final monthlyAmount = package.title == l10n.packStart ? 4500 : 8500;
    final annualAmount = package.title == l10n.packStart ? 48000 : 91800;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${l10n.algerianCard} ${l10n.payment}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF0056A3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/images/dahabiya.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.secureCardPayment,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                '${l10n.plan}: ${package.title}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                '${l10n.monthlyPrice}: DA $monthlyAmount',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                '${l10n.annualPrice}: DA $annualAmount',
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
                        labelText: l10n.cardNumber,
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
                              labelText: l10n.expirationDate,
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
                              labelText: l10n.cvv,
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
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0056A3),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, l10n.algerianCard, monthlyAmount.toDouble(), l10n.monthly, l10n);
            },
            child: Text(l10n.payMonthly.toUpperCase(), style: const TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A90E2),
            ),
            onPressed: () {
              Navigator.pop(context);
              _showPaymentSuccess(context, package, l10n.algerianCard, annualAmount.toDouble(), l10n.annually, l10n);
            },
            child: Text(l10n.payAnnually.toUpperCase(), style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showPaymentSuccess(BuildContext context, PricingPackage package, String method, double amount, String period, AppLocalizations l10n) {
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
                l10n.paymentSuccessful,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.subscriptionActivated,
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
                    _buildSuccessDetail(l10n.plan, package.title, l10n),
                    const SizedBox(height: 8),
                    _buildSuccessDetail(l10n.paymentMethod, method, l10n),
                    const SizedBox(height: 8),
                    _buildSuccessDetail(l10n.period, period, l10n),
                    const SizedBox(height: 8),
                    _buildSuccessDetail(l10n.amount, 'DA ${amount.toStringAsFixed(0)}', l10n),
                    const SizedBox(height: 8),
                    _buildSuccessDetail(l10n.invoiceNumber, invoiceNumber, l10n),
                    const SizedBox(height: 8),
                    _buildSuccessDetail(l10n.transactionId, transactionId, l10n),
                    const SizedBox(height: 8),
                    _buildSuccessDetail(l10n.date, DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()), l10n),
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
            child: Text(l10n.returnHome.toUpperCase()),
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
                  title: l10n.serviceActivated,
                  description: '${l10n.yourPlan} ${package.title} ${l10n.hasBeenActivated}',
                  date: DateTime.now(),
                  icon: Icons.check_circle,
                  color: const Color(0xFF00A859),
                ),
                ServiceUpdate(
                  title: l10n.paymentConfirmed,
                  description: '${method} ${l10n.paymentConfirmedDesc}',
                  date: DateTime.now(),
                  icon: Icons.payment,
                  color: const Color(0xFF4A90E2),
                ),
                ServiceUpdate(
                  title: l10n.initialSetup,
                  description: l10n.settingUpYourDashboard,
                  date: DateTime.now(),
                  icon: Icons.settings,
                  color: const Color(0xFFE67E22),
                ),
              ];
              
              final supportTickets = [
                SupportTicket(
                  id: 'TICKET-001',
                  title: l10n.welcomeAboard,
                  description: l10n.yourAccountCreatedSuccessfully,
                  date: DateTime.now(),
                  status: 'closed',
                  priority: 'normal',
                ),
              ];
              
              final activeService = ActiveService(
                paymentInfo: paymentInfo,
                startDate: DateTime.now(),
                endDate: period == l10n.annually 
                  ? DateTime.now().add(const Duration(days: 365))
                  : DateTime.now().add(const Duration(days: 30)),
                features: package.serviceFeatures,
                status: 'active',
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
            child: Text(l10n.accessDashboard.toUpperCase(), style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  PaymentMethod _getPaymentMethod(String method) {
    if (method.contains('Baridimob')) {
      return PaymentMethod.baridimob;
    } else if (method.contains('Dahabiya') || method.contains('algerian') || method.contains('algérienne')) {
      return PaymentMethod.dahabiya;
    } else {
      return PaymentMethod.none;
    }
  }

  Widget _buildSuccessDetail(String label, String value, AppLocalizations l10n) {
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
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      package.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: _isArabic(context) ? 20 : 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: _isArabic(context) ? 0.0 : 2,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      package.description,
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: _isArabic(context) ? 12 : 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                          '/${l10n.monthly.toLowerCase()}',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF718096),
                            fontSize: 15,
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
                      '/${l10n.annually.toLowerCase()}',
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
                  _buildStatPreview(Icons.speed, '${package.metrics['performance']}%', l10n.performance, l10n),
                  _buildStatPreview(Icons.people, '${package.metrics['users']}', l10n.users, l10n),
                  _buildStatPreview(Icons.storage, '${package.metrics['storage']}%', l10n.storage, l10n),
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
                          l10n.viewFullDetails.toUpperCase(),
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
                    '${package.serviceFeatures.length} ${l10n.includedServices}',
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
                      _showPaymentOptions(context, package, l10n);
                    },
                    child: Center(
                      child: Text(
                        package.title == l10n.customService 
                          ? l10n.contactForQuote.toUpperCase()
                          : l10n.buyNow.toUpperCase(),
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

  Widget _buildStatPreview(IconData icon, String value, String label, AppLocalizations l10n) {
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