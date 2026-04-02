import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:huzaifa_dev/widgets/hover_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skillGroups = [
      { "cat": "Core", "items": ["Dart", "Flutter", "Java", "Android SDK"], "color": Colors.blueAccent },
      { "cat": "State", "items": ["Riverpod", "Provider", "Clean Architecture", "MVVM"], "color": Colors.purpleAccent },
      { "cat": "Backend", "items": ["Firebase", "Firestore", "REST APIs", "Gemini AI"], "color": Colors.orangeAccent },
      { "cat": "Data", "items": ["SQLite", "Sqflite", "Offline-First", "SharedPrefs"], "color": Colors.greenAccent },
      { "cat": "Tooling", "items": ["CI/CD", "Play Console", "ASO", "GitHub"], "color": Colors.pinkAccent },
    ];

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Technical Skills',
              style: GoogleFonts.outfit(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn().slideX(begin: -0.2),
            const SizedBox(height: 48),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: skillGroups.asMap().entries.map((entry) {
                final int idx = entry.key;
                final group = entry.value;
                return _skillGroup(
                  group['cat'] as String,
                  group['items'] as List<String>,
                  group['color'] as Color,
                ).animate().fadeIn(delay: (200 * idx).ms).slideY(begin: 0.1);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillGroup(String category, List<String> items, Color accentColor) {
    return HoverContainer(
      translateY: true,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: accentColor,
              ),
            ),
            const SizedBox(height: 16),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item,
                style: const TextStyle(fontSize: 13, color: Colors.white70),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
