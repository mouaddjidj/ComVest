import 'dart:math' as math; // Import math library

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoRotation;
  late Animation<double> _logoScale;
  late Animation<double> _nameOpacity;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // FIXED: Using math.pi for rotation
    _logoRotation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _logoScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 1.2), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _nameOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeInOut),
      ),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background particles (optional - simpler version)
          Positioned.fill(
            child: CustomPaint(
              painter: ParticlePainter(controller: _controller),
            ),
          ),
          
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with rotation and scale
                    Transform.rotate(
                      angle: _logoRotation.value,
                      child: Transform.scale(
                        scale: _logoScale.value,
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3 * _glowAnimation.value),
                                blurRadius: 30,
                                spreadRadius: 10,
                              ),
                            ],
                            gradient: const RadialGradient(
                              center: Alignment.center,
                              radius: 0.8,
                              colors: [
                                Color(0xFFBBDEFB),
                                Color(0xFFC5CAE9),
                              ],
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.business,
                                  size: 60,
                                  color: Colors.indigo.shade800,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // App name with fade
                    Opacity(
                      opacity: _nameOpacity.value,
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                colors: [
                                  Colors.blue.shade800,
                                  Colors.indigo.shade900,
                                ],
                              ).createShader(bounds);
                            },
                            child: Text(
                              'COMVEST',
                              style: GoogleFonts.poppins(
                                fontSize: 52,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 2.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 180,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.indigo.shade400,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Tagline
                    Opacity(
                      opacity: _nameOpacity.value,
                      child: Text(
                        'Invest in Innovation • Grow Together',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 50),
                    
                    // Loading indicator
                    Opacity(
                      opacity: _nameOpacity.value,
                      child: const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF3949AB),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final AnimationController controller;
  
  ParticlePainter({required this.controller}) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade50.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    // Draw floating particles
    for (int i = 0; i < 10; i++) {
      final offsetX = size.width * 0.1 + (size.width * 0.8) * (i / 10);
      // FIXED: Using math.sin with proper type
      final offsetY = size.height * 0.3 + 
          size.height * 0.4 * 
          (0.5 + 0.5 * math.sin(controller.value * 2 * math.pi + i * 0.5));
      
      // FIXED: Using math.sin for radius calculation
      final radius = 2 + 3 * (0.5 + 0.5 * math.sin(controller.value * 2 * math.pi + i.toDouble()));
      
      canvas.drawCircle(
        Offset(offsetX, offsetY),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}