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

  PricingPackage({
    required this.title,
    required this.description,
    required this.price,
    required this.features,
    required this.primaryColor,
    this.secondaryColor,
  });
}

// Pricing Screen with PageView
class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  late PageController _pageController;
  int _currentPage = 1;

  final List<PricingPackage> packages = [
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
                        child: PricingCard(package: packages[index]),
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

  const PricingCard({super.key, required this.package});

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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected ${package.title} plan'),
                          backgroundColor: package.primaryColor,
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        'BUY NOW',
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
