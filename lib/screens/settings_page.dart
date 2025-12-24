// Dans la méthode _buildDrawer() de InvestorDashboard
import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';

class SettingsPage extends StatefulWidget {
  final Investor investor;
  
  const SettingsPage({super.key, required this.investor});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _emailAlerts = true;
  bool _pushNotifications = true;
  bool _darkMode = false;
  String _language = 'Français';
  
  final List<String> _languages = ['Français', 'Anglais', 'Espagnol', 'Allemand'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Paramètres',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info
            Container(
              width: double.infinity,
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
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF7533E8),
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.investor.firstName} ${widget.investor.lastName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.investor.email,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (widget.investor.investorType != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7533E8).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              widget.investor.investorType!,
                              style: const TextStyle(
                                color: Color(0xFF7533E8),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF7533E8)),
                    onPressed: _editProfile,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Account Settings
            const Text(
              'Compte',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
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
              child: Column(
                children: [
                  _buildSettingsTile(
                    Icons.person_outline,
                    'Informations personnelles',
                    _navigateToPersonalInfo,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.lock_outline,
                    'Sécurité du compte',
                    _navigateToSecurity,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.credit_card,
                    'Moyens de paiement',
                    _navigateToPaymentMethods,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.description_outlined,
                    'Documents légaux',
                    _navigateToLegalDocuments,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Notifications
            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
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
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Notifications activées'),
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                    activeColor: const Color(0xFF7533E8),
                  ),
                  const Divider(height: 0),
                  SwitchListTile(
                    title: const Text('Alertes par email'),
                    value: _emailAlerts,
                    onChanged: _notificationsEnabled ? (value) {
                      setState(() {
                        _emailAlerts = value;
                      });
                    } : null,
                    activeColor: const Color(0xFF7533E8),
                  ),
                  const Divider(height: 0),
                  SwitchListTile(
                    title: const Text('Notifications push'),
                    value: _pushNotifications,
                    onChanged: _notificationsEnabled ? (value) {
                      setState(() {
                        _pushNotifications = value;
                      });
                    } : null,
                    activeColor: const Color(0xFF7533E8),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Preferences
            const Text(
              'Préférences',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
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
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Mode sombre'),
                    value: _darkMode,
                    onChanged: (value) {
                      setState(() {
                        _darkMode = value;
                      });
                    },
                    activeColor: const Color(0xFF7533E8),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.language, color: Color(0xFF7533E8)),
                    title: const Text('Langue'),
                    trailing: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _language,
                        items: _languages.map((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(language),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _language = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.notifications_active_outlined,
                    'Fréquence des rapports',
                    _changeReportFrequency,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Investment Preferences
            const Text(
              'Préférences d\'investissement',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
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
              child: Column(
                children: [
                  _buildSettingsTile(
                    Icons.trending_up,
                    'Risque toléré',
                    _updateRiskTolerance,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.category,
                    'Secteurs préférés',
                    _updatePreferredSectors,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.attach_money,
                    'Montant d\'investissement',
                    _updateInvestmentAmount,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Support
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
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
              child: Column(
                children: [
                  _buildSettingsTile(
                    Icons.help_outline,
                    'Centre d\'aide',
                    _showHelpCenter,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.headset_mic,
                    'Contacter le support',
                    _contactSupport,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.description,
                    'Conditions d\'utilisation',
                    _showTerms,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.security,
                    'Politique de confidentialité',
                    _showPrivacyPolicy,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Danger Zone
            const Text(
              'Zone de danger',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            
            Container(
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
              child: Column(
                children: [
                  _buildSettingsTile(
                    Icons.delete_outline,
                    'Supprimer le compte',
                    _deleteAccount,
                    textColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.logout,
                    'Déconnexion',
                    _logout,
                    textColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color textColor = Colors.black87,
    Color iconColor = const Color(0xFF7533E8) ,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modifier le profil'),
          content: const Text('Cette fonctionnalité sera bientôt disponible'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToPersonalInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalInfoPage(investor: widget.investor),
      ),
    );
  }

  void _navigateToSecurity() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecurityPage(investor: widget.investor),
      ),
    );
  }

  void _navigateToPaymentMethods() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Moyens de paiement'),
          content: const Text('Gestion des moyens de paiement - Bientôt disponible'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToLegalDocuments() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Documents légaux'),
          content: const SingleChildScrollView(
            child: Column(
              children: [
                ListTile(title: Text('Contrat d\'investissement')),
                ListTile(title: Text('KYC Documents')),
                ListTile(title: Text('Accords de confidentialité')),
              ],
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

  void _changeReportFrequency() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fréquence des rapports'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Quotidien'),
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackbar('Fréquence mise à jour: Quotidien');
                  },
                ),
                ListTile(
                  title: const Text('Hebdomadaire'),
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackbar('Fréquence mise à jour: Hebdomadaire');
                  },
                ),
                ListTile(
                  title: const Text('Mensuel'),
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackbar('Fréquence mise à jour: Mensuel');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateRiskTolerance() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Niveau de risque'),
          content: const Text('Mettez à jour votre tolérance au risque'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('Préférence de risque mise à jour');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Sauvegarder'),
            ),
          ],
        );
      },
    );
  }

  void _updatePreferredSectors() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Secteurs préférés'),
          content: const Text('Modifiez vos secteurs d\'intérêt'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('Secteurs préférés mis à jour');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Sauvegarder'),
            ),
          ],
        );
      },
    );
  }

  void _updateInvestmentAmount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Montant d\'investissement'),
          content: const Text('Ajustez vos plafonds d\'investissement'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('Montant d\'investissement mis à jour');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Sauvegarder'),
            ),
          ],
        );
      },
    );
  }

  void _showHelpCenter() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HelpCenterPage(),
      ),
    );
  }

  void _contactSupport() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contacter le support'),
          content: const Text('Email: support@comvest.com\nTéléphone: +33 1 23 45 67 89'),
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

  void _showTerms() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LegalPage(title: 'Conditions d\'utilisation'),
      ),
    );
  }

  void _showPrivacyPolicy() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LegalPage(title: 'Politique de confidentialité'),
      ),
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Supprimer le compte'),
          content: const Text('Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('Demande de suppression envoyée');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Déconnexion'),
          content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Déconnexion'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF7533E8),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Additional pages for navigation
class PersonalInfoPage extends StatelessWidget {
  final Investor investor;

  const PersonalInfoPage({super.key, required this.investor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations personnelles'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem('Prénom', investor.firstName),
            _buildInfoItem('Nom', investor.lastName),
            _buildInfoItem('Email', investor.email),
            if (investor.phone != null) _buildInfoItem('Téléphone', investor.phone!),
            if (investor.country != null) _buildInfoItem('Pays', investor.country!),
            if (investor.investorType != null) _buildInfoItem('Type d\'investisseur', investor.investorType!),
            if (investor.experienceLevel != null) _buildInfoItem('Expérience', investor.experienceLevel!),
            if (investor.investmentRange != null) _buildInfoItem('Montant typique', investor.investmentRange!),
            if (investor.selectedIndustries.isNotEmpty)
              _buildInfoItem('Secteurs d\'intérêt', investor.selectedIndustries.join(', ')),
            if (investor.professionalBackground != null)
              _buildInfoItem('Background professionnel', investor.professionalBackground!),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SecurityPage extends StatelessWidget {
  final Investor investor;

  const SecurityPage({super.key, required this.investor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sécurité du compte'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSecurityCard(
              'Mot de passe',
              'Mettre à jour votre mot de passe',
              Icons.lock,
              () {
                // Change password
              },
            ),
            _buildSecurityCard(
              'Authentification à deux facteurs',
              'Ajouter une couche de sécurité supplémentaire',
              Icons.security,
              () {
                // Enable 2FA
              },
            ),
            _buildSecurityCard(
              'Sessions actives',
              'Gérer vos sessions connectées',
              Icons.devices,
              () {
                // View active sessions
              },
            ),
            _buildSecurityCard(
              'Historique de connexion',
              'Consulter vos dernières connexions',
              Icons.history,
              () {
                // View login history
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityCard(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF7533E8).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF7533E8)),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centre d\'aide'),
      ),
      body: ListView(
        children: [
          _buildHelpItem('FAQ', Icons.question_answer),
          _buildHelpItem('Guide d\'utilisation', Icons.book),
          _buildHelpItem('Tutoriels vidéo', Icons.video_library),
          _buildHelpItem('Contact support', Icons.headset_mic),
        ],
      ),
    );
  }

  Widget _buildHelpItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF7533E8)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to help section
      },
    );
  }
}

class LegalPage extends StatelessWidget {
  final String title;

  const LegalPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
          'Contenu des conditions d\'utilisation...',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}