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
      title: 'Forfaits tarifaires',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PricingScreen(),
    );
  }
}

// Model Class - Enhanced with more details
class PricingPackage {
  final String title;
  final String description;
  final String price;
  final List<String> features;
  final Color primaryColor;
  final Color? secondaryColor;
  final String details; // Added detailed description
  final List<String> additionalInfo; // Added additional information

  PricingPackage({
    required this.title,
    required this.description,
    required this.price,
    required this.features,
    required this.primaryColor,
    this.secondaryColor,
    required this.details,
    required this.additionalInfo,
  });
}

// Detail Dialog Widget with Scroll
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
              // Header with gradient
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
              
              // Price section
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
              ),
              
              // Detailed description
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
              
              // Features section
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
              
              // Additional information
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
              
              // Action buttons - ONLY CLOSE BUTTON
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                child: Row(
                  children: [
                    // Close button only
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
      title: 'PACK DE LANCEMENT',
      description: 'Nouvelles Start-ups',
      price: '\$35',
      features: [
        'Création de 3 comptes sociaux',
        'Branding personnalisé',
        '5 posts initiaux',
        'Site vitrine simple',
      ],
      primaryColor: const Color(0xFF4A90E2),
      secondaryColor: const Color(0xFF357ABD),
      details: 'Idéal pour les jeunes entreprises souhaitant développer leur présence en ligne. Ce pack comprend tout le nécessaire pour débuter en marketing digital.',
      additionalInfo: [
        'Garantie de remboursement de 30 jours',
        'Assistance par e-mail sous 24 heures',
        'Assistance à la configuration gratuite',
        'Annuler à tout moment',
      ],
    ),
    PricingPackage(
      title: 'ABONNEMENT MENSUEL',
      description: 'Startup / Micro-entreprises',
      price: '\$65',
      features: [
        'Gestion de 2 réseaux sociaux',
        'Calendrier éditorial',
        '12 posts/mois',
        'Reporting léger',
      ],
      primaryColor: const Color(0xFF9B59B6),
      secondaryColor: const Color(0xFFE91E8C),
      details: 'Idéal pour les jeunes entreprises et les micro-entreprises en pleine croissance. Cet abonnement mensuel comprend la gestion continue des médias sociaux et la planification du contenu.',
      additionalInfo: [
        'Assistance prioritaire sous 12 heures',
        'Review stratégique mensuel',
        'Planification du calendrier éditorial',
        'Tableau de bord d\'analyse de performance',
      ],
    ),
    PricingPackage(
      title: 'SERVICES A LA CARTE',
      description: 'Tous clients',
      price: '\$120',
      features: [
        'Audit SEO',
        'Campagnes de publicité (Ads)',
        'Création de contenu vidéo avancé',
        'Analyse d\'entreprise',
      ],
      primaryColor: const Color(0xFFE67E22),
      secondaryColor: const Color(0xFFF39C12),
      details: 'Services à la carte haut de gamme pour les entreprises établies. Choisissez parmi des services marketing avancés adaptés à vos besoins spécifiques.',
      additionalInfo: [
        'Gestionnaire de compte dédié',
        'Assistance téléphonique 24/7',
        'Rapports personnalisés',
        'Séances de consultation stratégique',
      ],
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

// Pricing Card Widget - Updated with detail button ONLY
class PricingCard extends StatelessWidget {
  final PricingPackage package;
  final VoidCallback onViewDetails;

  const PricingCard({
    super.key,
    required this.package,
    required this.onViewDetails,
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
            // Detail Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                          'VOIR LES DÉTAILS',
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
            // Divider
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 1,
              color: const Color(0xFFE2E8F0),
            ),
            // Features List
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
            // BUY NOW Button - STATIC (does nothing)
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
                child: Center(
                  child: Text(
                    'ACHETEZ MAINTENANT',
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
          ],
        ),
      ),
    );
  }
}