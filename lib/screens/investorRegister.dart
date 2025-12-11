import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investor Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF7533E8),
        fontFamily: 'Poppins',
      ),
      home: const CreateInvestorAccount(),
    );
  }
}

// Model Classes
class Investor {
  final String firstName;
  final String lastName;
  final String email;
  final String? investorType;
  final String? experienceLevel;
  final List<String> selectedIndustries;
  final DateTime registrationDate;

  Investor({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.investorType,
    this.experienceLevel,
    this.selectedIndustries = const [],
    DateTime? registrationDate,
  }) : registrationDate = registrationDate ?? DateTime.now();
}

class Company {
  final String name;
  final String description;
  final String industry;
  final String sector;
  final double valuation;
  final int employees;
  final String location;
  final String founded;
  final String ceo;
  final double revenue;
  final List<String> products;
  final Color cardColor;
  final String logo;

  Company({
    required this.name,
    required this.description,
    required this.industry,
    required this.sector,
    required this.valuation,
    required this.employees,
    required this.location,
    required this.founded,
    required this.ceo,
    required this.revenue,
    required this.products,
    required this.cardColor,
    required this.logo,
  });
}

// Create Investor Account (Registration)
class CreateInvestorAccount extends StatefulWidget {
  const CreateInvestorAccount({super.key});

  @override
  State<CreateInvestorAccount> createState() => _CreateInvestorAccountState();
}

class _CreateInvestorAccountState extends State<CreateInvestorAccount> {
  int _currentStep = 0;
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

  final List<String> _countries = [
    'France', 'Belgique', 'Suisse', 'Canada', 'Allemagne', 'Espagne', 
    'Italie', 'Royaume-Uni', 'États-Unis', 'Maroc', 'Tunisie', 'Algérie'
  ];

  final List<String> _investorTypes = [
    'Investisseur privé',
    'Business Angel',
    'Fonds d\'investissement',
    'Family Office',
    'Investisseur institutionnel',
    'Corporate Venture'
  ];

  final List<String> _experienceLevels = [
    'Débutant (0-2 ans)',
    'Intermédiaire (2-5 ans)',
    'Expérimenté (5-10 ans)',
    'Expert (10+ ans)'
  ];

  final List<String> _industries = [
    'Technologie',
    'Santé/Biotech',
    'Énergie/Environnement',
    'Finance/Fintech',
    'Immobilier',
    'Commerce de détail',
    'Industrie',
    'Services professionnels',
    'Médias/Communication',
    'Tourisme'
  ];

  final List<String> _selectedIndustries = [];

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
          'Créer un compte investisseur',
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
                _buildStepIndicator(0, 'Profil'),
                _buildStepIndicator(1, 'Investissement'),
                _buildStepIndicator(2, 'Sécurité'),
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
                  _currentStep == 2 ? 'Créer le compte' : 'Continuer',
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

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep2();
      case 2:
        return _buildStep3();
      default:
        return _buildStep1();
    }
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informations personnelles',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Créez votre profil d\'investisseur',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),

        // First Name
        const Text(
          "Prénom",
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez votre prénom',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Last Name
        const Text(
          "Nom",
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez votre nom',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Email
        const Text(
          "Email",
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez votre email',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 20),

        // Phone
        const Text(
          "Téléphone",
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Entrez votre numéro de téléphone',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        const SizedBox(height: 20),

        // Country
        const Text(
          "Pays de résidence",
          style: TextStyle(
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionnez votre pays'),
              ),
              value: _selectedCountry,
              items: _countries.map((String country) {
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

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profil d\'investissement',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Définissez vos préférences d\'investissement',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),

        // Investor Type
        const Text(
          "Type d'investisseur",
          style: TextStyle(
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionnez votre type'),
              ),
              value: _investorType,
              items: _investorTypes.map((String type) {
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
        const Text(
          "Expérience en investissement",
          style: TextStyle(
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
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sélectionnez votre niveau d\'expérience'),
              ),
              value: _investmentExperience,
              items: _experienceLevels.map((String level) {
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
        const Text(
          "Montant d'investissement typique (€)",
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Ex: 10 000 - 50 000 €',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(height: 20),

        // Preferred Industries
        const Text(
          "Secteurs d'intérêt",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Sélectionnez les secteurs qui vous intéressent",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _industries.map((industry) {
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

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sécurité du compte',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Créez vos identifiants de connexion',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),

        // Password
        const Text(
          "Mot de passe",
          style: TextStyle(
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
              hintText: 'Créez un mot de passe sécurisé',
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
        const Text(
          "Confirmer le mot de passe",
          style: TextStyle(
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
              hintText: 'Confirmez votre mot de passe',
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
        const Text(
          "Background professionnel (optionnel)",
          style: TextStyle(
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
            decoration: const InputDecoration(
              hintText: 'Décrivez votre expérience professionnelle...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                text: const TextSpan(
                  text: "J'accepte les ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "conditions d'utilisation",
                      style: TextStyle(
                        color: Color(0xFF7533E8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " et la ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: "politique de confidentialité",
                      style: TextStyle(
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
    // Validation
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        !_acceptTerms) {
      _showErrorDialog('Veuillez remplir tous les champs obligatoires');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog('Les mots de passe ne correspondent pas');
      return;
    }

    // Create investor object
    final investor = Investor(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      investorType: _investorType,
      experienceLevel: _investmentExperience,
      selectedIndustries: _selectedIndustries,
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Erreur"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
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

// Investor Dashboard with Menu and Companies
class InvestorDashboard extends StatefulWidget {
  final Investor investor;
  
  const InvestorDashboard({super.key, required this.investor});

  @override
  State<InvestorDashboard> createState() => _InvestorDashboardState();
}

class _InvestorDashboardState extends State<InvestorDashboard> {
  int _selectedTab = 0;
  final List<Company> _companies = [
    Company(
      name: 'LVMH',
      description: 'Leader mondial du luxe, portefeuille de 75 maisons prestigieuses',
      industry: 'Luxe',
      sector: 'Produits de consommation',
      valuation: 380.5,
      employees: 196000,
      location: 'Paris, France',
      founded: '1854',
      ceo: 'Bernard Arnault',
      revenue: 86.2,
      products: ['Mode', 'Parfums', 'Vins & Spiritueux', 'Montres & Joaillerie'],
      cardColor: const Color(0xFF2C3E50),
      logo: '👜',
    ),
    Company(
      name: 'Airbus',
      description: 'Leader mondial de l\'aéronautique, de l\'espace et des services associés',
      industry: 'Aéronautique',
      sector: 'Industrie',
      valuation: 112.3,
      employees: 134000,
      location: 'Toulouse, France',
      founded: '1970',
      ceo: 'Guillaume Faury',
      revenue: 58.8,
      products: ['Avions commerciaux', 'Hélicoptères', 'Systèmes de défense', 'Spatial'],
      cardColor: const Color(0xFF3498DB),
      logo: '✈️',
    ),
    Company(
      name: 'Sanofi',
      description: 'Groupe pharmaceutique mondial, spécialisé dans la santé humaine',
      industry: 'Pharmaceutique',
      sector: 'Santé',
      valuation: 124.8,
      employees: 100000,
      location: 'Paris, France',
      founded: '1973',
      ceo: 'Paul Hudson',
      revenue: 43.0,
      products: ['Vaccins', 'Médicaments', 'Soins de santé', 'Biotechnologies'],
      cardColor: const Color(0xFF2ECC71),
      logo: '💊',
    ),
    Company(
      name: 'BNP Paribas',
      description: 'Première banque de la zone euro, services financiers internationaux',
      industry: 'Banque',
      sector: 'Finance',
      valuation: 77.5,
      employees: 190000,
      location: 'Paris, France',
      founded: '1848',
      ceo: 'Jean-Laurent Bonnafé',
      revenue: 50.6,
      products: ['Banque de détail', 'Banque d\'investissement', 'Asset Management', 'Assurance'],
      cardColor: const Color(0xFF9B59B6),
      logo: '🏦',
    ),
    Company(
      name: 'Capgemini',
      description: 'Leader mondial du conseil, des services informatiques et de la transformation digitale',
      industry: 'Technologie',
      sector: 'Services professionnels',
      valuation: 36.2,
      employees: 340000,
      location: 'Paris, France',
      founded: '1967',
      ceo: 'Aiman Ezzat',
      revenue: 22.5,
      products: ['Conseil', 'Services IT', 'Transformation digitale', 'Cloud'],
      cardColor: const Color(0xFFE74C3C),
      logo: '💻',
    ),
    Company(
      name: 'L\'Oréal',
      description: 'Leader mondial de la beauté, présent dans tous les circuits de distribution',
      industry: 'Cosmétique',
      sector: 'Produits de consommation',
      valuation: 236.4,
      employees: 88000,
      location: 'Clichy, France',
      founded: '1909',
      ceo: 'Nicolas Hieronimus',
      revenue: 41.2,
      products: ['Soins', 'Maquillage', 'Parfums', 'Produits capillaires'],
      cardColor: const Color(0xFFE67E22),
      logo: '💄',
    ),
    Company(
      name: 'TotalEnergies',
      description: 'Compagnie énergétique mondiale, producteur et fournisseur d\'énergies',
      industry: 'Énergie',
      sector: 'Énergie',
      valuation: 156.9,
      employees: 105000,
      location: 'Courbevoie, France',
      founded: '1924',
      ceo: 'Patrick Pouyanné',
      revenue: 285.6,
      products: ['Pétrole', 'Gaz', 'Électricité', 'Énergies renouvelables'],
      cardColor: const Color(0xFFF1C40F),
      logo: '⛽',
    ),
    Company(
      name: 'Hermès',
      description: 'Maison française de luxe réputée pour ses produits artisanaux de haute qualité',
      industry: 'Luxe',
      sector: 'Produits de consommation',
      valuation: 215.3,
      employees: 19700,
      location: 'Paris, France',
      founded: '1837',
      ceo: 'Axel Dumas',
      revenue: 13.4,
      products: ['Maroquinerie', 'Soieries', 'Prêt-à-porter', 'Accessoires'],
      cardColor: const Color(0xFF16A085),
      logo: '🧣',
    ),
  ];

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
            Text(
              'Bonjour, ${widget.investor.firstName} 👋',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (widget.investor.investorType != null)
              Text(
                widget.investor.investorType!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7533E8),
                ),
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _selectedTab == 0 ? _buildDashboard() : _buildCompanies(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        selectedItemColor: const Color(0xFF7533E8),
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Entreprises',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7533E8), Color(0xFF9B59B6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF7533E8),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${widget.investor.firstName} ${widget.investor.lastName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.investor.email,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                if (widget.investor.experienceLevel != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.investor.experienceLevel!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Color(0xFF7533E8)),
            title: const Text('Tableau de bord'),
            onTap: () {
              setState(() {
                _selectedTab = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business, color: Color(0xFF7533E8)),
            title: const Text('Entreprises'),
            onTap: () {
              setState(() {
                _selectedTab = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Color(0xFF7533E8)),
            title: const Text('Entreprises suivies'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.analytics, color: Color(0xFF7533E8)),
            title: const Text('Analyses marché'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet, color: Color(0xFF7533E8)),
            title: const Text('Portefeuille'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.newspaper, color: Color(0xFF7533E8)),
            title: const Text('Actualités'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF7533E8)),
            title: const Text('Paramètres'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Color(0xFF7533E8)),
            title: const Text('Aide & Support'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Déconnexion'),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7533E8), Color(0xFF9B59B6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7533E8).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dashboard Investisseur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Suivez vos entreprises préférées et découvrez de nouvelles opportunités',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF7533E8),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Explorer les entreprises',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Personalization based on selected industries
          if (widget.investor.selectedIndustries.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommandé pour vous',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Basé sur vos intérêts: ${widget.investor.selectedIndustries.join(", ")}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),

          // Quick Stats
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Entreprises',
                  value: '${_companies.length}',
                  icon: Icons.business,
                  color: const Color(0xFF4A90E2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  title: 'Capitalisation',
                  value: '1.4T€',
                  icon: Icons.trending_up,
                  color: const Color(0xFF2ECC71),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Secteurs',
                  value: '8',
                  icon: Icons.category,
                  color: const Color(0xFF9B59B6),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildStatCard(
                  title: 'Perform.',
                  value: '+12.5%',
                  icon: Icons.attach_money,
                  color: const Color(0xFFE67E22),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Top Companies
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top entreprises françaises',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Voir tout',
                style: TextStyle(
                  color: Color(0xFF7533E8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ..._companies.take(3).map((company) => _buildCompanyCard(company)).toList(),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanies() {
    return Column(
      children: [
        // Search and Filter Bar
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Rechercher une entreprise...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Color(0xFF7533E8)),
                onPressed: () {
                  _showFilterDialog();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        
        // Industry Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              FilterChip(
                label: const Text('Tous'),
                selected: true,
                onSelected: (_) {},
                selectedColor: const Color(0xFF7533E8),
                checkmarkColor: Colors.white,
              ),
              const SizedBox(width: 8),
              ...['Luxe', 'Technologie', 'Santé', 'Finance', 'Énergie', 'Industrie'].map((industry) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(industry),
                    selected: false,
                    onSelected: (_) {},
                  ),
                );
              }).toList(),
            ],
          ),
        ),
        const SizedBox(height: 20),
        
        // Companies List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _companies.length,
            itemBuilder: (context, index) {
              return _buildCompanyCard(_companies[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyCard(Company company) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: company.cardColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: company.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      company.logo,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${company.industry} • ${company.location}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {
                    _showCompanyOptions(company);
                  },
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company.description,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
                
                // Key Info
                Row(
                  children: [
                    _buildInfoItem('CEO', company.ceo),
                    const SizedBox(width: 20),
                    _buildInfoItem('Fondé', company.founded),
                    const SizedBox(width: 20),
                    _buildInfoItem('Employés', '${company.employees}'),
                  ],
                ),
                const SizedBox(height: 15),
                
                // Products/Services
                const Text(
                  'Produits & Services:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: company.products.map((product) {
                    return Chip(
                      label: Text(product),
                      backgroundColor: company.cardColor.withOpacity(0.1),
                      labelStyle: TextStyle(color: company.cardColor),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
                
                // Financial Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Capitalisation',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${company.valuation}B€',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Revenus',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${company.revenue}B€',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Secteur',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          company.sector,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                // Action Buttons
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _showCompanyDetails(company);
                        },
                        icon: const Icon(Icons.info_outline),
                        label: const Text('Détails'),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: company.cardColor),
                          foregroundColor: company.cardColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _followCompany(company);
                        },
                        icon: const Icon(Icons.star_border),
                        label: const Text('Suivre'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: company.cardColor,
                          foregroundColor: Colors.white,
                        ),
                      ),
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

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtrer les entreprises'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('Secteur:'),
                ...['Technologie', 'Santé', 'Finance', 'Énergie', 'Industrie', 'Luxe', 'Services'].map((sector) {
                  return CheckboxListTile(
                    title: Text(sector),
                    value: true,
                    onChanged: (value) {},
                  );
                }).toList(),
                const SizedBox(height: 20),
                const Text('Taille:'),
                ...['Grande cap', 'Moyenne cap', 'Petite cap'].map((size) {
                  return CheckboxListTile(
                    title: Text(size),
                    value: true,
                    onChanged: (value) {},
                  );
                }).toList(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Appliquer'),
            ),
          ],
        );
      },
    );
  }

  void _showCompanyOptions(Company company) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF7533E8)),
                title: const Text('Voir les détails'),
                onTap: () {
                  Navigator.pop(context);
                  _showCompanyDetails(company);
                },
              ),
              ListTile(
                leading: const Icon(Icons.star, color: Color(0xFF7533E8)),
                title: const Text('Ajouter aux favoris'),
                onTap: () {
                  Navigator.pop(context);
                  _followCompany(company);
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart, color: Color(0xFF7533E8)),
                title: const Text('Analyses financières'),
                onTap: () {
                  Navigator.pop(context);
                  _showFinancialAnalysis(company);
                },
              ),
              ListTile(
                leading: const Icon(Icons.newspaper, color: Color(0xFF7533E8)),
                title: const Text('Actualités récentes'),
                onTap: () {
                  Navigator.pop(context);
                  _showCompanyNews(company);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Color(0xFF7533E8)),
                title: const Text('Partager'),
                onTap: () {
                  Navigator.pop(context);
                  _shareCompany(company);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCompanyDetails(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(company.logo),
              const SizedBox(width: 10),
              Text(company.name),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  company.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Informations clés:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildDetailItem('Industrie', company.industry),
                _buildDetailItem('Secteur', company.sector),
                _buildDetailItem('Localisation', company.location),
                _buildDetailItem('Année de création', company.founded),
                _buildDetailItem('CEO', company.ceo),
                _buildDetailItem('Nombre d\'employés', '${company.employees}'),
                _buildDetailItem('Capitalisation', '${company.valuation}B€'),
                _buildDetailItem('Revenus annuels', '${company.revenue}B€'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _followCompany(company);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7533E8),
              ),
              child: const Text('Suivre'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _followCompany(Company company) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous suivez maintenant ${company.name}'),
        backgroundColor: const Color(0xFF2ECC71),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showFinancialAnalysis(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Analyse financière - ${company.name}'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Performance financière:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('• Croissance annuelle: +8.2%'),
                Text('• Marge bénéficiaire: 15.3%'),
                Text('• Ratio P/E: 24.5'),
                Text('• Dette/Capital: 0.42'),
                SizedBox(height: 20),
                Text(
                  'Recommandation:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Analyst consensus: ACHETER'),
                Text('Target price: +15%'),
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

  void _showCompanyNews(Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Actualités - ${company.name}'),
          content: SizedBox(
            width: double.maxFinite,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Publication des résultats Q4 2023'),
                    subtitle: Text('Croissance de 12% vs. année précédente'),
                  ),
                  ListTile(
                    title: Text('Nouvelle acquisition stratégique'),
                    subtitle: Text('Acquisition de TechSolutions pour 2.1B€'),
                  ),
                  ListTile(
                    title: Text('Nomination nouveau Directeur Financier'),
                    subtitle: Text('Marie Dupont rejoint le comité exécutif'),
                  ),
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

  void _shareCompany(Company company) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Lien de partage pour ${company.name} copié!'),
        backgroundColor: const Color(0xFF3498DB),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}