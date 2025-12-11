import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/onboarding_page.dart';
import './TypeSelectionScreen_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  // Function to skip everything and go to TypeSelectionScreen
  void _skipOnboarding() {
    print('⏩ Skipping onboarding - Going to Type Selection');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const TypeSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Single background image for all 3 slides
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay for better text readability
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Page content
          Container(
            padding: const EdgeInsets.only(bottom: 100),
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
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

          Positioned(
            top: 40,
            left: 20,
            child: PopupMenuButton<String>(
              onSelected: (value) {
                print("Selected: $value");
              },
              child: Container(
                padding: const EdgeInsets.all(6),
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

          // Floating bottom buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Page Indicator (only show when not on last page)
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Skip Button - ONLY SHOW ON PAGES 1 & 2, NOT ON LAST PAGE
                      if (!isLastPage) // <-- This condition hides Skip on last page
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
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      else
                        // Empty container or Spacer to push Get Started button to center
                        const Spacer(), // <-- This takes the space where Skip was

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
                              ? _skipOnboarding // On last page, Get Started goes to next screen
                              : () => _controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  ),
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
                      // Language change button
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
