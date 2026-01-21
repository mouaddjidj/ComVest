import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String titleKey; 
  final String subtitle;
  final bool showComvestLogo;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.titleKey,
    required this.subtitle,
    this.showComvestLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Image
          Image.asset(
            image,
            height: 250,
          ),
          const SizedBox(height: 40),

          // Title section
          _buildTitle(context),

          const SizedBox(height: 20),
          
          // Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (showComvestLogo) {
      // First page with combined text and logo in one line
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // "Discover" text
          Text(
            AppLocalizations.of(context)!.discoverComvest,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Logo immediately after text with minimal spacing
          Padding(
            padding: const EdgeInsets.only(left: 4), // Minimal space
            child: Image.asset(
              'assets/images/logo1.png',
              height: 50, // Match text height
            ),
          ),
        ],
      );
    } else {
      // Other pages without logo
      return Text(
        _getLocalizedText(context, titleKey),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      );
    }
  }

  String _getLocalizedText(BuildContext context, String key) {
    switch (key) {
      case 'needVisibility':
        return AppLocalizations.of(context)!.needVisibility;
      case 'buildRelationships':
        return AppLocalizations.of(context)!.buildRelationships;
      default:
        return '';
    }
  }
}