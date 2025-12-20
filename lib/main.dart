import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'l10n/app_localizations.dart';  // CHANGED THIS LINE
import 'services/language_service.dart';  // CHANGED THIS LINE
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load saved language
  final savedLocale = await LanguageService.getSavedLanguage();
  
  runApp(MyApp(savedLocale: savedLocale));
}

class MyApp extends StatefulWidget {
  final Locale savedLocale;
  
  const MyApp({super.key, required this.savedLocale});
  
  @override
  State<MyApp> createState() => _MyAppState();
  
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('fr', 'FR');
  
  @override
  void initState() {
    super.initState();
    _locale = widget.savedLocale;
  }
  
  // Method to change language
  void changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
    
    // Save language preference
    LanguageService.saveLanguage(newLocale.languageCode);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'ComVest',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      locale: _locale,
      supportedLocales: LanguageService.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}