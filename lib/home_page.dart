import 'package:flutter/material.dart';
import 'package:huzaifa_dev/widgets/background_orbs.dart';
import 'package:huzaifa_dev/widgets/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huzaifa_dev/sections/hero_section.dart';
import 'package:huzaifa_dev/sections/work_section.dart';
import 'package:huzaifa_dev/sections/skills_section.dart';
import 'package:huzaifa_dev/sections/experience_section.dart';
import 'package:huzaifa_dev/sections/contact_section.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huzaifa_dev/core/scroll_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollService = ref.watch(scrollProvider);

    return Scaffold(
      drawer: _buildDrawer(context, scrollService),
      body: Stack(
        children: [
          // Background Animation
          const BackgroundOrbs(),
          
          // Main Content
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                key: scrollService.heroKey,
                child: const HeroSection(),
              ),
              SliverToBoxAdapter(
                key: scrollService.workKey,
                child: const WorkSection(),
              ),
              SliverToBoxAdapter(
                key: scrollService.skillsKey,
                child: const SkillsSection(),
              ),
              SliverToBoxAdapter(
                key: scrollService.experienceKey,
                child: const ExperienceSection(),
              ),
              SliverToBoxAdapter(
                key: scrollService.contactKey,
                child: const ContactSection(),
              ),
            ],
          ),
          
          // Sticky NavBar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, ScrollService scrollService) {
    return Drawer(
      backgroundColor: const Color(0xFF050816),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white10)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/logo.png', width: 48, height: 48),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'huzaifa.dev',
                    style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          _drawerItem(context, 'Home', Icons.home_outlined, () => scrollService.scrollToSection(scrollService.heroKey)),
          _drawerItem(context, 'Work', Icons.work_outline, () => scrollService.scrollToSection(scrollService.workKey)),
          _drawerItem(context, 'Skills', Icons.code_outlined, () => scrollService.scrollToSection(scrollService.skillsKey)),
          _drawerItem(context, 'Experience', Icons.history_edu_outlined, () => scrollService.scrollToSection(scrollService.experienceKey)),
          _drawerItem(context, 'Contact', Icons.mail_outline, () => scrollService.scrollToSection(scrollService.contactKey)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              '© 2026 Huzaifa Ejaz',
              style: GoogleFonts.outfit(color: Colors.white24, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70, size: 20),
      title: Text(
        title,
        style: GoogleFonts.outfit(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
