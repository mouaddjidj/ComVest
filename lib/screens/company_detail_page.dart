import 'package:comvest/widgets/models.dart';
import 'package:flutter/material.dart';

class CompanyDetailPage extends StatelessWidget {
  final Company company;
  final bool isFollowed;
  final VoidCallback onFollowToggle;

  // Map pour les tailles d'images spécifiques aux entreprises
  final Map<String, Size> companyImageSizes = {
    'TalabaStore': const Size(100, 100),    // Plus grande
    'TemTem': const Size(90, 90),          // Légèrement plus grande
    'ALPAY': const Size(80, 80),          // Taille standard
    'Okadoo': const Size(70, 70),         // Plus petite
  };

   CompanyDetailPage({
    super.key,
    required this.company,
    required this.isFollowed,
    required this.onFollowToggle,
  });

  @override
  Widget build(BuildContext context) {
    // Obtenir la taille spécifique pour cette entreprise, ou utiliser la taille par défaut
    final Size imageSize = companyImageSizes[company.name] ?? const Size(80, 80);
    final double logoFontSize = _getLogoFontSizeForCompany(company.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        actions: [
          IconButton(
            icon: Icon(isFollowed ? Icons.star : Icons.star_border),
            onPressed: onFollowToggle,
            tooltip: isFollowed ? 'Ne plus suivre' : 'Suivre',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header avec logo et informations principales
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: company.cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  // Logo de l'entreprise avec taille personnalisée
                  Container(
                    width: imageSize.width,
                    height: imageSize.height,
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
                              fit: BoxFit.contain,
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
                        // Badge pour le type d'entreprise
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
              'Description',
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

            // Informations clés
            Text(
              'Informations clés',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),

            // Grille d'informations
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5,
              children: [
                // Type d'entreprise
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Type d\'entreprise',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Flexible(
                        child: Text(
                          company.type,
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
                ),
                _buildDetailItem('Secteur', company.sector),
                _buildCEOItem(),
                _buildDetailItem('Date de fondation', company.founded),
                _buildDetailItem('Localisation', company.location),
                _buildDetailItem('Nombre d\'employés', '${company.employees}'),
                _buildDetailItem('Valuation', '${company.valuation}B DA'),
                _buildDetailItem('Revenus annuels', '${company.revenue}B DA'),
              ],
            ),
            const SizedBox(height: 20),

            // Produits & Services
            Text(
              'Produits & Services',
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

            // Informations supplémentaires
            if (company.website.isNotEmpty ||
                company.mobileApps.isNotEmpty ||
                company.users.isNotEmpty ||
                company.coverage.isNotEmpty ||
                company.businessModel.isNotEmpty) ...[
              Text(
                'Informations supplémentaires',
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
                    _buildAdditionalInfo('Site web', company.website),
                  if (company.mobileApps.isNotEmpty)
                    _buildAdditionalInfo(
                        'Applications', company.mobileApps.join(', ')),
                  if (company.users.isNotEmpty)
                    _buildAdditionalInfo('Utilisateurs', company.users),
                  if (company.coverage.isNotEmpty)
                    _buildAdditionalInfo('Couverture', company.coverage),
                  if (company.businessModel.isNotEmpty)
                    _buildAdditionalInfo(
                        'Modèle économique', company.businessModel),
                ],
              ),
            ],
            const SizedBox(height: 30),

            // Boutons d'action
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Action pour contacter
                    },
                    icon: const Icon(Icons.email),
                    label: const Text('Contacter'),
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
                          label: const Text('Ne plus suivre'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFF1C40F)),
                            foregroundColor: const Color(0xFFF1C40F),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: onFollowToggle,
                          icon: const Icon(Icons.star_border),
                          label: const Text('Suivre'),
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
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
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

  Widget _buildCEOItem() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
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
            maxLines: 3, // Plus de lignes pour le CEO
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

  // Fonction pour obtenir la couleur du type
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

  // Fonction pour obtenir la taille de police du logo en fonction de l'entreprise
  double _getLogoFontSizeForCompany(String companyName) {
    switch (companyName) {
      case 'TalabaStore':
        return 40; // Plus grande police pour TalabaStore
      case 'TemTem':
        return 36; // Légèrement plus grande pour TemTem
      case 'ALPAY':
        return 30; // Taille standard
      case 'Okadoo':
        return 28; // Plus petite
      default:
        return 30; // Taille par défaut
    }
  }
}