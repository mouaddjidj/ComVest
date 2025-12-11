// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pricing Packages',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PricingScreen(),
    );
  }
}

// Model Class
class PricingPackage {
  final String title;
  final String description;
  final String price;
  final List<String> features;
  final Color primaryColor;
  final Color? secondaryColor;
  final bool isFree;

  PricingPackage({
    required this.title,
    required this.description,
    required this.price,
    required this.features,
    required this.primaryColor,
    this.secondaryColor,
    this.isFree = false,
  });
}

// Menu Screen
class MenuScreen extends StatelessWidget {
  final Color primaryColor;
  
  const MenuScreen({super.key, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Free Plan Dashboard',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    primaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🎉 Welcome!',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You\'ve successfully activated your FREE plan. Start exploring all the features available to you.',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Menu Options
            Text(
              'Get Started',
              style: GoogleFonts.poppins(
                color: const Color(0xFF2D3748),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Menu Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                _buildMenuItem(
                  icon: Icons.add_circle_outline,
                  title: 'Create Project',
                  subtitle: 'Start your first project',
                  color: primaryColor,
                ),
                _buildMenuItem(
                  icon:  Icons.dashboard,
                  title: 'Templates',
                  subtitle: 'Browse templates',
                  color: primaryColor,
                ),
                _buildMenuItem(
                  icon: Icons.analytics_outlined,
                  title: 'Analytics',
                  subtitle: 'View your stats',
                  color: primaryColor,
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                  subtitle: 'Get support',
                  color: primaryColor,
                ),
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  subtitle: 'Configure your account',
                  color: primaryColor,
                ),
                _buildMenuItem(
                  icon: Icons.upgrade,
                  title: 'Upgrade Plan',
                  subtitle: 'Unlock more features',
                  color: primaryColor,
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // Project Stats
            Container(
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
                    'Your Free Plan Status',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildProgressItem(
                    label: 'Project Usage',
                    value: '1/1',
                    percentage: 1.0,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 10),
                  _buildProgressItem(
                    label: 'Storage Used',
                    value: '0/500 MB',
                    percentage: 0.0,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 10),
                  _buildProgressItem(
                    label: 'Features Unlocked',
                    value: '5/5',
                    percentage: 1.0,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Quick Actions
            Text(
              'Quick Actions',
              style: GoogleFonts.poppins(
                color: const Color(0xFF2D3748),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(height: 15),
            
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildQuickAction(
                    icon: Icons.video_library,
                    label: 'Watch Tutorial',
                    color: primaryColor,
                  ),
                  const SizedBox(width: 10),
                  _buildQuickAction(
                    icon: Icons.document_scanner,
                    label: 'Read Docs',
                    color: primaryColor,
                  ),
                  const SizedBox(width: 10),
                  _buildQuickAction(
                    icon: Icons.group,
                    label: 'Join Community',
                    color: primaryColor,
                  ),
                  const SizedBox(width: 10),
                  _buildQuickAction(
                    icon: Icons.share,
                    label: 'Invite Friends',
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
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
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2D3748),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressItem({
    required String label,
    required String value,
    required double percentage,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                color: const Color(0xFF4A5568),
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
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: color.withOpacity(0.1),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color(0xFF2D3748),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Pricing Screen with PageView
class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<PricingPackage> packages = [
    PricingPackage(
      title: 'FREE',
      description: 'Get started for free',
      price: '\$0',
      features: [
        '1 Project',
        '500 MB Storage',
        'Community Support',
        'Basic Templates',
        'Limited Analytics',
      ],
      primaryColor: const Color(0xFF2ECC71),
      secondaryColor: const Color(0xFF27AE60),
      isFree: true,
    ),
    PricingPackage(
      title: 'STANDARD',
      description: 'Perfect for individuals',
      price: '\$35',
      features: [
        '5 Projects',
        '10 GB Storage',
        'Email Support',
        'Basic Analytics',
        'API Access',
      ],
      primaryColor: const Color(0xFF4A90E2),
      secondaryColor: const Color(0xFF357ABD),
    ),
    PricingPackage(
      title: 'PREMIUM',
      description: 'Best for professionals',
      price: '\$65',
      features: [
        'Unlimited Projects',
        '100 GB Storage',
        'Priority Support',
        'Advanced Analytics',
        'API Access',
        'Custom Integrations',
      ],
      primaryColor: const Color(0xFF9B59B6),
      secondaryColor: const Color(0xFFE91E8C),
    ),
    PricingPackage(
      title: 'BUSINESS',
      description: 'For teams & enterprises',
      price: '\$120',
      features: [
        'Unlimited Everything',
        '1 TB Storage',
        '24/7 Phone Support',
        'Enterprise Analytics',
        'Full API Access',
        'Dedicated Manager',
        'Custom SLA',
      ],
      primaryColor: const Color(0xFFE67E22),
      secondaryColor: const Color(0xFFF39C12),
    ),
  ];

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

  void _navigateToMenu(BuildContext context, PricingPackage package) {
    if (package.isFree) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuScreen(primaryColor: package.primaryColor),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selected ${package.title} plan',
          ),
          backgroundColor: package.primaryColor,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
          'Choose Your Plan',
          style: GoogleFonts.poppins(
            color: const Color(0xFF2D3748),
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Select the perfect plan for your needs',
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
                          onGetStarted: () => _navigateToMenu(context, packages[index]),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Page Indicator
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
}

// Pricing Card Widget
class PricingCard extends StatelessWidget {
  final PricingPackage package;
  final VoidCallback onGetStarted;

  const PricingCard({
    super.key,
    required this.package,
    required this.onGetStarted,
  });

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
            // Header Section (30%)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    package.primaryColor,
                    package.secondaryColor ?? package.primaryColor.withOpacity(0.8),
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
                  // Free badge for free plan
                  if (package.isFree)
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'POPULAR CHOICE',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Price Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    package.price,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF2D3748),
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (!package.isFree)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        '/mo',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF718096),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Divider
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 1,
              color: const Color(0xFFE2E8F0),
            ),
            // Features List
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
            // Action Button
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  gradient: package.isFree
                      ? LinearGradient(
                          colors: [
                            const Color(0xFF2ECC71),
                            const Color(0xFF27AE60),
                          ],
                        )
                      : LinearGradient(
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
                    onTap: onGetStarted,
                    child: Center(
                      child: Text(
                        package.isFree ? 'GET STARTED FREE' : 'BUY NOW',
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
}