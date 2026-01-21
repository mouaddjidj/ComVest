// Model Classes
import 'dart:ui';

class Investor {
   final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? country;
  final String? investorType;
  final String? experienceLevel;
  final String? investmentRange;
  final List<String> selectedIndustries;
  final String? professionalBackground;
  final DateTime registrationDate;

  Investor({
      required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.country,
    this.investorType,
    this.experienceLevel,
    this.investmentRange,
    this.selectedIndustries = const [],
    this.professionalBackground,
    DateTime? registrationDate, required String username, required String password,
  }) : registrationDate = registrationDate ?? DateTime.now();
}

class Company {
  final String name;
  final String description;
  final String industry;
  final String sector;
  final String type;
  final double valuation;
  final int employees;
  final String location;
  final String founded;
  final String ceo;
  final double revenue;
  final List<String> products;
  final Color cardColor;
  final String logo;
   final String imagePath;
    final String email;
  final String phone;
  final String address;
    
  // New detailed information properties
  final Map<String, String>? detailedInfo;
  final Map<String, List<String>>? financials;
  final Map<String, Map<String, String>>? tests;
  final List<String>? milestones;
  
  // Existing properties
  final String website;
  final List<String> mobileApps;
  final String users;
  final String coverage;
  final String businessModel;

  Company({
    required this.name,
    required this.description,
    required this.industry,
    required this.sector,
      required this.type,
    required this.valuation,
    required this.employees,
    required this.location,
    required this.founded,
    required this.ceo,
    required this.revenue,
    required this.products,
    required this.cardColor,
    required this.logo,
     required this.imagePath,
    // Initialize existing properties
   
    this.website = '',
    this.mobileApps = const [],
    this.users = '',
    this.coverage = '',
    this.businessModel = '',
    
    // Initialize new properties
    this.detailedInfo,
    this.financials,
    this.tests,
    this.milestones,
     this.email = '',  // Add this
    this.phone = '',  // Add this
    this.address = '', // Add this
  });
   
}
class PortfolioInvestment {
  final String id;
  final String companyName;
  final String sector;
  final String logo;
  final Color color;
  final int shares;
  final double purchasePrice;
  final double currentPrice;
  final DateTime purchaseDate;
  final double performance;
  final bool isActive;
  final String imagePath;

  PortfolioInvestment({
    required this.id,
    required this.companyName,
    required this.sector,
    required this.logo,
    required this.color,
    required this.shares,
    required this.purchasePrice,
    required this.currentPrice,
    required this.purchaseDate,
    required this.performance,
    required this.isActive,
    this.imagePath = '',
  });
}

enum TransactionType { buy, sell, dividend }

enum TransactionStatus { pending, completed, cancelled }

class Transaction {
  final String id;
  final TransactionType type;
  final String companyName;
  final double amount;
  final DateTime date;
  final TransactionStatus status;
  final int shares;
  final double pricePerShare;
  final String imagePath;

  Transaction({
    required this.id,
    required this.type,
    required this.companyName,
    required this.amount,
    required this.date,
    required this.status,
    required this.shares,
    required this.pricePerShare,
    this.imagePath = '',
  });
  
}
