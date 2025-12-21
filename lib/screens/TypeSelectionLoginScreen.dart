import 'package:comvest/screens/AdsServices.dart';
import 'package:flutter/material.dart';
import 'companyLogin.dart';
import 'InvestorLogin.dart';
import '../l10n/app_localizations.dart';

class TypeSelectionScreen extends StatelessWidget {
  const TypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 51, 232),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // LOGO
            Image.asset(
              'assets/images/logo1.png',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            // TITLE
            Text(
              localizations.appTitle,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),

            const SizedBox(height: 10),

            // SUBTITLE
            Text(
              localizations.appSubtitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),

            const SizedBox(height: 40),

            /// BOTTOM WHITE PART
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      Text(
                        localizations.welcomeToApp,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        localizations.allServicesHere,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),

                      const SizedBox(height: 40),

                      _buildServiceCard(
                        title: localizations.companyCardTitle,
                        subtitle: localizations.companyCardSubtitle,
                        icon: Icons.business,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const TypeSelectionLoginScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      _buildServiceCard(
                        title: localizations.investorCardTitle,
                        subtitle: localizations.investorCardSubtitle,
                        icon: Icons.trending_up,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const InvestorLoginScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // ADDED INVITE BUTTON - Same style as cards
                      _buildInviteCard(context),
                      
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ADDED: INVITE CARD - Same style as other cards
  Widget _buildInviteCard(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 117, 51, 232).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.person_add_alt_1,
            color: Color.fromARGB(255, 117, 51, 232),
            size: 28,
          ),
        ),
        title: Text(
          localizations.invite,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          localizations.continueAsGuest,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromARGB(255, 117, 51, 232),
          size: 20,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PricingScreen()),
          );
        },
      ),
    );
  }

  /// CARD
  Widget _buildServiceCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 117, 51, 232).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 117, 51, 232),
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromARGB(255, 117, 51, 232),
          size: 20,
        ),
        onTap: onTap,
      ),
    );
  }
}