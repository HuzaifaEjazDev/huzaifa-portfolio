import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:huzaifa_dev/models/project.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huzaifa_dev/widgets/hover_container.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final activeProjectProvider = StateProvider<int>((ref) => 0);

class WorkSection extends ConsumerWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = projectsData;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
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
                      'PORTFOLIO',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.white38,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                    const SizedBox(height: 12),
                    Text(
                      'Selected Projects',
                      style: GoogleFonts.outfit(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                      ),
                    ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(begin: -0.1),
                  ],
                ),
                if (ResponsiveLayout.isDesktop(context))
                  Text(
                    'Built with Clean Architecture &\nAdvanced Flutter State Management',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.outfit(
                      color: Colors.white24,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ).animate().fadeIn(delay: 400.ms),
              ],
            ),
            const SizedBox(height: 64),

            ResponsiveLayout(
              mobile: _mobileLayout(ref, projects),
              tablet: _desktopLayout(ref, projects),
              desktop: _desktopLayout(ref, projects),
            ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.05),
          ],
        ),
      ),
    );
  }

  Widget _desktopLayout(WidgetRef ref, List<Project> projects) {
    return Column(
      children: [
        // Map projects into alternating 7/5 or 5/7 rows for that bento feel
        ...List.generate((projects.length / 2).ceil(), (rowIndex) {
          final int firstIndex = rowIndex * 2;
          final int secondIndex = rowIndex * 2 + 1;
          final bool isEvenRow = rowIndex % 2 == 0;

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: isEvenRow ? 7 : 5,
                    child: _projectCard(ref, projects[firstIndex], index: firstIndex, isFeatured: rowIndex == 0),
                  ),
                  if (secondIndex < projects.length) ...[
                    const SizedBox(width: 20),
                    Expanded(
                      flex: isEvenRow ? 5 : 7,
                      child: _projectCard(ref, projects[secondIndex], index: secondIndex),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 20),
        // Technical Card linked to the current active project
        _technicalCard(projects[ref.watch(activeProjectProvider)], height: 380),
      ],
    );
  }

  Widget _mobileLayout(WidgetRef ref, List<Project> projects) {
    return Column(
      children: [
        ...projects.asMap().entries.map((entry) {
          final int index = entry.key;
          final Project project = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _projectCard(ref, project, index: index, isFeatured: index == 0),
          );
        }),
        const SizedBox(height: 20),
        _technicalCard(projects[ref.watch(activeProjectProvider)], height: 320),
      ],
    );
  }

  Widget _projectCard(WidgetRef ref, Project project, {required int index, bool isFeatured = false}) {
    final bool isActive = ref.watch(activeProjectProvider) == index;
    final bool hasImages = project.images != null && project.images!.isNotEmpty;
    
    return HoverContainer(
      translateY: true,
      onTap: () => ref.read(activeProjectProvider.notifier).state = index,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        constraints: BoxConstraints(
          minHeight: hasImages ? 400 : 0,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isActive ? project.gradientColors[0].withValues(alpha: 0.5) : Colors.white10,
            width: isActive ? 2 : 1,
          ),
          color: const Color(0xFF0A0F1F).withValues(alpha: 0.4),
        ),
        child: Stack(
          children: [
            // Background Carousel Support
            if (hasImages)
              Positioned.fill(
                child: _ProjectCarousel(images: project.images!),
              ),
            
            // Vignette Gradient Overlay (Always shown, especially for readability with images)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: hasImages ? 0.8 : 0.4),
                      Colors.black.withValues(alpha: hasImages ? 0.95 : 0.8),
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Decorative Corner Circle (Fallback for projects without images)
            if (!hasImages)
              Positioned(
                right: -40,
                bottom: -40,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        project.gradientColors[0].withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _tagBadge(project.tag, project.gradientColors),
                      Text(
                        project.stat,
                        style: GoogleFonts.outfit(fontSize: 12, color: Colors.white24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    project.name,
                    style: GoogleFonts.outfit(
                      fontSize: isFeatured ? 36 : 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.description,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.6,
                    ),
                    maxLines: isFeatured ? 4 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.tech.take(isFeatured ? 4 : 2).map((t) => _miniTechChip(t)).toList(),
                        ),
                      ),
                      _buildLinksRow(project),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinksRow(Project project) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (project.githubUrl != null) _linkIcon(FontAwesomeIcons.github, project.githubUrl!),
        if (project.playStoreUrl != null) _linkIcon(FontAwesomeIcons.googlePlay, project.playStoreUrl!),
        if (project.appStoreUrl != null) _linkIcon(FontAwesomeIcons.apple, project.appStoreUrl!),
        if (project.webUrl != null) _linkIcon(FontAwesomeIcons.globe, project.webUrl!),
      ],
    );
  }

  Widget _linkIcon(dynamic icon, String url) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white10),
          ),
          child: FaIcon(icon, size: 14, color: Colors.white70),
        ),
      ),
    );
  }

  Widget _tagBadge(String label, List<Color> colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _miniTechChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, color: Colors.white54, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _technicalCard(Project project, {double? height}) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1121),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, size: 16, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Text(
                'Technical Insight: ${project.name}',
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.white38, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                project.code,
                style: GoogleFonts.firaCode(
                  fontSize: 13,
                  height: 1.8,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ).animate(key: ValueKey(project.name)).fadeIn().slideX(begin: 0.05),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 12, color: Colors.white24),
              const SizedBox(width: 8),
              Text(
                'Proprietary implementation details',
                style: GoogleFonts.outfit(fontSize: 10, color: Colors.white24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectCarousel extends StatefulWidget {
  final List<String> images;
  const _ProjectCarousel({required this.images});

  @override
  State<_ProjectCarousel> createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<_ProjectCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    if (widget.images.length > 1) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_isHovered) {
        if (_currentPage < widget.images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              final img = widget.images[index];
              final imageProvider = img.startsWith('http') ? NetworkImage(img) : AssetImage(img) as ImageProvider;

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Layer 1: Blurred Background (Fills the card)
                  ImageFiltered(
                    imageFilter: ui.ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const SizedBox(),
                    ),
                  ),
                  // Layer 2: Subtle Dark Overlay for background focus
                  Container(color: Colors.black.withValues(alpha: 0.2)),
                  // Layer 3: Clear Foreground (Shows full screen)
                  Image(
                    image: imageProvider,
                    fit: BoxFit.contain,
                    errorBuilder: (c, e, s) => const SizedBox(),
                  ).animate().fadeIn(duration: 400.ms),
                ],
              );
            },
          ),
          
          // Navigation Arrows
          if (widget.images.length > 1) ...[
            Positioned(
              left: 12,
              top: 0,
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isHovered ? 1.0 : 0.0,
                child: IconButton(
                  icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                  onPressed: () {
                    _controller.previousPage(duration: 500.ms, curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 0,
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isHovered ? 1.0 : 0.0,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.white, size: 28),
                  onPressed: () {
                    _controller.nextPage(duration: 500.ms, curve: Curves.easeInOut);
                  },
                ),
              ),
            ),
          ],
          
          // Indicators
          if (widget.images.length > 1)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentPage == index ? 24 : 8,
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.white : Colors.white24,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
