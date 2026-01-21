import 'package:flutter/material.dart';
import './AdsServices.dart';
import '../l10n/app_localizations.dart'; // Add this import

class CreateCompanySortlistStyle extends StatefulWidget {
  const CreateCompanySortlistStyle({super.key});

  @override
  State<CreateCompanySortlistStyle> createState() =>
      _CreateCompanySortlistStyleState();
}

class _CreateCompanySortlistStyleState
    extends State<CreateCompanySortlistStyle> {
  int _currentStep = 0;
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _activiteController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final List<String> _selectedLanguages = [];
  
  // These lists should be localized too
  final List<String> _availableLanguages = [
    'Français',
    'Anglais',
    'Espagnol',
    'Allemand',
    'Italien'
  ];

  String? _teamSize;
  String? _selectedVillage;
  String? _selectedSecteur;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // These lists should remain as they are data, not UI text
  final List<String> _algerianLocations = [
    'Aïn El Hammam',
    'Tizi Ouzou',
    'Béjaïa',
    'Sétif',
    'Constantine',
    'Oran',
    'Alger Centre',
    'Tlemcen',
    'Annaba',
    'Batna',
    'Blida',
    'Djelfa',
    'Sidi Bel Abbès',
    'Biskra',
    'Tébessa',
    'El Oued',
    'Skikda',
    'Tiaret',
    'Bechar',
    'Mostaganem',
    'M\'Sila',
    'Ghardaïa',
    'Saïda',
    'Laghouat',
    'Mascara',
    'Ouargla',
    'Relizane',
    'Tissemsilt',
    'Boumerdès',
    'Chlef',
    'Tamanrasset',
    'Adrar',
    'Aïn Defla',
    'Aïn Témouchent',
    'Bordj Bou Arreridj',
    'Bouira',
    'Djanet',
    'El Bayadh',
    'El Tarf',
    'Guelma',
    'Illizi',
    'Khenchela',
    'Mila',
    'Naâma',
    'Oum El Bouaghi',
    'Souk Ahras',
    'Tindouf',
    'Tipaza',
    'Tizi Rached',
    'Azazga'
  ];

  final List<String> _secteurs = [
    'Technologie',
    'Santé',
    'Construction',
    'Éducation',
    'Finance',
    'Commerce',
    'Transport',
    'Tourisme',
    'Agriculture',
    'Industrie',
    'Services',
    'Communication',
    'Immobilier',
    'Énergie',
    'Environnement',
    'Logistique',
    'Marketing',
    'Consulting',
    'Art et Culture',
    'Restauration',
    'Mode',
    'Sport',
    'Médias',
    'Assurance',
    'Juridique'
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
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
          localizations.createAccountTitle,
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
                _buildStepIndicator(0, localizations.stepInfo),
                _buildStepIndicator(1, localizations.stepContact),
                _buildStepIndicator(2, localizations.stepProfile),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: _buildStepContent(),
            ),
          ),
        ],
      ),
      // Fixed Bottom Navigation Buttons
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
                    localizations.back,
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
                  _currentStep == 2 ? localizations.createProfile : localizations.continueText,
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

  Widget _buildStepIndicator(int stepNumber, String title) {
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
                      color: stepNumber < _currentStep
                          ? const Color(0xFF7533E8)
                          : Colors.grey[300],
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

  Widget _buildStepContent() {
    final localizations = AppLocalizations.of(context)!;
    
    switch (_currentStep) {
      case 0:
        return _buildStep1(localizations);
      case 1:
        return _buildStep2(localizations);
      case 2:
        return _buildStep3(localizations);
      default:
        return _buildStep1(localizations);
    }
  }

  Widget _buildStep1(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.companyNameQuestion,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          localizations.companyNameDescription,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _companyNameController,
            decoration: InputDecoration(
              hintText: localizations.companyNameHint ?? 'Enter your company name...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Username
        Text(
          localizations.usernameLabel,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.usernameDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
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
              hintText: localizations.usernameHint ?? 'Choose a username...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Business Sector
        Text(
          localizations.businessSector,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
                child: Text(localizations.selectBusinessSectorHint ?? 'Select your business sector'),
              ),
              value: _selectedSecteur,
              items: _secteurs.map((String secteur) {
                return DropdownMenuItem<String>(
                  value: secteur,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(secteur),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSecteur = newValue;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Activity
        Text(
          localizations.activityLabel,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _activiteController,
            decoration: InputDecoration(
              hintText: localizations.selectActivityHint ?? 'Select your activity',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Password
        Text(
          localizations.passwordLabel,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: localizations.passwordHint ?? 'Enter your password...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Confirm Password
        Text(
          localizations.confirmPasswordLabel,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              hintText: localizations.confirmPasswordHint ?? 'Confirm your password...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep2(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.contactInformation ?? 'Contact Information',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),

        // Location Selection
        Text(
          localizations.locationLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.locationDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
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
                child: Text(localizations.selectLocationHint ?? 'Select your location'),
              ),
              value: _selectedVillage,
              items: _algerianLocations.map((String location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(location),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedVillage = newValue;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Address
        Text(
          localizations.addressLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.addressDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _addressController,
            decoration: InputDecoration(
              hintText: localizations.addressHint ?? 'Enter your address...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Phone
        Text(
          localizations.phoneLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.phoneDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: localizations.phoneHint ?? 'eg (+213) Algeria | 7712 34 56 78',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Website (Optional)
        Text(
          localizations.websiteLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.websiteDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _websiteController,
            decoration: InputDecoration(
              hintText: localizations.websiteHint ?? 'Enter your website... (ex: https://your-company.com)',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Email
        Text(
          localizations.emailLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.emailDescription,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: localizations.emailHint ?? 'Enter company contact email...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep3(AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.welcomeProfileSetup,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localizations.profileSetupDescription,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),

        // Company Description
        Text(
          localizations.companyDescriptionLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _descriptionController,
            maxLines: 4,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: localizations.companyDescriptionHint ?? 'Describe your company (max 500 characters)...',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${_descriptionController.text.length}/500 ${localizations.characters ?? 'characters'}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),

        // Team Size
        Text(
          localizations.teamSizeLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
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
                child: Text(localizations.selectTeamSizeHint ?? 'Select'),
              ),
              value: _teamSize,
              items: [
                DropdownMenuItem(value: '1-10', child: Text(localizations.teamSize1_10)),
                DropdownMenuItem(value: '11-50', child: Text(localizations.teamSize11_50)),
                DropdownMenuItem(value: '51-200', child: Text(localizations.teamSize51_200)),
                DropdownMenuItem(value: '201-500', child: Text(localizations.teamSize201_500)),
                DropdownMenuItem(value: '500+', child: Text(localizations.teamSize500plus)),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _teamSize = newValue;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Languages Spoken
        Text(
          localizations.languagesLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
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
                child: Text(localizations.selectLanguagesHint ?? 'Select'),
              ),
              items: _availableLanguages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _selectedLanguages.contains(language),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                _selectedLanguages.add(language);
                              } else {
                                _selectedLanguages.remove(language);
                              }
                            });
                          },
                        ),
                        Text(language),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handled in checkbox
              },
            ),
          ),
        ),
      ],
    );
  }

  void _nextStep() {
    final localizations = AppLocalizations.of(context)!;
    
    if (_currentStep < 2) {
      // Validation before proceeding to next step
      if (_currentStep == 0) {
        // Validate step 1 fields
        if (_companyNameController.text.isEmpty) {
          _showError(localizations.enterCompanyName);
          return;
        }
        if (_usernameController.text.isEmpty) {
          _showError(localizations.chooseUsername);
          return;
        }
        if (_usernameController.text.length < 3) {
          _showError(localizations.usernameMinLength);
          return;
        }
        if (_selectedSecteur == null) {
          _showError(localizations.selectBusinessSector);
          return;
        }
        if (_activiteController.text.isEmpty) {
          _showError(localizations.enterActivity);
          return;
        }
        if (_passwordController.text.isEmpty) {
          _showError(localizations.enterPassword);
          return;
        }
        if (_passwordController.text.length < 6) {
          _showError(localizations.passwordMinLength);
          return;
        }
        if (_passwordController.text != _confirmPasswordController.text) {
          _showError(localizations.passwordsNotMatch);
          return;
        }
      }
      
      if (_currentStep == 1) {
        // Validate step 2 fields
        if (_selectedVillage == null) {
          _showError(localizations.selectLocation);
          return;
        }
        if (_addressController.text.isEmpty) {
          _showError(localizations.enterAddress);
          return;
        }
        if (_phoneController.text.isEmpty) {
          _showError(localizations.enterPhone);
          return;
        }
        if (_emailController.text.isEmpty) {
          _showError(localizations.enterEmail);
          return;
        }
        if (!_isValidEmail(_emailController.text)) {
          _showError(localizations.enterValidEmail);
          return;
        }
        // Website is optional, so no validation needed
      }
      
      setState(() {
        _currentStep += 1;
      });
    } else {
      _createProfile();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _createProfile() {
    final localizations = AppLocalizations.of(context)!;
    
    // Final validation before creation
    if (_descriptionController.text.isEmpty) {
      _showError(localizations.enterCompanyDescription);
      return;
    }
    if (_teamSize == null) {
      _showError(localizations.selectTeamSize);
      return;
    }
    if (_passwordController.text.isEmpty ||
        _passwordController.text != _confirmPasswordController.text) {
      _showError(localizations.checkPassword);
      return;
    }

    // Handle profile creation logic here
    print('Creating profile with:');
    print('Company: ${_companyNameController.text}');
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');
    print('Secteur: $_selectedSecteur');
    print('Activité: ${_activiteController.text}');
    print('Email: ${_emailController.text}');
    print('Localisation: $_selectedVillage');
    print('Address: ${_addressController.text}');
    print('Phone: ${_phoneController.text}');
    print('Website: ${_websiteController.text}');
    print('Description: ${_descriptionController.text}');
    print('Team Size: $_teamSize');
    print('Languages: $_selectedLanguages');

    // Navigate to AdsServices
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PricingScreen()),
    );
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _usernameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    _activiteController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}