import 'package:comvest/widgets/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';

class CompanyDetailPage extends StatelessWidget {
  final Company company;
  final bool isFollowed;
  final VoidCallback onFollowToggle;

  // Map for company-specific image sizes
  final Map<String, BoxFit> companyImageFit = {
    'TalabaStore': BoxFit.contain,
    'TemTem': BoxFit.fitWidth,
    'ALPAY': BoxFit.fitWidth,
    'Okadoo': BoxFit.fitHeight,
  };

  // Map for specific logo sizes
  final Map<String, Size> companyLogoSize = {
    'TalabaStore': const Size(100, 100),
    'TemTem': const Size(90, 90),
    'ALPAY': const Size(80, 80),
    'Okadoo': const Size(70, 70),
  };

  CompanyDetailPage({
    super.key,
    required this.company,
    required this.isFollowed,
    required this.onFollowToggle,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    // Check if localizations is null
    if (localizations == null) {
      return Scaffold(
        appBar: AppBar(title: Text(company.name)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    
    // Get specific size for this company
    final Size logoSize = companyLogoSize[company.name] ?? const Size(80, 80);
    final BoxFit imageFit = companyImageFit[company.name] ?? BoxFit.contain;
    final double logoFontSize = _getLogoFontSizeForCompany(company.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        actions: [
          IconButton(
            icon: Icon(isFollowed ? Icons.star : Icons.star_border),
            onPressed: onFollowToggle,
            tooltip: isFollowed ? localizations.removeFromFavorites : localizations.addToFavorites,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with logo and main information
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: company.cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  // Company logo
                  Container(
                    width: logoSize.width,
                    height: logoSize.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: company.imagePath.isNotEmpty
                          ? Image.asset(
                              company.imagePath,
                              fit: imageFit,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    company.logo,
                                    style: TextStyle(fontSize: logoFontSize),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                company.logo,
                                style: TextStyle(fontSize: logoFontSize),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          company.industry,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Badge for company type
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _getTypeColor(company.type),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            company.type,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Text(
              localizations.description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              company.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Key Information
            Text(
              localizations.keyInformation,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),

            // Information grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5,
              children: [
                _buildDetailItem(localizations.businessType, company.type),
                _buildDetailItem(localizations.sector, company.sector),
                _buildCEOItem(localizations),
                _buildDetailItem(localizations.foundationDate, company.founded),
                _buildDetailItem(localizations.location, company.location),
                _buildDetailItem(localizations.employeeCount, '${company.employees}'),
                _buildDetailItem(localizations.valuation, '${company.valuation}B DA'),
                _buildDetailItem(localizations.annualRevenue, '${company.revenue}B DA'),
              ],
            ),
            const SizedBox(height: 20),

            // Products & Services
            Text(
              localizations.productsServices,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: company.products.map((product) {
                return Chip(
                  label: Text(product),
                  backgroundColor: company.cardColor.withOpacity(0.1),
                  labelStyle: TextStyle(color: company.cardColor),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Additional Information
            if (company.website.isNotEmpty ||
                company.mobileApps.isNotEmpty ||
                company.users.isNotEmpty ||
                company.coverage.isNotEmpty ||
                company.businessModel.isNotEmpty) ...[
              Text(
                localizations.additionalInformation,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (company.website.isNotEmpty)
                    _buildAdditionalInfo(localizations.website, company.website),
                  if (company.mobileApps.isNotEmpty)
                    _buildMobileAppsInfo(localizations.applications, company.mobileApps),
                  if (company.users.isNotEmpty)
                    _buildAdditionalInfo(localizations.usersCount, company.users),
                  if (company.coverage.isNotEmpty)
                    _buildAdditionalInfo(localizations.coverage, company.coverage),
                  if (company.businessModel.isNotEmpty)
                    _buildAdditionalInfo(
                        localizations.businessModel, company.businessModel),
                ],
              ),
            ],
            const SizedBox(height: 30),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showContactDialog(context, localizations),
                    icon: const Icon(Icons.email),
                    label: Text(localizations.contact),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: company.cardColor),
                      foregroundColor: company.cardColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: isFollowed
                      ? OutlinedButton.icon(
                          onPressed: onFollowToggle,
                          icon: const Icon(Icons.star),
                          label: Text(localizations.removeFromFavorites),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFF1C40F)),
                            foregroundColor: const Color(0xFFF1C40F),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: onFollowToggle,
                          icon: const Icon(Icons.star_border),
                          label: Text(localizations.addToFavorites),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: company.cardColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: company.cardColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: company.cardColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCEOItem(AppLocalizations localizations) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: company.cardColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: company.cardColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'CEO',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            company.ceo,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // NEW: Special widget for mobile apps (List<String>)
  Widget _buildMobileAppsInfo(String title, List<String> apps) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: apps.map((app) => Text(
              '• $app',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  // Function to get type color
  Color _getTypeColor(String type) {
    String typeLower = type.toLowerCase();
    
    if (typeLower.contains('startup') || 
        typeLower.contains('jeune') || 
        typeLower.contains('nouvelle')) {
      return const Color(0xFF3498DB);
    } else if (typeLower.contains('pme') || typeLower.contains('petite')) {
      return const Color(0xFF2ECC71);
    } else if (typeLower.contains('eti')) {
      return const Color(0xFF9B59B6);
    } else if (typeLower.contains('grande') || typeLower.contains('large')) {
      return const Color(0xFFE67E22);
    } else if (typeLower.contains('scale-up') || typeLower.contains('croissance')) {
      return const Color(0xFFF39C12);
    } else {
      return const Color(0xFF95A5A6);
    }
  }

  // Function to get logo font size
  double _getLogoFontSizeForCompany(String companyName) {
    switch (companyName) {
      case 'TalabaStore':
        return 40;
      case 'TemTem':
        return 36;
      case 'ALPAY':
        return 30;
      case 'Okadoo':
        return 28;
      default:
        return 30;
    }
  }

  // Function to show contact dialog
  void _showContactDialog(BuildContext context, AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${localizations.companyContactInfo} ${company.name}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email
              if (company.email.isNotEmpty)
                _buildContactRow(
                  icon: Icons.email,
                  iconColor: Colors.blue,
                  title: localizations.email,
                  value: company.email,
                  onCopy: () => _copyToClipboard(context, company.email, 'Email copié'),
                  onTap: () => _launchEmail(context, company.email),
                ),
              
              if (company.email.isNotEmpty) const SizedBox(height: 16),
              
              // Phone
              if (company.phone.isNotEmpty)
                _buildContactRow(
                  icon: Icons.phone,
                  iconColor: Colors.green,
                  title: localizations.phone,
                  value: company.phone,
                  onCopy: () => _copyToClipboard(context, company.phone, 'Numéro copié'),
                  onTap: () => _launchPhoneCall(context, company.phone),
                ),
              
              if (company.phone.isNotEmpty) const SizedBox(height: 16),
              
              // Address
              if (company.address.isNotEmpty)
                _buildContactRow(
                  icon: Icons.location_on,
                  iconColor: Colors.orange,
                  title: localizations.address,
                  value: company.address,
                  onCopy: () => _copyToClipboard(context, company.address, 'Adresse copiée'),
                ),
              
              // If no contact info is available
              if (company.email.isEmpty && company.phone.isEmpty && company.address.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    localizations.noContactInfoAvailable,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizations.close),
          ),
        ],
      ),
    );
  }

  // Widget for a contact row
  Widget _buildContactRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required VoidCallback onCopy,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: onTap != null 
                          ? TextDecoration.underline 
                          : TextDecoration.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.content_copy, size: 18),
                  onPressed: onCopy,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Function to copy to clipboard
  void _copyToClipboard(BuildContext context, String text, String message) {
    if (text.isEmpty) return;
    
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Function to launch email (simulated)
  void _launchEmail(BuildContext context, String email) {
    if (email.isEmpty) return;
    
    // In a real app, you would use:
    // final Uri emailLaunchUri = Uri(
    //   scheme: 'mailto',
    //   path: email,
    // );
    // launchUrl(emailLaunchUri);
    
    // For now, show a message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ouverture de l\'email: $email'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Function to launch phone call (simulated)
  void _launchPhoneCall(BuildContext context, String phone) {
    if (phone.isEmpty) return;
    
    // In a real app, you would use:
    // final Uri phoneLaunchUri = Uri(
    //   scheme: 'tel',
    //   path: phone,
    // );
    // launchUrl(phoneLaunchUri);
    
    // For now, show a message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Appel du numéro: $phone'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}