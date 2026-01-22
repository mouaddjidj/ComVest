import 'package:flutter/material.dart';
import 'package:comvest/widgets/models.dart';
import 'package:comvest/l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          localizations.settings,
          style: const TextStyle(
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
            Text(
              localizations.account,
              style: const TextStyle(
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
                    localizations.personalInformation,
                    _navigateToPersonalInfo,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.lock_outline,
                    localizations.accountSecurity,
                    _navigateToSecurity,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.credit_card,
                    localizations.paymentMethod,
                    _navigateToPaymentMethods,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.description_outlined,
                    localizations.termsOfUse,
                    _navigateToLegalDocuments,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Notifications
            Text(
              localizations.notifications,
              style: const TextStyle(
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
                    title: Text('${localizations.notifications} ${localizations.notificationsEnabled}'),
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
                    title: Text(localizations.emailAlerts),
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
                    title: Text(localizations.pushNotifications),
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
            Text(
              localizations.preferences,
              style: const TextStyle(
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
                    title: Text(localizations.darkMode),
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
                    title: Text(localizations.language),
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
                    localizations.reportFrequency,
                    _changeReportFrequency,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Investment Preferences
            Text(
              localizations.investmentPreferences,
              style: const TextStyle(
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
                    localizations.riskTolerance,
                    _updateRiskTolerance,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.category,
                    localizations.preferredSectors,
                    _updatePreferredSectors,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.attach_money,
                    localizations.investmentAmount,
                    _updateInvestmentAmount,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Support
            Text(
              localizations.support,
              style: const TextStyle(
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
                    localizations.helpCenter,
                    _showHelpCenter,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.headset_mic,
                    localizations.contactSupport,
                    _contactSupport,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.description,
                    localizations.termsOfUse,
                    _showTerms,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.security,
                    localizations.privacyPolicy,
                    _showPrivacyPolicy,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Danger Zone
            Text(
              localizations.dangerZone,
              style: const TextStyle(
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
                    localizations.deleteAccount,
                    _deleteAccount,
                    textColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                  const Divider(height: 0),
                  _buildSettingsTile(
                    Icons.logout,
                    localizations.logout,
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
    Color iconColor = const Color(0xFF7533E8),
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
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${localizations.editProfile}'),
          content: Text('${localizations.editProfile} ${localizations.notificationsEnabled.toLowerCase()}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.ok),
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
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.paymentMethod),
          content: Text('${localizations.paymentMethod} - ${localizations.notificationsEnabled.toLowerCase()}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.ok),
            ),
          ],
        );
      },
    );
  }

  void _navigateToLegalDocuments() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.legalDocuments),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(title: Text('${localizations.investmentPreferences} ${localizations.termsOfUse.toLowerCase()}')),
                ListTile(title: Text('KYC ${localizations.legalDocuments.toLowerCase()}')),
                ListTile(title: Text('${localizations.privacyPolicy} ${localizations.termsOfUse.toLowerCase()}')),
              ],
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

  void _changeReportFrequency() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.reportFrequency),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Quotidien'),
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackbar('${localizations.reportFrequency} mise à jour: Quotidien');
                  },
                ),
                ListTile(
                  title: const Text('Hebdomadaire'),
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackbar('${localizations.reportFrequency} mise à jour: Hebdomadaire');
                  },
                ),
                ListTile(
                  title: const Text('Mensuel'),
                  onTap: () {
                    Navigator.pop(context);
                    _showSnackbar('${localizations.reportFrequency} mise à jour: Mensuel');
                  },
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
        );
      },
    );
  }

  void _updateRiskTolerance() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.riskTolerance),
          content: Text('Mettez à jour votre ${localizations.riskTolerance.toLowerCase()}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('${localizations.riskTolerance} mise à jour');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: Text(localizations.save),
            ),
          ],
        );
      },
    );
  }

  void _updatePreferredSectors() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.preferredSectors),
          content: Text('Modifiez vos ${localizations.preferredSectors.toLowerCase()}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('${localizations.preferredSectors} mises à jour');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: Text(localizations.save),
            ),
          ],
        );
      },
    );
  }

  void _updateInvestmentAmount() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.investmentAmount),
          content: Text('Ajustez vos ${localizations.investmentAmount.toLowerCase()}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('${localizations.investmentAmount} mis à jour');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: Text(localizations.save),
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
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.contactSupport),
          content: Text('Email: support@comvest.com\n${localizations.phone}: +33 1 23 45 67 89'),
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

  void _showTerms() {
    final localizations = AppLocalizations.of(context)!;
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LegalPage(title: localizations.termsOfUse),
      ),
    );
  }

  void _showPrivacyPolicy() {
    final localizations = AppLocalizations.of(context)!;
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LegalPage(title: localizations.privacyPolicy),
      ),
    );
  }

  void _deleteAccount() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.deleteAccount),
          content: Text('Êtes-vous sûr de vouloir ${localizations.deleteAccount.toLowerCase()} ? Cette action est irréversible.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackbar('Demande de ${localizations.deleteAccount.toLowerCase()} envoyée');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(localizations.deleteAccount),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    final localizations = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localizations.logout),
          content: Text(localizations.confirmLogout),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: Text(localizations.logoutConfirm),
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
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.personalInformation),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem(localizations.firstName, investor.firstName),
            _buildInfoItem(localizations.lastName, investor.lastName),
            _buildInfoItem(localizations.email, investor.email),
            if (investor.phone != null) _buildInfoItem(localizations.phone, investor.phone!),
            if (investor.country != null) _buildInfoItem(localizations.country, investor.country!),
            if (investor.investorType != null) _buildInfoItem(localizations.investorType, investor.investorType!),
            if (investor.experienceLevel != null) _buildInfoItem(localizations.investmentExperience, investor.experienceLevel!),
            if (investor.investmentRange != null) _buildInfoItem(localizations.investmentAmount, investor.investmentRange!),
            if (investor.selectedIndustries.isNotEmpty)
              _buildInfoItem(localizations.interestedSectors, investor.selectedIndustries.join(', ')),
            if (investor.professionalBackground != null)
              _buildInfoItem(localizations.professionalBackground, investor.professionalBackground!),
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
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.accountSecurity),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSecurityCard(
              localizations.password,
              'Mettre à jour votre mot de passe',
              Icons.lock,
              () {
                // Change password
              },
            ),
            _buildSecurityCard(
              localizations.twoFactorAuth,
              'Ajouter une couche de sécurité supplémentaire',
              Icons.security,
              () {
                // Enable 2FA
              },
            ),
            _buildSecurityCard(
              localizations.activeSessions,
              'Gérer vos sessions connectées',
              Icons.devices,
              () {
                // View active sessions
              },
            ),
            _buildSecurityCard(
              localizations.loginHistory,
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
    final localizations = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.helpCenter),
      ),
      body: ListView(
        children: [
          _buildHelpItem(localizations.faq, Icons.question_answer),
          _buildHelpItem(localizations.userGuide, Icons.book),
          _buildHelpItem(localizations.videoTutorials, Icons.video_library),
          _buildHelpItem(localizations.contactSupport, Icons.headset_mic),
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