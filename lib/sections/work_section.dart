import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:huzaifa_dev/models/project.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huzaifa_dev/widgets/hover_container.dart';
import 'package:flutter_animate/flutter_animate.dart';

final activeProjectProvider = StateProvider<int>((ref) => 0);

class WorkSection extends ConsumerWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeProjectIndex = ref.watch(activeProjectProvider);
    final projects = projectsData;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECTED WORK',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.white54,
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                    const SizedBox(height: 8),
                    Text(
                      'Built with Flutter 💙',
                      style: GoogleFonts.outfit(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(begin: -0.1),
                  ],
                ),
                if (ResponsiveLayout.isDesktop(context))
                  Row(
                    children: [
                      const _TechBadge(label: 'Clean Architecture'),
                      const SizedBox(width: 8),
                      const Text('•', style: TextStyle(color: Colors.white24)),
                      const SizedBox(width: 8),
                      const _TechBadge(label: 'Riverpod'),
                      const SizedBox(width: 8),
                      const Text('•', style: TextStyle(color: Colors.white24)),
                      const SizedBox(width: 8),
                      const _TechBadge(label: 'Firebase'),
                    ],
                  ).animate().fadeIn(delay: 400.ms),
              ],
            ),
            const SizedBox(height: 48),

            // Bento Grid using Custom Layout
            ResponsiveLayout(
              mobile: _mobileLayout(ref, projects, activeProjectIndex),
              tablet: _desktopLayout(ref, projects, activeProjectIndex),
              desktop: _desktopLayout(ref, projects, activeProjectIndex),
            ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.05),
          ],
        ),
      ),
    );
  }

  Widget _desktopLayout(WidgetRef ref, List<Project> projects, int activeIndex) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 8,
              child: _projectCard(ref, projects[0], index: 0, height: 380, isFeatured: true),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: _projectCard(ref, projects[1], index: 1, height: 380),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: _projectCard(ref, projects[2], index: 2, height: 320),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 8,
              child: _codePreview(projects[activeIndex], height: 320),
            ),
          ],
        ),
      ],
    );
  }

  Widget _mobileLayout(WidgetRef ref, List<Project> projects, int activeIndex) {
    return Column(
      children: [
        _projectCard(ref, projects[0], index: 0, height: 400, isFeatured: true),
        const SizedBox(height: 16),
        _projectCard(ref, projects[1], index: 1, height: 260),
        const SizedBox(height: 16),
        _projectCard(ref, projects[2], index: 2, height: 260),
        const SizedBox(height: 16),
        _codePreview(projects[activeIndex], height: 300),
      ],
    );
  }

  Widget _projectCard(WidgetRef ref, Project project, {required int index, double? height, bool isFeatured = false}) {
    final bool isActive = ref.watch(activeProjectProvider) == index;
    
    return HoverContainer(
      onTap: () => ref.read(activeProjectProvider.notifier).state = index,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isActive ? project.gradientColors[0].withValues(alpha: 0.5) : Colors.white10,
            width: isActive ? 2 : 1,
          ),
          gradient: LinearGradient(
            colors: [
              isActive ? project.gradientColors[0].withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.07),
              Colors.white.withValues(alpha: 0.02),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -40,
              bottom: -40,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: isActive ? 0.3 : 0.1,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: project.gradientColors[0],
                  ),
                ),
              ).animate(onPlay: (controller) => controller.repeat(reverse: true))
               .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 3.seconds),
            ),
            
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: project.gradientColors),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          project.tag,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Text(
                        project.stat,
                        style: const TextStyle(fontSize: 10, color: Colors.white54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    project.name,
                    style: GoogleFonts.outfit(
                      fontSize: isFeatured ? 32 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                      height: 1.6,
                      overflow: isFeatured ? TextOverflow.visible : TextOverflow.ellipsis,
                    ),
                    maxLines: isFeatured ? 4 : 3,
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.tech.map((t) => _techChip(t)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _techChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, color: Colors.white70),
      ),
    );
  }

  Widget _codePreview(Project project, {double? height}) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0F1F).withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Active project • Dart', style: TextStyle(fontSize: 10, color: Colors.white54)),
              Text(project.name, style: const TextStyle(fontSize: 10, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                project.code,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.7,
                  color: Colors.white.withValues(alpha: 0.85),
                  fontFamily: 'monospace',
                ),
              ).animate(key: ValueKey(project.name)).fadeIn().slideY(begin: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  final String label;
  const _TechBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12));
  }
}
