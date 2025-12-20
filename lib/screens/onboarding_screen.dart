import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/onboarding_page.dart';
import 'TypeSelectionLoginScreen.dart';

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

  void _skipOnboarding() {
    print('⏭️ Skipping onboarding');
    _saveAndNavigate();
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
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PopupMenuButton<String>(
                      onSelected: (value) {
                        print("🌐 Language selected: $value");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Language",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "en",
                          child: Row(
                            children: [
                              Text("🇺🇸  "),
                              SizedBox(width: 8),
                              Text("English"),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: "fr",
                          child: Row(
                            children: [
                              Text("🇫🇷  "),
                              SizedBox(width: 8),
                              Text("Français"),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: "ar",
                          child: Row(
                            children: [
                              Text("🇩🇿  "),
                              SizedBox(width: 8),
                              Text("العربية"),
                            ],
                          ),
                        ),
                      ],
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
                  children: const [
                    OnboardingPage(
                      image: 'assets/images/imag2.1.png',
                      title: 'Découvrez ComVest',
                      subtitle:
                          'La plateforme qui met en relation les startups, les fondateurs et les investisseurs',
                    ),
                    OnboardingPage(
                      image: 'assets/images/visibilite (1).png',
                      title: 'Besoin de visibilité ?',
                      subtitle:
                          'Notre service marketing augmentera votre visibilité',
                    ),
                    OnboardingPage(
                      image: 'assets/images/collaborez.png',
                      title: 'Établissez des relations solides',
                      subtitle:
                          'Collaborez avec des entrepreneurs et élargissez votre réseau',
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
                    if (!isLastPage)
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
                      )
                    else
                      const SizedBox(height: 8),

                    const SizedBox(height: 30),

                    // Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Skip Button
                        if (!isLastPage)
                          TextButton(
                            onPressed: _skipOnboarding,
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          )
                        else
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
                                ? _skipOnboarding
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
                              isLastPage ? 'Get Started' : 'Next',
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