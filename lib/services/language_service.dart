import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageKey = 'app_language';
  
  // Available languages
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('ar', 'DZ'),
  ];
  
  // Language names for display
  static const Map<String, String> languageNames = {
    'en': 'English',
    'fr': 'Français',
    'ar': 'العربية',
  };
  
  // Language flags
  static const Map<String, String> languageFlags = {
    'en': '🇺🇸',
    'fr': '🇫🇷',
    'ar': '🇩🇿',
  };
  
  // Get saved language
  static Future<Locale> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'fr'; // Default to French
    
    // Find matching locale
    for (var locale in supportedLocales) {
      if (locale.languageCode == languageCode) {
        return locale;
      }
    }
    
    // Return default if not found
    return const Locale('fr', 'FR');
  }
  
  // Save language preference
  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }
  
  // Get current language name
  static String getLanguageName(String languageCode) {
    return languageNames[languageCode] ?? 'Français';
  }
  
  // Get current language flag
  static String getLanguageFlag(String languageCode) {
    return languageFlags[languageCode] ?? '🇫🇷';
  }
}