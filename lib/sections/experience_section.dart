import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experience',
              style: GoogleFonts.outfit(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn().slideX(begin: -0.2),
            const SizedBox(height: 48),
            
            _timelineItem(
              context,
              period: 'Aug 2025 – Present',
              title: 'Flutter Developer — Techroz Solutions',
              description: 'Designed & deployed 10+ production Flutter apps using Clean Architecture, Riverpod, Firebase & REST. Built offline-first with SQLite, integrated Gemini & STT, optimized responsiveness by 30%.',
              points: [
                'Full-cycle Play Store deployments, CI/CD, versioning, ASO',
                'Pagination, memory management, efficient state',
                'AI workflows, third-party REST integrations',
              ],
              isLast: false,
              primaryColor: Colors.tealAccent,
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
            
            _timelineItem(
              context,
              period: 'Mar 2025 – Jun 2025',
              title: 'Flutter Intern — Dev Valley (NAVTTC)',
              description: 'Intensive training in Flutter mobile development, state management (Provider/Riverpod), and UI/UX implementation. Contributed to 3+ internship projects.',
              points: [
                'Mastered Dart & Flutter core concepts',
                'Worked with RESTful APIs & JSON serialization',
                'Collaborated in Agile sprints',
              ],
              isLast: true,
              primaryColor: Colors.blueAccent,
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
          ],
        ),
      ),
    );
  }

  Widget _timelineItem(
    BuildContext context, {
    required String period,
    required String title,
    required String description,
    required List<String> points,
    required bool isLast,
    required Color primaryColor,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Line and dot
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white10,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          // Right side: Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: primaryColor.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                ...points.map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(color: Colors.white38)),
                          Expanded(
                            child: Text(
                              p,
                              style: const TextStyle(fontSize: 13, color: Colors.white60),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
