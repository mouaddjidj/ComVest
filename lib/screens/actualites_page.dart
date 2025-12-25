import 'package:flutter/material.dart';
import '../widgets/models.dart';

class ActualitesPage extends StatefulWidget {
  final Investor investor;

  const ActualitesPage({super.key, required this.investor});

  @override
  State<ActualitesPage> createState() => _ActualitesPageState();
}

class _ActualitesPageState extends State<ActualitesPage> {
  List<Actualite> _actualites = [];
  String _selectedCategory = 'Tous';
  bool _isLoading = true;

  final List<String> _categories = [
    'Tous',
    'Finance',
    'Technologie',
    'Startups',
    'Marché',
    'Économie',
    'Investissement'
  ];

  @override
  void initState() {
    super.initState();
    _loadActualites();
  }

  Future<void> _loadActualites() async {
    // Simuler un chargement
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _actualites = [
        Actualite(
          titre: 'ALPAY annonce une levée de fonds record de 5 millions d\'euros',
          contenu: 'La fintech algérienne ALPAY a annoncé aujourd\'hui avoir levé 5 millions d\'euros auprès d\'investisseurs internationaux. Ces fonds seront utilisés pour accélérer son expansion régionale et développer de nouvelles fonctionnalités de paiement.',
          date: DateTime.now().subtract(const Duration(hours: 2)),
          categorie: 'Finance',
          source: 'Tech Algeria',
          imageUrl: 'https://via.placeholder.com/400x200?text=ALPAY+Funding',
          estImportante: true,
          tags: ['Fintech', 'Levée de fonds', 'Algérie'],
          likes: 245,
          commentaires: 42,
          partages: 89,
        ),
        Actualite(
          titre: 'TalabaStore dépasse les 100 000 utilisateurs actifs',
          contenu: 'La plateforme e-commerce TalabaStore a franchi le cap des 100 000 utilisateurs actifs. Cette croissance rapide démontre l\'adoption massive de la plateforme par la communauté étudiante algérienne.',
          date: DateTime.now().subtract(const Duration(days: 1)),
          categorie: 'Startups',
          source: 'Startup Mag',
          imageUrl: 'https://via.placeholder.com/400x200?text=TalabaStore+Growth',
          estImportante: true,
          tags: ['E-commerce', 'Étudiants', 'Croissance'],
          likes: 189,
          commentaires: 31,
          partages: 67,
        ),
        Actualite(
          titre: 'Le marché des startups algériennes en forte croissance en 2024',
          contenu: 'Selon un récent rapport, le secteur des startups en Algérie a connu une croissance de 35% en 2024. Les fintechs et les plateformes e-commerce représentent 60% des investissements totaux.',
          date: DateTime.now().subtract(const Duration(days: 2)),
          categorie: 'Marché',
          source: 'Algerian Business Review',
          imageUrl: 'https://via.placeholder.com/400x200?text=Startup+Market',
          estImportante: false,
          tags: ['Économie', 'Startups', 'Investissement'],
          likes: 156,
          commentaires: 28,
          partages: 45,
        ),
        Actualite(
          titre: 'TemTem lance son service de livraison express dans 3 nouvelles villes',
          contenu: 'L\'application de mobilité TemTem a étendu son service de livraison express aux villes d\'Oran, Constantine et Annaba. Le service promet une livraison en moins de 60 minutes.',
          date: DateTime.now().subtract(const Duration(days: 3)),
          categorie: 'Technologie',
          source: 'Digital News',
          imageUrl: 'https://via.placeholder.com/400x200?text=TemTem+Expansion',
          estImportante: false,
          tags: ['Mobilité', 'Livraison', 'Expansion'],
          likes: 132,
          commentaires: 24,
          partages: 38,
        ),
        Actualite(
          titre: 'Nouvelle réglementation pour les fintechs en Algérie',
          contenu: 'La Banque d\'Algérie a annoncé de nouvelles réglementations pour encadrer le développement des fintechs. Ces mesures visent à protéger les consommateurs tout en favorisant l\'innovation.',
          date: DateTime.now().subtract(const Duration(days: 4)),
          categorie: 'Finance',
          source: 'Financial Times Algeria',
          imageUrl: 'https://via.placeholder.com/400x200?text=Fintech+Regulation',
          estImportante: true,
          tags: ['Régulation', 'Fintech', 'Banque'],
          likes: 178,
          commentaires: 35,
          partages: 52,
        ),
        Actualite(
          titre: 'Okadoo signe un partenariat stratégique avec 50 fournisseurs',
          contenu: 'La marketplace B2B Okadoo a annoncé un partenariat avec 50 nouveaux fournisseurs industriels, élargissant ainsi son catalogue de produits pour les entreprises algériennes.',
          date: DateTime.now().subtract(const Duration(days: 5)),
          categorie: 'Startups',
          source: 'Business Partners',
          imageUrl: 'https://via.placeholder.com/400x200?text=Okadoo+Partnership',
          estImportante: false,
          tags: ['B2B', 'Partnership', 'Fournisseurs'],
          likes: 98,
          commentaires: 19,
          partages: 31,
        ),
        Actualite(
          titre: 'Investissement record dans le secteur tech algérien',
          contenu: 'Les investissements dans le secteur technologique algérien ont atteint 25 millions d\'euros au premier semestre 2024, soit une augmentation de 45% par rapport à l\'année dernière.',
          date: DateTime.now().subtract(const Duration(days: 6)),
          categorie: 'Investissement',
          source: 'Venture Capital Mag',
          imageUrl: 'https://via.placeholder.com/400x200?text=Tech+Investment',
          estImportante: true,
          tags: ['Investissement', 'Tech', 'Croissance'],
          likes: 210,
          commentaires: 47,
          partages: 73,
        ),
        Actualite(
          titre: 'Les paiements mobiles explosent en Algérie',
          contenu: 'Le volume des transactions par mobile payment a augmenté de 120% en 2024, avec des acteurs comme ALPAY en tête de ce mouvement.',
          date: DateTime.now().subtract(const Duration(days: 7)),
          categorie: 'Technologie',
          source: 'Mobile Trends',
          imageUrl: 'https://via.placeholder.com/400x200?text=Mobile+Payments',
          estImportante: false,
          tags: ['Mobile', 'Paiements', 'Digital'],
          likes: 145,
          commentaires: 26,
          partages: 42,
        ),
      ];
      _isLoading = false;
    });
  }

  List<Actualite> get _filteredActualites {
    if (_selectedCategory == 'Tous') {
      return _actualites;
    }
    return _actualites.where((actu) => actu.categorie == _selectedCategory).toList();
  }

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
            const Text(
              'Actualités',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Restez informé sur l\'écosystème startup',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: _showFilterOptions,
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadActualites();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7533E8)),
              ),
            )
          : Column(
              children: [
                // Catégories
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = _selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                          selectedColor: const Color(0xFF7533E8),
                          checkmarkColor: Colors.white,
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Statistiques rapides
                _buildStatsBar(),
                const SizedBox(height: 16),

                // Liste des actualités
                Expanded(
                  child: _filteredActualites.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.newspaper,
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Aucune actualité disponible',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _filteredActualites.length,
                          itemBuilder: (context, index) {
                            return _buildActualiteCard(_filteredActualites[index]);
                          },
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatsBar() {
    final importantes = _actualites.where((a) => a.estImportante).length;
    final aujourdhui = _actualites
        .where((a) => a.date.isAfter(DateTime.now().subtract(const Duration(days: 1))))
        .length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Total', '${_actualites.length}'),
          _buildStatItem('Aujourd\'hui', '$aujourdhui'),
          _buildStatItem('Importantes', '$importantes'),
          _buildStatItem('Catégories', '${_categories.length - 1}'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7533E8),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildActualiteCard(Actualite actualite) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image et badge important
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: const Color(0xFF7533E8).withOpacity(0.1),
                  child: Icon(
                    Icons.newspaper,
                    size: 64,
                    color: const Color(0xFF7533E8).withOpacity(0.3),
                  ),
                ),
              ),
              if (actualite.estImportante)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'IMPORTANT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Contenu
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Catégorie et date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7533E8).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        actualite.categorie,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7533E8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      _formatDate(actualite.date),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Titre
                Text(
                  actualite.titre,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Contenu
                Text(
                  actualite.contenu,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Source
                Row(
                  children: [
                    const Icon(
                      Icons.source,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Source: ${actualite.source}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: actualite.tags.map((tag) {
                    return Chip(
                      label: Text(
                        tag,
                        style: const TextStyle(fontSize: 11),
                      ),
                      backgroundColor: Colors.grey[100],
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Interactions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Likes
                    _buildInteractionButton(
                      icon: Icons.thumb_up_outlined,
                      count: actualite.likes,
                      onPressed: () => _likeActualite(actualite),
                    ),

                    // Commentaires
                    _buildInteractionButton(
                      icon: Icons.comment_outlined,
                      count: actualite.commentaires,
                      onPressed: () => _showComments(actualite),
                    ),

                    // Partages
                    _buildInteractionButton(
                      icon: Icons.share_outlined,
                      count: actualite.partages,
                      onPressed: () => _shareActualite(actualite),
                    ),

                    // Sauvegarder
                    IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () => _saveActualite(actualite),
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton({
    required IconData icon,
    required int count,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(
        _formatCount(count),
        style: const TextStyle(fontSize: 12),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey[600],
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return 'Il y a ${difference.inMinutes} min';
      }
      return 'Il y a ${difference.inHours} h';
    } else if (difference.inDays == 1) {
      return 'Hier';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays} jours';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  String _formatCount(int count) {
    if (count < 1000) return count.toString();
    if (count < 1000000) return '${(count / 1000).toStringAsFixed(1)}k';
    return '${(count / 1000000).toStringAsFixed(1)}M';
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filtrer les actualités',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Actualités importantes'),
                value: true,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: const Text('Dernières 24h'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: const Text('Catégories suivies'),
                value: true,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: const Text('Avec images'),
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
              ),
            ],
          ),
        );
      },
    );
  }

  void _likeActualite(Actualite actualite) {
    setState(() {
      actualite.likes++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Actualité likée!'),
        backgroundColor: Color(0xFF7533E8),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _showComments(Actualite actualite) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Commentaires - ${actualite.titre}'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Ajouter un commentaire...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(3, (index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text('Utilisateur Investisseur'),
                      subtitle: Text('Excellent article! Merci pour ces informations précieuses.'),
                    );
                  }),
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

  void _shareActualite(Actualite actualite) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Partager "${actualite.titre}"'),
        backgroundColor: const Color(0xFF3498DB),
        action: SnackBarAction(
          label: 'Copier',
          onPressed: () {
            // Copier le lien
          },
        ),
      ),
    );
  }

  void _saveActualite(Actualite actualite) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${actualite.titre}" sauvegardé'),
        backgroundColor: const Color(0xFF2ECC71),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Modèle Actualite
class Actualite {
  final String titre;
  final String contenu;
  final DateTime date;
  final String categorie;
  final String source;
  final String imageUrl;
  final bool estImportante;
  final List<String> tags;
  int likes;
  int commentaires;
  int partages;

  Actualite({
    required this.titre,
    required this.contenu,
    required this.date,
    required this.categorie,
    required this.source,
    required this.imageUrl,
    required this.estImportante,
    required this.tags,
    required this.likes,
    required this.commentaires,
    required this.partages,
  });
}