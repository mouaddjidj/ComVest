import 'package:flutter/material.dart';
import './AdsServices.dart';

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
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _activiteController = TextEditingController();


  final List<String> _selectedLanguages = [];
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

  // List of Algerian villages
  final List<String> _algerianVillages = [
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

  // List of business sectors
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Créer un compte',
          style: TextStyle(
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
                _buildStepIndicator(0, 'Nom'),
                _buildStepIndicator(1, 'Contact'),
                _buildStepIndicator(2, 'Profil'),
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
                  child: const Text(
                    'Retour',
                    style: TextStyle(
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
                  _currentStep == 3 ? 'Créer le profil' : 'Continuer',
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
              if (stepNumber < 3)
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
    switch (_currentStep) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep3();
      case 2:
        return _buildStep4();
      default:
        return _buildStep1();
    }
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quel est le nom de votre entreprise ?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Sélectionnez une entité, ou créez-en une nouvelle, pour l\'inscrire sur Sortlist',
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez le nom de votre entreprise...',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Secteur d'activité (moved from Step 4)
        const Text(
          'Secteur d\'activité',
          style: TextStyle(
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionnez votre secteur d\'activité'),
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

        // Activité (moved from Step 4)
        const Text(
          'Activité',
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Sélectionnez votre activité',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informations de contact',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),

        // Village Selection
        const Text(
          'Village',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sélectionnez le village où votre entreprise est basée',
          style: TextStyle(
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionnez votre village'),
              ),
              value: _selectedVillage,
              items: _algerianVillages.map((String village) {
                return DropdownMenuItem<String>(
                  value: village,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(village),
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
        const Text(
          'Adresse de l\'entreprise',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cette adresse sera utilisée pour vous offrir une visibilité en ligne dans votre région et vous suggérer des opportunités à proximité. Vous pourrez l\'éditer et en ajouter d\'autres par la suite.',
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez votre adresse...',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Phone
        const Text(
          'Numéro de téléphone de l\'entreprise',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ce numéro de téléphone ne sera pas visible publiquement sur votre profil. Nous ne le communiquerons qu\'aux personnes qui recherchent un prestataire comme le vôtre.',
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'es (+213) Algérie | 7712 34 56 78',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Website
        const Text(
          'Site web de l\'entreprise',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
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
            decoration: const InputDecoration(
              hintText:
                  'Entrez votre site web... (ex: https://votre-entreprise.com)',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Email
        const Text(
          'Adresse électronique de l\'entreprise',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cette adresse sera utilisée pour les communications liées aux projets entrants',
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez l\'email de contact de l\'entreprise...',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bienvenue ! Configurons votre profil',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Définissez les informations qui apparaîtront sur votre profil Sortlist.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),

        // About Section
        const Text(
          'À propos',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Company Name
        const Text(
          'Nom de l\'entreprise',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _aboutController,
            maxLength: 60,
            decoration: InputDecoration(
              hintText: _companyNameController.text.isEmpty
                  ? 'Nom de l\'entreprise'
                  : _companyNameController.text,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              counterText: '0/60',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Show secteur and activité info (read-only)
        if (_selectedSecteur != null) ...[
          const Text(
            'Secteur d\'activité',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[50],
            ),
            child: Text(
              _selectedSecteur!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (_activiteController.text.isNotEmpty) ...[
          const Text(
            'Activité',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[50],
            ),
            child: Text(
              _activiteController.text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Languages
        const Text(
          'Langues parlées (facultatif)',
          style: TextStyle(
            fontWeight: FontWeight.w500,
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionner'),
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
        const SizedBox(height: 16),

        // Team Size
        const Text(
          'Taille de votre équipe',
          style: TextStyle(
            fontWeight: FontWeight.w500,
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionner'),
              ),
              value: _teamSize,
              items: const [
                DropdownMenuItem(value: '1-10', child: Text('1-10 employés')),
                DropdownMenuItem(value: '11-50', child: Text('11-50 employés')),
                DropdownMenuItem(
                    value: '51-200', child: Text('51-200 employés')),
                DropdownMenuItem(
                    value: '201-500', child: Text('201-500 employés')),
                DropdownMenuItem(
                    value: '500+', child: Text('Plus de 500 employés')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _teamSize = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  void _nextStep() {
    if (_currentStep < 3) {
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

  void _createProfile() {
    // Handle profile creation logic here
    print('Creating profile with:');
    print('Company: ${_companyNameController.text}');
    print('Secteur: $_selectedSecteur');
    print('Activité: ${_activiteController.text}');
    print('Village: $_selectedVillage');
    print('Address: ${_addressController.text}');
    print('Phone: ${_phoneController.text}');
    print('Website: ${_websiteController.text}');
    print('Email: ${_emailController.text}');
    print('About: ${_aboutController.text}');
    print('Languages: $_selectedLanguages');
    print('Team Size: $_teamSize');

    // Navigate to AdsServices
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PricingScreen()),
    );
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _emailController.dispose();
    _aboutController.dispose();
    _activiteController.dispose();
    super.dispose();
  }
}
