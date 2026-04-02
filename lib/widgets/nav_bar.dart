import 'package:flutter/material.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huzaifa_dev/core/scroll_provider.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollService = ref.watch(scrollProvider);

    return Container(
      height: 68,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF050816).withValues(alpha: 0.6),
        border: const Border(
          bottom: BorderSide(color: Colors.white10),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo (Home)
              GestureDetector(
                onTap: () => scrollService.scrollToSection(scrollService.heroKey),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.code, size: 24, color: Colors.blueAccent),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PORTFOLIO',
                            style: GoogleFonts.outfit(
                              fontSize: 11,
                              letterSpacing: 2,
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'huzaifa.dev',
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Nav Items (Desktop only)
              if (ResponsiveLayout.isDesktop(context) || ResponsiveLayout.isTablet(context))
                Row(
                  children: [
                    _NavItem(title: 'Work', onTap: () => scrollService.scrollToSection(scrollService.workKey)),
                    _NavItem(title: 'Skills', onTap: () => scrollService.scrollToSection(scrollService.skillsKey)),
                    _NavItem(title: 'Experience', onTap: () => scrollService.scrollToSection(scrollService.experienceKey)),
                    _NavItem(title: 'Contact', onTap: () => scrollService.scrollToSection(scrollService.contactKey)),
                    const SizedBox(width: 8),
                    _hireMeButton(() => scrollService.scrollToSection(scrollService.contactKey)),
                  ],
                ),
                
              if (ResponsiveLayout.isMobile(context))
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hireMeButton(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hire me',
              style: GoogleFonts.outfit(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_outward, size: 14, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  color: _isHovered ? Colors.white : Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _isHovered ? 20 : 0,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    if (_isHovered)
                      BoxShadow(color: Colors.cyanAccent.withValues(alpha: 0.5), blurRadius: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
