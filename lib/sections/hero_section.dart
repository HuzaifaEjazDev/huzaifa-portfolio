import 'package:flutter/material.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 60 : 100,
        ),
        child: ResponsiveLayout(
          mobile: Column(
            children: [
              _buildContent(context, isMobile: true),
              const SizedBox(height: 60),
              _buildVisuals(context, isMobile: true),
            ],
          ),
          tablet: Row(
            children: [
              Expanded(child: _buildContent(context)),
              Expanded(child: _buildVisuals(context)),
            ],
          ),
          desktop: Row(
            children: [
              Expanded(child: _buildContent(context)),
              Expanded(child: _buildVisuals(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {bool isMobile = false}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Availability Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              ).animate(onPlay: (c) => c.repeat())
               .scale(begin: const Offset(1, 1), end: const Offset(1.5, 1.5))
               .fadeOut(),
              const SizedBox(width: 8),
              Text(
                'Available for work',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
        
        const SizedBox(height: 32),
        
        // LARGE NAME headLine
        Text(
          'HUZAIFA EJAZ\nKAHLON',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 50 : 80,
            fontWeight: FontWeight.w900,
            height: 0.95,
            letterSpacing: -2,
            color: Colors.white,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideX(begin: -0.1),
        
        const SizedBox(height: 24),
        
        Text(
          'Building beautiful, functional, and scalable\napplications with Flutter 💙',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 18 : 22,
            color: Colors.white.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
        
        const SizedBox(height: 48),
        
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('View My Work', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                side: const BorderSide(color: Colors.white24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Contact Me'),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.1),
      ],
    );
  }

  Widget _buildVisuals(BuildContext context, {bool isMobile = false}) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Decorative Orbs behind the phone
          Container(
            width: isMobile ? 250 : 350,
            height: isMobile ? 250 : 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.blueAccent.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ).animate(onPlay: (c) => c.repeat())
           .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 4.seconds, curve: Curves.easeInOut),
          
          // Phone Frame Mockup
          Container(
            width: isMobile ? 200 : 280,
            height: isMobile ? 400 : 560,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0F1F),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white10, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: const Color(0xFF050816),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      width: 60,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Spacer(),
                    // Fake App UI
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 80, height: 10, decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(5))),
                          const SizedBox(height: 10),
                          Container(width: 140, height: 10, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(5))),
                          const SizedBox(height: 6),
                          Container(width: 120, height: 10, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(5))),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), shape: BoxShape.circle)),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(width: 60, height: 8, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(4))),
                                  const SizedBox(height: 4),
                                  Container(width: 40, height: 6, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(3))),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ).animate().fadeIn(delay: 800.ms, duration: 1000.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }
}
