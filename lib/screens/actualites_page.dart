import 'package:flutter/material.dart';
import '../widgets/models.dart';
import '../l10n/app_localizations.dart';

class ActualitesPage extends StatefulWidget {
  final Investor investor;

  const ActualitesPage({super.key, required this.investor});

  @override
  State<ActualitesPage> createState() => _ActualitesPageState();
}

class _ActualitesPageState extends State<ActualitesPage> {
  List<Actualite> _actualites = [];
  String _selectedCategory = '';
  bool _isLoading = true;
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadActualites(AppLocalizations localizations) async {
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _actualites = [
        Actualite(
          titre: localizations.news1Title,
          contenu: localizations.news1Content,
          date: DateTime.now().subtract(const Duration(hours: 2)),
          categorie: localizations.finance,
          source: localizations.newsSource1,
          imageUrl: 'https://via.placeholder.com/400x200?text=ALPAY+Funding',
          estImportante: true,
          tags: [localizations.fintech, localizations.fundraising, localizations.algeria],
          likes: 245,
          commentaires: 42,
          partages: 89,
        ),
        Actualite(
          titre: localizations.news2Title,
          contenu: localizations.news2Content,
          date: DateTime.now().subtract(const Duration(days: 1)),
          categorie: localizations.startups,
          source: localizations.newsSource2,
          imageUrl: 'https://via.placeholder.com/400x200?text=TalabaStore+Growth',
          estImportante: true,
          tags: [localizations.ecommerce, localizations.students, localizations.growth],
          likes: 189,
          commentaires: 31,
          partages: 67,
        ),
        Actualite(
          titre: localizations.news3Title,
          contenu: localizations.news3Content,
          date: DateTime.now().subtract(const Duration(days: 2)),
          categorie: localizations.market,
          source: localizations.newsSource3,
          imageUrl: 'https://via.placeholder.com/400x200?text=Startup+Market',
          estImportante: false,
          tags: [localizations.economy, localizations.startups, 'Investment'], // CORRIGÉ
          likes: 156,
          commentaires: 28,
          partages: 45,
        ),
        Actualite(
          titre: localizations.news4Title,
          contenu: localizations.news4Content,
          date: DateTime.now().subtract(const Duration(days: 3)),
          categorie: localizations.technology,
          source: localizations.newsSource4,
          imageUrl: 'https://via.placeholder.com/400x200?text=TemTem+Expansion',
          estImportante: false,
          tags: [localizations.mobility, localizations.delivery, localizations.expansion],
          likes: 132,
          commentaires: 24,
          partages: 38,
        ),
        Actualite(
          titre: localizations.news5Title,
          contenu: localizations.news5Content,
          date: DateTime.now().subtract(const Duration(days: 4)),
          categorie: localizations.finance,
          source: localizations.newsSource5,
          imageUrl: 'https://via.placeholder.com/400x200?text=Fintech+Regulation',
          estImportante: true,
          tags: [localizations.regulation, localizations.fintech, localizations.bank],
          likes: 178,
          commentaires: 35,
          partages: 52,
        ),
        Actualite(
          titre: localizations.news6Title,
          contenu: localizations.news6Content,
          date: DateTime.now().subtract(const Duration(days: 5)),
          categorie: localizations.startups,
          source: localizations.newsSource6,
          imageUrl: 'https://via.placeholder.com/400x200?text=Okadoo+Partnership',
          estImportante: false,
          tags: [localizations.b2b, localizations.partnership, localizations.suppliers],
          likes: 98,
          commentaires: 19,
          partages: 31,
        ),
        Actualite(
          titre: localizations.news7Title,
          contenu: localizations.news7Content,
          date: DateTime.now().subtract(const Duration(days: 6)),
          categorie: 'Investment', // CORRIGÉ
          source: localizations.newsSource7,
          imageUrl: 'https://via.placeholder.com/400x200?text=Tech+Investment',
          estImportante: true,
          tags: ['Investment', localizations.tech, localizations.growth], // CORRIGÉ
          likes: 210,
          commentaires: 47,
          partages: 73,
        ),
        Actualite(
          titre: localizations.news8Title,
          contenu: localizations.news8Content,
          date: DateTime.now().subtract(const Duration(days: 7)),
          categorie: localizations.technology,
          source: localizations.newsSource8,
          imageUrl: 'https://via.placeholder.com/400x200?text=Mobile+Payments',
          estImportante: false,
          tags: [localizations.mobile, localizations.payments, localizations.digital],
          likes: 145,
          commentaires: 26,
          partages: 42,
        ),
      ];
      _isLoading = false;
    });
  }

  List<Actualite> get _filteredActualites {
    if (_selectedCategory == '' || _selectedCategory == AppLocalizations.of(context)!.all) {
      return _actualites;
    }
    return _actualites.where((actu) => actu.categorie == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    if (_categories.isEmpty) {
      _categories = [
        localizations.all,
        localizations.finance,
        localizations.technology,
        localizations.startups,
        localizations.market,
        localizations.economy,
        'Investment' // CORRIGÉ
      ];
    }
    
    if (_selectedCategory.isEmpty) {
      _selectedCategory = localizations.all;
    }
    
    if (_isLoading && _actualites.isEmpty) {
      _loadActualites(localizations);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.news,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              localizations.stayInformed,
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
            onPressed: () => _showFilterOptions(localizations),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadActualites(localizations);
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

                _buildStatsBar(localizations),
                const SizedBox(height: 16),

                Expanded(
                  child: _filteredActualites.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.newspaper,
                                size: 64,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                localizations.noNewsAvailable,
                                style: const TextStyle(
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
                            return _buildActualiteCard(_filteredActualites[index], localizations);
                          },
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatsBar(AppLocalizations localizations) {
    final importantes = _actualites.where((a) => a.estImportante).length;
    final aujourdhui = _actualites
        .where((a) => a.date.isAfter(DateTime.now().subtract(const Duration(days: 1))))
        .length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(localizations.total, '${_actualites.length}'),
          _buildStatItem(localizations.today, '$aujourdhui'),
          _buildStatItem(localizations.important, '$importantes'),
          _buildStatItem(localizations.categories, '${_categories.length - 1}'),
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

  Widget _buildActualiteCard(Actualite actualite, AppLocalizations localizations) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    child: Text(
                      localizations.important.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      _formatDate(actualite.date, localizations),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

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

                Row(
                  children: [
                    const Icon(
                      Icons.source,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${localizations.source}: ${actualite.source}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInteractionButton(
                      icon: Icons.thumb_up_outlined,
                      count: actualite.likes,
                      onPressed: () => _likeActualite(actualite, localizations),
                      label: localizations.likes,
                    ),

                    _buildInteractionButton(
                      icon: Icons.comment_outlined,
                      count: actualite.commentaires,
                      onPressed: () => _showComments(actualite, localizations),
                      label: localizations.comments,
                    ),

                    _buildInteractionButton(
                      icon: Icons.share_outlined,
                      count: actualite.partages,
                      onPressed: () => _shareActualite(actualite, localizations),
                      label: localizations.shares,
                    ),

                    IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () => _saveActualite(actualite, localizations),
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
    required String label,
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

  String _formatDate(DateTime date, AppLocalizations localizations) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${localizations.ago} ${difference.inMinutes} ${difference.inMinutes == 1 ? localizations.minute : localizations.minutes}';
      }
      return '${localizations.ago} ${difference.inHours} ${difference.inHours == 1 ? localizations.hour : localizations.hours}';
    } else if (difference.inDays == 1) {
      return localizations.yesterday;
    } else if (difference.inDays < 7) {
      return '${localizations.ago} ${difference.inDays} ${difference.inDays == 1 ? localizations.day : localizations.days}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  String _formatCount(int count) {
    if (count < 1000) return count.toString();
    if (count < 1000000) return '${(count / 1000).toStringAsFixed(1)}k';
    return '${(count / 1000000).toStringAsFixed(1)}M';
  }

  void _showFilterOptions(AppLocalizations localizations) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations.filterNews,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: Text(localizations.importantNews),
                value: true,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text(localizations.last24Hours),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text(localizations.followedCategories),
                value: true,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text(localizations.withImages),
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(localizations.cancel),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localizations.filtersApplied),
                          backgroundColor: const Color(0xFF7533E8),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7533E8),
                    ),
                    child: Text(localizations.apply),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _likeActualite(Actualite actualite, AppLocalizations localizations) {
    setState(() {
      actualite.likes++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(localizations.newsLiked),
        backgroundColor: const Color(0xFF7533E8),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showComments(Actualite actualite, AppLocalizations localizations) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${localizations.comments} - ${actualite.titre}'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: localizations.addComment,
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(3, (index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(localizations.investorUser),
                      subtitle: Text(localizations.commentExample),
                    );
                  }),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.close),
            ),
          ],
        );
      },
    );
  }

  void _shareActualite(Actualite actualite, AppLocalizations localizations) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${localizations.share} "${actualite.titre}"'),
        backgroundColor: const Color(0xFF3498DB),
        action: SnackBarAction(
          label: localizations.copy,
          onPressed: () {},
        ),
      ),
    );
  }

  void _saveActualite(Actualite actualite, AppLocalizations localizations) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${actualite.titre}" ${localizations.saved.toLowerCase()}'),
        backgroundColor: const Color(0xFF2ECC71),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

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