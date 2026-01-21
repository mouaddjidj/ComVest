import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/onboarding_page.dart';
import 'TypeSelectionLoginScreen.dart';
import '../services/language_service.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    print('✅ OnboardingScreen initialized');
  }

  Future<void> _saveAndNavigate() async {
    print('💾 Saving onboarding completion...');
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_completed', true);
      print('✅ Onboarding saved successfully');
      
      if (!mounted) return;
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const TypeSelectionScreen(),
        ),
      );
      print('🚀 Navigated to TypeSelectionScreen');
    } catch (e) {
      print('❌ Error saving onboarding: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('🔄 Building OnboardingScreen UI');
    
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          // Main Content
          Column(
            children: [
              // Language Button
              SafeArea(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PopupMenuButton<Locale>(
                      onSelected: (Locale newLocale) {
                        print("🌐 Language selected: ${newLocale.languageCode}");
                        MyApp.of(context)?.changeLanguage(newLocale);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              LanguageService.getLanguageFlag(
                                Localizations.localeOf(context).languageCode,
                              ),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppLocalizations.of(context)!.language,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down, color: Colors.white),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => LanguageService.supportedLocales.map((locale) {
                        return PopupMenuItem<Locale>(
                          value: locale,
                          child: Row(
                            children: [
                              Text(
                                LanguageService.getLanguageFlag(locale.languageCode),
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                LanguageService.getLanguageName(locale.languageCode),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              // PageView Content
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    print('📄 Page changed to: $index');
                    setState(() => isLastPage = index == 2);
                  },
                  children: [
                    // First page with text + logo in one line
                    OnboardingPage(
                      image: 'assets/images/imag2.1.png',
                      titleKey: 'discover',
                      subtitle: AppLocalizations.of(context)!.discoverDescription,
                      showComvestLogo: true, // This triggers the combined text+logo
                    ),
                    // Second page
                    OnboardingPage(
                      image: 'assets/images/visibilite (1).png',
                      titleKey: 'needVisibility',
                      subtitle: AppLocalizations.of(context)!.visibilityDescription,
                      showComvestLogo: false,
                    ),
                    // Third page
                    OnboardingPage(
                      image: 'assets/images/collaborez.png',
                      titleKey: 'buildRelationships',
                      subtitle: AppLocalizations.of(context)!.relationshipsDescription,
                      showComvestLogo: false,
                    ),
                  ],
                ),
              ),

              // Bottom Navigation
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 40,
                  top: 20,
                ),
                child: Column(
                  children: [
                    // Page Indicator
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        dotColor: Colors.white30,
                        activeDotColor: Colors.white,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 8,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        
                        // Next/Get Started Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.white, Color(0xFFE8E8E8)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: isLastPage
                                ? _saveAndNavigate
                                : () {
                                    print('➡️ Next button pressed');
                                    _controller.nextPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 35,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              isLastPage 
                                ? AppLocalizations.of(context)!.getStarted 
                                : AppLocalizations.of(context)!.next,
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
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
        ],
      ),
    );
  }
}