import 'package:flutter/material.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huzaifa_dev/core/scroll_provider.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    final scrollService = ref.watch(scrollProvider);

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
              _buildContent(context, scrollService, isMobile: true),
              const SizedBox(height: 80),
              _buildVisuals(context, isMobile: true),
            ],
          ),
          tablet: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _buildContent(context, scrollService)),
              Expanded(flex: 2, child: _buildVisuals(context)),
            ],
          ),
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _buildContent(context, scrollService)),
              Expanded(flex: 2, child: _buildVisuals(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ScrollService scrollService, {bool isMobile = false}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Availability Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF0A0F1F),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ).animate(onPlay: (c) => c.repeat())
               .scale(begin: const Offset(1, 1), end: const Offset(1.5, 1.5))
               .fadeOut(),
              const SizedBox(width: 10),
              Text(
                'Available for Flutter projects — Gujranwala, Pakistan',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
        
        const SizedBox(height: 48),
        
        // LARGE NAME headLine
        Text(
          'HUZAIFA\nEJAZ KAHLON',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 56 : 94,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -3,
            color: Colors.white,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideX(begin: -0.1),
        
        const SizedBox(height: 32),

        // Tagline Row
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 12,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF0E7490), Color(0xFF0891B2)]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.flash_on, size: 16, color: Colors.white),
                  const SizedBox(width: 6),
                  Text(
                    'Flutter Developer',
                    style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                'Android & Cross-Platform • 10+ production apps',
                style: GoogleFonts.outfit(fontSize: 16, color: Colors.white60, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 300.ms, duration: 800.ms),
        
        const SizedBox(height: 40),
        
        Text(
          'I build production-grade Flutter apps with Clean Architecture, Riverpod, and Firebase. I love offline-first systems, AI integrations (Gemini, STT), and shipping fast to Play Store with CI/CD and ASO. Performance wins: ~30% faster responsiveness through smart state management and pagination.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 16 : 19,
            color: Colors.white70,
            height: 1.7,
            fontWeight: FontWeight.w400,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
        
        const SizedBox(height: 56),
        
        // Buttons
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => scrollService.scrollToSection(scrollService.workKey),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('View Projects', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                backgroundColor: Colors.white.withValues(alpha: 0.05),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.phone_outlined, size: 20, color: Colors.white70),
                  const SizedBox(width: 10),
                  Text('+92 325 0019905', style: GoogleFonts.outfit(color: Colors.white70, fontSize: 16)),
                ],
              ),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.1),

        const SizedBox(height: 64),

        // Stats Row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              _statCard('APPS SHIPPED', '10+'),
              const SizedBox(width: 20),
              _statCard('PERF GAIN', '30%'),
              const SizedBox(width: 20),
              _statCard('API COST CUT', '20%'),
            ],
          ),
        ).animate().fadeIn(delay: 800.ms, duration: 800.ms),
      ],
    );
  }

  Widget _statCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.outfit(fontSize: 11, letterSpacing: 1.5, color: Colors.white38, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildVisuals(BuildContext context, {bool isMobile = false}) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Floating Badges
          Positioned(
            top: -20,
            left: -40,
            child: _floatingBadge('Riverpod • StateNotifier').animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(begin: 0, end: -10, duration: 2.seconds, curve: Curves.easeInOut),
          ),
          Positioned(
            bottom: -20,
            right: -40,
            child: _floatingBadge('SQLite • Offline-first').animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(begin: 0, end: 10, duration: 2.5.seconds, curve: Curves.easeInOut),
          ),

          // Phone Mockup
          Container(
            width: isMobile ? 260 : 320,
            height: isMobile ? 520 : 640,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF030712), // Deep dark frame
              borderRadius: BorderRadius.circular(44),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withValues(alpha: 0.1),
                  blurRadius: 100,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: Container(
                color: const Color(0xFF020617),
                child: _buildPhoneInterior(),
              ),
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 1000.ms).scale(begin: const Offset(0.9, 0.9)),
        ],
      ),
    );
  }

  Widget _floatingBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Text(
        text,
        style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildPhoneInterior() {
    return Column(
      children: [
        // Phone Header
        Container(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('feynlearn.app', style: GoogleFonts.outfit(fontSize: 10, color: Colors.white38)),
                  Text('FeynLearn', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const Icon(Icons.more_horiz, color: Colors.white38),
            ],
          ),
        ),

        // AI Summary Card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AI Summary', style: GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white38)),
              const SizedBox(height: 8),
              Text(
                'PDF → structured notes with Gemini. Cached locally for offline study.',
                style: GoogleFonts.outfit(fontSize: 13, color: Colors.white70, height: 1.4),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  _miniTag('Riverpod'),
                  _miniTag('Clean Arch'),
                  _miniTag('Firebase'),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Code Editor View
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Column(
              children: [
                // MacOS Title Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E293B),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      _dot(Colors.redAccent),
                      const SizedBox(width: 4),
                      _dot(Colors.amberAccent),
                      const SizedBox(width: 4),
                      _dot(Colors.greenAccent),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'lib/features/study/provider.dart',
                          style: GoogleFonts.firaCode(fontSize: 8, color: Colors.white38),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Code Snippet
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              'final studyProvider =\n  StateNotifierProvider<StudyCtrl, AsyncValue<Study>>((ref) {\n    final repo = ref.watch(studyRepoProvider);\n    return StudyCtrl(repo)..init();\n});\n\nclass StudyCtrl extends StateNotifier<AsyncValue<Study>> {\n  StudyCtrl(this._repo): super(const AsyncLoading());\n  final StudyRepo _repo;\n\n  Future<void> init() async {\n    state = await AsyncValue.guard(() => _repo.load());\n  }\n}',
                              style: GoogleFonts.firaCode(fontSize: 10, color: Colors.white70, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom Stats Row
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _phoneStat('Offline', '100%'),
              _phoneStat('Sync', 'Realtime'),
              _phoneStat('Fast', '30%'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _miniTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: GoogleFonts.outfit(fontSize: 10, color: Colors.white54)),
    );
  }

  Widget _dot(Color color) {
    return Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }

  Widget _phoneStat(String label, String value) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.outfit(fontSize: 10, color: Colors.white24)),
        Text(value, style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white70)),
      ],
    );
  }
}
