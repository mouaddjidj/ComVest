import 'package:comvest/l10n/app_localizations.dart';
import 'package:comvest/widgets/models.dart';
import 'package:flutter/material.dart';
  // AJOUTEZ CET IMPORT
import 'investor_dashboard.dart';

class CreateInvestorAccount extends StatefulWidget {
  const CreateInvestorAccount({super.key});

  @override
  State<CreateInvestorAccount> createState() => _CreateInvestorAccountState();
}

class _CreateInvestorAccountState extends State<CreateInvestorAccount> {
  int _currentStep = 0;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _investmentRangeController = TextEditingController();
  final TextEditingController _professionalBackgroundController = TextEditingController();
  
  String? _selectedCountry;
  String? _investorType;
  String? _investmentExperience;
  bool _acceptTerms = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // LISTES AVEC LOCALISATION
  // Définir les clés de base (en français comme référence)
final List<String> _countryKeys = [
  'France', 'Belgique', 'Suisse', 'Canada', 'Allemagne', 'Espagne',
  'Italie', 'Royaume-Uni', 'États-Unis', 'Maroc', 'Tunisie', 'Algérie'
];

// Traductions par langue
final Map<String, Map<String, String>> _countryTranslations = {
  'en': {
    'France': 'France',
    'Belgique': 'Belgium',
    'Suisse': 'Switzerland',
    'Canada': 'Canada',
    'Allemagne': 'Germany',
    'Espagne': 'Spain',
    'Italie': 'Italy',
    'Royaume-Uni': 'United Kingdom',
    'États-Unis': 'United States',
    'Maroc': 'Morocco',
    'Tunisie': 'Tunisia',
    'Algérie': 'Algeria',
  },
  'fr': {
    'France': 'France',
    'Belgique': 'Belgique',
    'Suisse': 'Suisse',
    'Canada': 'Canada',
    'Allemagne': 'Allemagne',
    'Espagne': 'Espagne',
    'Italie': 'Italie',
    'Royaume-Uni': 'Royaume-Uni',
    'États-Unis': 'États-Unis',
    'Maroc': 'Maroc',
    'Tunisie': 'Tunisie',
    'Algérie': 'Algérie',
  },
  'ar': {
    'France': 'فرنسا',
    'Belgique': 'بلجيكا',
    'Suisse': 'سويسرا',
    'Canada': 'كندا',
    'Allemagne': 'ألمانيا',
    'Espagne': 'إسبانيا',
    'Italie': 'إيطاليا',
    'Royaume-Uni': 'المملكة المتحدة',
    'États-Unis': 'الولايات المتحدة',
    'Maroc': 'المغرب',
    'Tunisie': 'تونس',
    'Algérie': 'الجزائر',
  },
};

List<String> _getCountries(BuildContext context) {
  final locale = Localizations.localeOf(context).languageCode;
  final translations = _countryTranslations[locale] ?? _countryTranslations['en']!;
  
  // Traduit chaque pays
  return _countryKeys.map((key) => translations[key]!).toList();
}

  List<String> _getInvestorTypes(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.privateInvestor,
      l10n.businessAngel,
      l10n.investmentFund,
      l10n.familyOffice,
      l10n.institutionalInvestor,
      l10n.corporateVenture
    ];
  }

  List<String> _getExperienceLevels(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.beginnerExperience,
      l10n.intermediateExperience,
      l10n.experiencedExperience,
      l10n.expertExperience
    ];
  }

  List<String> _getIndustries(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.technologySector,
      l10n.healthBiotechSector,
      l10n.energyEnvironmentSector,
      l10n.financeFintechSector,
      l10n.realEstateSector,
      l10n.retailSector,
      l10n.industrySector,
      l10n.professionalServicesSector,
      l10n.mediaCommunicationSector,
      l10n.tourismSector
    ];
  }

  final List<String> _selectedIndustries = [];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.createInvestorAccountTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Top Step Indicator
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepIndicator(context, 0, l10n.profileStep),
                _buildStepIndicator(context, 1, l10n.investmentStep),
                _buildStepIndicator(context, 2, l10n.securityStep),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: _buildStepContent(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[300]!)),
        ),
        child: Row(
          children: [
            if (_currentStep > 0)
              Expanded(
                child: OutlinedButton(
                  onPressed: _previousStep,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Color(0xFF7533E8)),
                  ),
                  child: Text(
                    l10n.backButton,
                    style: const TextStyle(
                      color: Color(0xFF7533E8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (_currentStep > 0) const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7533E8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _currentStep == 2 ? l10n.createAccountButton : l10n.continueButton,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(BuildContext context, int stepNumber, String title) {
    bool isActive = stepNumber == _currentStep;
    bool isCompleted = stepNumber < _currentStep;
    
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isActive || isCompleted 
                      ? const Color(0xFF7533E8) 
                      : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isCompleted
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : Text(
                          (stepNumber + 1).toString(),
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              if (stepNumber < 2) 
                Expanded(
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: stepNumber < _currentStep ? const Color(0xFF7533E8) : Colors.grey[300],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? const Color(0xFF7533E8) : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(BuildContext context) {
    switch (_currentStep) {
      case 0:
        return _buildStep1(context);
      case 1:
        return _buildStep2(context);
      case 2:
        return _buildStep3(context);
      default:
        return _buildStep1(context);
    }
  }

  Widget _buildStep1(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.personalInformation,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.createInvestorProfile,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),

        // Username
        Text(
           l10n.usernameLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: l10n.usernameHintInvestor,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // First Name
        Text(
          l10n.firstName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _firstNameController,
            decoration: InputDecoration(
              hintText: l10n.firstNameHint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Last Name
        Text(
          l10n.lastName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _lastNameController,
            decoration: InputDecoration(
              hintText: l10n.lastNameHint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Email
        Text(
          l10n.email,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: l10n.emailHintInvestor,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 20),

        // Phone
        Text(
          l10n.phone,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: l10n.phoneHintInvestor,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        const SizedBox(height: 20),

        // Country
        Text(
          l10n.countryOfResidence,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(l10n.selectCountryHint),
              ),
              value: _selectedCountry,
              items: _getCountries(context).map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(country),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountry = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep2(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.investmentProfile,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.defineInvestmentPreferences,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),

        // Investor Type
        Text(
          l10n.investorType,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(l10n.selectInvestorTypeHint),
              ),
              value: _investorType,
              items: _getInvestorTypes(context).map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(type),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _investorType = newValue;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Investment Experience
        Text(
          l10n.investmentExperience,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(l10n.selectExperienceHint),
              ),
              value: _investmentExperience,
              items: _getExperienceLevels(context).map((String level) {
                return DropdownMenuItem<String>(
                  value: level,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(level),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _investmentExperience = newValue;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Investment Range
        Text(
          l10n.investmentAmount,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _investmentRangeController,
            decoration: InputDecoration(
              hintText: l10n.investmentAmountHint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(height: 20),

        // Preferred Industries
        Text(
          l10n.interestedSectors,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.selectSectorsHint,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _getIndustries(context).map((industry) {
            bool isSelected = _selectedIndustries.contains(industry);
            return FilterChip(
              label: Text(industry),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedIndustries.add(industry);
                  } else {
                    _selectedIndustries.remove(industry);
                  }
                });
              },
              selectedColor: const Color(0xFF7533E8),
              checkmarkColor: Colors.white,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep3(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.accountSecurity,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.createLoginCredentials,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),

        // Password
        Text(
          l10n.passwordLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: l10n.passwordHintInvestor,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Confirm Password
        Text(
          l10n.confirmPassword,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _confirmPasswordController,
            obscureText: !_isConfirmPasswordVisible,
            decoration: InputDecoration(
              hintText: l10n.confirmPasswordHintInvestor,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Professional Background
        Text(
          l10n.professionalBackground,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _professionalBackgroundController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: l10n.professionalBackgroundHint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Terms and Conditions
        Row(
          children: [
            Checkbox(
              value: _acceptTerms,
              onChanged: (value) {
                setState(() {
                  _acceptTerms = value!;
                });
              },
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: l10n.acceptTerms,
                  style: const TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: l10n.termsOfUse,
                      style: const TextStyle(
                        color: Color(0xFF7533E8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: l10n.and,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: l10n.privacyPolicy,
                      style: const TextStyle(
                        color: Color(0xFF7533E8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      _createAccount();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _createAccount() {
    final l10n = AppLocalizations.of(context)!;
    
    // Validation
    if (_usernameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        !_acceptTerms) {
      _showErrorDialog(l10n.fillRequiredFields);
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog(l10n.passwordsDontMatch);
      return;
    }

    // Username validation rules
    if (_usernameController.text.length < 3) {
      _showErrorDialog(l10n.usernameMinCharacters);
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(_usernameController.text)) {
      _showErrorDialog(l10n.usernameAllowedCharacters);
      return;
    }

    // Create investor object with username
    final investor = Investor(
      username: _usernameController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      country: _selectedCountry,
      investorType: _investorType,
      experienceLevel: _investmentExperience,
      investmentRange: _investmentRangeController.text,
      selectedIndustries: _selectedIndustries,
      professionalBackground: _professionalBackgroundController.text, 
      id: '', 
      password: '',
    );

    // Navigate to dashboard with the investor data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => InvestorDashboard(investor: investor),
      ),
    );
  }

  void _showErrorDialog(String message) {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.validationError),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _investmentRangeController.dispose();
    _professionalBackgroundController.dispose();
    super.dispose();
  }
}