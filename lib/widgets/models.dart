// Model Classes
import 'dart:ui';

class Investor {
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