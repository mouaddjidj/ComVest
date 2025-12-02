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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: const [
            OnboardingPage(
              color: Color.fromARGB(255, 137, 0, 242),
              image: 'assets/images/imag2.1.png',
              title: 'Discover ComVest ',
              subtitle:
                  'The platform that connects startups, founders, and investors ',
            ),
            OnboardingPage(
              color: Color.fromARGB(255, 137, 0, 242),
              image: 'assets/images/visibilite (1).png',
              title: 'Need visibility ?',
              subtitle: 'Our marketing service will boost your reach',

            ),
            OnboardingPage(
              color: Color.fromARGB(255, 137, 0, 242),
              image: 'assets/images/collaborez.png',
              title: 'Build Powerful Connections',
              subtitle:
                  'Collaborate with entrepreneurs and expand your network',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.indigo,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                print('🎯 Get Started Pressed - Going to Type Selection');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const TypeSelectionScreen()),
                );
              },
            )
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Skip'),
                    onPressed: () => _controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        dotColor: Colors.black26,
                        activeDotColor: Colors.indigo,
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text('Next'),
                    onPressed: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
