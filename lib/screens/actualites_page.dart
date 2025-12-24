import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';
import 'package:intl/intl.dart';

class ActualitesPage extends StatefulWidget {
  final Investor investor;

  const ActualitesPage({super.key, required this.investor});

  @override
  State<ActualitesPage> createState() => _ActualitesPageState();
}

class _ActualitesPageState extends State<ActualitesPage> {
  String _selectedCategory = 'Toutes';
  final List<String> _categories = [
    'Toutes',
    'Marchés',
    'Entreprises',
    'Économie',
    'Technologie',
    'Finance',
    'Énergie',
    'Santé'
  ];

  final List<NewsArticle> _articles = [
    NewsArticle(
      title: 'Le CAC 40 franchit la barre des 7 500 points',
      summary: 'L\'indice phare de la Bourse de Paris atteint un nouveau record historique',
      content: '''
Le CAC 40 a clôturé aujourd'hui à 7 512 points, en hausse de 1,2%, porté par les valeurs technologiques et du luxe. Cette performance s'explique par les résultats trimestriels meilleurs que prévu et l'optimisme des investisseurs concernant la politique monétaire de la BCE.

Les secteurs les plus performants:
- Technologie: +2.8%
- Luxe: +1.9%
- Banque: +1.5%

Les analystes prévoient une poursuite de la tendance haussière dans les prochaines semaines, avec un objectif à 7 800 points d'ici la fin du trimestre.
''',
      category: 'Marchés',
      source: 'Les Échos',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      author: 'Marie Dubois',
      tags: ['CAC 40', 'Bourse', 'France'],
      isBreaking: true,
      readTime: '3 min',
      imageUrl: '📈',
    ),
    NewsArticle(
      title: 'LVMH annonce une croissance record au 4ème trimestre',
      summary: 'Le géant du luxe enregistre une hausse de 18% de son chiffre d\'affaires',
      content: '''
LVMH a publié ce matin ses résultats pour le quatrième trimestre 2023, dépassant toutes les attentes des analystes. Le groupe a enregistré une croissance de 18% de son chiffre d\'affaires, atteignant 23,5 milliards d\'euros.

Points clés:
- Croissance en Asie: +24%
- Profitabilité améliorée: marge opérationnelle à 28%
- Division Mode & Maroquinerie: +22%
- Parfums & Cosmétiques: +15%

Bernard Arnault, PDG de LVMH, a déclaré: "Ces résultats exceptionnels reflètent la force de notre modèle et la qualité de nos équipes."
''',
      category: 'Entreprises',
      source: 'Le Figaro',
      date: DateTime.now().subtract(const Duration(hours: 5)),
      author: 'Jean Martin',
      tags: ['LVMH', 'Luxe', 'Résultats'],
      isBreaking: false,
      readTime: '4 min',
      imageUrl: '👜',
    ),
    NewsArticle(
      title: 'La BCE maintient ses taux directeurs',
      summary: 'Christine Lagarde confirme une politique monétaire restrictive',
      content: '''
Lors de sa conférence de presse, la Présidente de la BCE a annoncé le maintien des taux directeurs à 4,5%. Cette décision était largement anticipée par les marchés financiers.

Implications:
- Taux de refinancement maintenu à 4,5%
- Pas de baisse avant le deuxième semestre 2024
- Inflation attendue à 2,1% fin 2024
- Croissance européenne révisée à la baisse

Christine Lagarde a souligné: "Nous restons déterminés à ramener l'inflation à notre objectif de 2%, tout en surveillant la croissance économique."
''',
      category: 'Économie',
      source: 'Financial Times',
      date: DateTime.now().subtract(const Duration(hours: 8)),
      author: 'Robert Schmidt',
      tags: ['BCE', 'Taux', 'Économie'],
      isBreaking: true,
      readTime: '5 min',
      imageUrl: '🏛️',
    ),
    NewsArticle(
      title: 'Airbus signe un méga-contrat avec Emirates',
      summary: 'Commande de 50 A350 pour 15 milliards de dollars',
      content: '''
Airbus a annoncé aujourd'hui la signature d'un contrat historique avec la compagnie aérienne Emirates pour la livraison de 50 A350-1000. Cette commande représente une valeur catalogue de 15 milliards de dollars.

Détails du contrat:
- 50 A350-1000
- Livraisons échelonnées sur 2025-2028
- Option pour 20 appareils supplémentaires
- Création de 2 000 emplois en France

Guillaume Faury, CEO d'Airbus, a déclaré: "Cette commande renforce notre partenariat historique avec Emirates et témoigne de la confiance dans nos produits."
''',
      category: 'Entreprises',
      source: 'La Tribune',
      date: DateTime.now().subtract(const Duration(days: 1)),
      author: 'Sophie Leroy',
      tags: ['Airbus', 'Aéronautique', 'Contrat'],
      isBreaking: false,
      readTime: '3 min',
      imageUrl: '✈️',
    ),
    NewsArticle(
      title: 'Sanofi lance un nouveau traitement contre le diabète',
      summary: 'L\'autorisation de mise sur le marché a été obtenue aux États-Unis',
      content: '''
Sanofi a obtenu l'autorisation de la FDA pour commercialiser son nouveau traitement innovant contre le diabète de type 2. Ce médicament pourrait révolutionner la prise en charge de la maladie.

Caractéristiques:
- Réduction de 30% du risque cardiovasculaire
- Efficacité démontrée dans les essais cliniques
- Lancement prévu en Europe début 2024
- Potentiel de vente estimé à 5 milliards d'euros

Paul Hudson, CEO de Sanofi, a déclaré: "Cette autorisation marque une étape importante dans notre combat contre le diabète et renforce notre pipeline de produits innovants."
''',
      category: 'Santé',
      source: 'Le Monde',
      date: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
      author: 'Dr. Laurent Petit',
      tags: ['Sanofi', 'Santé', 'Diabète'],
      isBreaking: false,
      readTime: '4 min',
      imageUrl: '💊',
    ),
    NewsArticle(
      title: 'La cryptomonnaie enregistre une forte volatilité',
      summary: 'Bitcoin chute de 8% après l\'annonce de nouvelles régulations',
      content: """
Le marché des cryptomonnaies connaît une forte volatilité cette semaine suite à l'annonce de nouvelles régulations par les autorités américaines. Bitcoin a perdu 8% en 24 heures.

Analyse:
- Bitcoin: 38 500\$ (-8%)
- Ethereum: 2 150\$ (-6%)
- Nouveaux standards de conformité annoncés
- Impact sur les plateformes d'échange

Les experts recommandent la prudence et soulignent l'importance de la diversification dans ce contexte réglementaire incertain.
""",
      category: 'Finance',
      source: 'Bloomberg',
      date: DateTime.now().subtract(const Duration(days: 2)),
      author: 'Michael Chen',
      tags: ['Crypto', 'Bitcoin', 'Régulation'],
      isBreaking: false,
      readTime: '3 min',
      imageUrl: '₿',
    ),
    NewsArticle(
      title: 'TotalEnergies accélère sa transition énergétique',
      summary: 'Investissement de 10 milliards dans les énergies renouvelables',
      content: '''
TotalEnergies a dévoilé son nouveau plan stratégique avec un investissement massif de 10 milliards d'euros dans les énergies renouvelables d'ici 2025. Le groupe vise à devenir un leader de la transition énergétique.

Objectifs:
- Capacité renouvelable portée à 100 GW
- Réduction de 30% des émissions d'ici 2030
- Développement de l'hydrogène vert
- Projets solaires et éoliens en Europe et Afrique

Patrick Pouyanné a affirmé: "Nous transformons TotalEnergies en une entreprise multi-énergies pour répondre aux défis climatiques."
''',
      category: 'Énergie',
      source: 'Reuters',
      date: DateTime.now().subtract(const Duration(days: 2, hours: 6)),
      author: 'Sarah Johnson',
      tags: ['TotalEnergies', 'Énergie', 'Renouvelable'],
      isBreaking: false,
      readTime: '4 min',
      imageUrl: '⛽',
    ),
    NewsArticle(
      title: 'Capgemini rachète une startup d\'IA pour 500M€',
      summary: 'Acquisition stratégique dans l\'intelligence artificielle',
      content: '''
Capgemini a annoncé l'acquisition de NeuralTech, une startup française spécialisée en intelligence artificielle, pour 500 millions d'euros. Cette acquisition renforce l'expertise du groupe en IA.

Bénéfices attendus:
- Renforcement des capacités en machine learning
- Intégration de 150 experts en IA
- Accélération des projets de transformation digitale
- Positionnement sur le marché en forte croissance

Aiman Ezzat, CEO de Capgemini, a déclaré: "Cette acquisition stratégique nous positionne comme leader de l'IA en Europe."
''',
      category: 'Technologie',
      source: 'TechCrunch',
      date: DateTime.now().subtract(const Duration(days: 3)),
      author: 'Alexandre Dubois',
      tags: ['Capgemini', 'IA', 'Acquisition'],
      isBreaking: false,
      readTime: '3 min',
      imageUrl: '💻',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredArticles = _selectedCategory == 'Toutes'
        ? _articles
        : _articles.where((article) => article.category == _selectedCategory).toList();

    final breakingNews = _articles.where((article) => article.isBreaking).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualités Financières'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF7533E8)),
            onPressed: _showSearch,
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF7533E8)),
            onPressed: _showFilters,
          ),
        ],
      ),
      body: Column(
        children: [
          // Breaking News
          if (breakingNews.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.red.withOpacity(0.1),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'BREAKING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MarqueeText(
                      text: breakingNews.map((e) => e.title).join(' • '),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Catégories
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = selected ? category : 'Toutes';
                        });
                      },
                      selectedColor: const Color(0xFF7533E8),
                      checkmarkColor: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Liste des articles
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredArticles.length,
              itemBuilder: (context, index) {
                return _buildArticleCard(filteredArticles[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(NewsArticle article) {
    final timeAgo = _getTimeAgo(article.date);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          borderRadius: BorderRadius.circular(12),
          onTap: () => _showArticleDetail(article),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // En-tête
                Row(
                  children: [
                    if (article.isBreaking)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'BREAKING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(article.category).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        article.category,
                        style: TextStyle(
                          color: _getCategoryColor(article.category),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Image/Titre
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          article.imageUrl,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            article.summary,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Source et tags
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          article.source,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          article.readTime,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: article.tags.take(2).map((tag) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Chip(
                            label: Text(tag),
                            backgroundColor: Colors.grey[100],
                            labelStyle: const TextStyle(fontSize: 10),
                            padding: EdgeInsets.zero,
                          ),
                        );
                      }).toList(),
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

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Marchés':
        return Colors.blue;
      case 'Entreprises':
        return Colors.green;
      case 'Économie':
        return Colors.purple;
      case 'Technologie':
        return Colors.orange;
      case 'Finance':
        return Colors.red;
      case 'Énergie':
        return Colors.amber;
      case 'Santé':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  String _getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays} j';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  void _showSearch() {
    showSearch(
      context: context,
      delegate: _NewsSearchDelegate(_articles),
    );
  }

  void _showFilters() {
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildFilterOption('Articles récents uniquement', true),
              _buildFilterOption('Uniquement Breaking News', false),
              _buildFilterOption('Avec images', true),
              _buildFilterOption('Par sources vérifiées', true),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Appliquer les filtres'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String label, bool value) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SwitchListTile(
          title: Text(label),
          value: value,
          onChanged: (newValue) {
            setState(() {});
          },
        );
      },
    );
  }

  void _showArticleDetail(NewsArticle article) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // En-tête
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (article.isBreaking)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'BREAKING',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getCategoryColor(article.category).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                article.category,
                                style: TextStyle(
                                  color: _getCategoryColor(article.category),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share, color: Color(0xFF7533E8)),
                    onPressed: () => _shareArticle(article),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Métadonnées
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[200],
                    child: Text(
                      article.author.substring(0, 1),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${article.source} • ${_getTimeAgo(article.date)} • ${article.readTime} de lecture',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: Color(0xFF7533E8)),
                    onPressed: () => _saveArticle(article),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Image
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    article.imageUrl,
                    style: const TextStyle(fontSize: 64),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Contenu
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Résumé',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article.summary,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Article complet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article.content,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Tags
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: article.tags.map((tag) {
                          return Chip(
                            label: Text(tag),
                            backgroundColor: Colors.grey[100],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _openSource(article),
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Lire sur le site'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF7533E8),
                        side: const BorderSide(color: Color(0xFF7533E8)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, size: 18),
                      label: const Text('Fermer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7533E8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _shareArticle(NewsArticle article) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Article "${article.title}" partagé'),
        backgroundColor: const Color(0xFF3498DB),
      ),
    );
  }

  void _saveArticle(NewsArticle article) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Article "${article.title}" sauvegardé'),
        backgroundColor: const Color(0xFF2ECC71),
      ),
    );
  }

  void _openSource(NewsArticle article) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ouverture de l\'article sur ${article.source}'),
        backgroundColor: const Color(0xFF7533E8),
      ),
    );
  }
}

// Modèle pour les articles de nouvelles
class NewsArticle {
  final String title;
  final String summary;
  final String content;
  final String category;
  final String source;
  final DateTime date;
  final String author;
  final List<String> tags;
  final bool isBreaking;
  final String readTime;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.source,
    required this.date,
    required this.author,
    required this.tags,
    required this.isBreaking,
    required this.readTime,
    required this.imageUrl,
  });
}

// Widget pour le texte défilant
class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const MarqueeText({
    super.key,
    required this.text,
    this.style = const TextStyle(),
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.text.length ~/ 3),
      vsync: this,
    )..repeat();
    
    _animation = Tween<double>(
      begin: 1.0,
      end: -1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value * MediaQuery.of(context).size.width, 0),
          child: Text(
            widget.text,
            style: widget.style,
            overflow: TextOverflow.visible,
            softWrap: false,
          ),
        );
      },
    );
  }
}

// Delegate pour la recherche
class _NewsSearchDelegate extends SearchDelegate<String> {
  final List<NewsArticle> articles;

  _NewsSearchDelegate(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = articles.where((article) =>
        article.title.toLowerCase().contains(query.toLowerCase()) ||
        article.content.toLowerCase().contains(query.toLowerCase()) ||
        article.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase())));

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results.elementAt(index);
        return ListTile(
          leading: CircleAvatar(
            child: Text(article.imageUrl),
          ),
          title: Text(article.title),
          subtitle: Text('${article.source} • ${article.category}'),
          onTap: () {
            close(context, article.title);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = articles.where((article) =>
        article.title.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final article = suggestions.elementAt(index);
        return ListTile(
          leading: CircleAvatar(
            child: Text(article.imageUrl),
          ),
          title: Text(article.title),
          subtitle: Text('${article.source} • ${article.category}'),
          onTap: () {
            query = article.title;
            showResults(context);
          },
        );
      },
    );
  }
}