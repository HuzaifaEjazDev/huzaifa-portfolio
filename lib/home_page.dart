import 'package:flutter/material.dart';
import 'package:huzaifa_dev/widgets/background_orbs.dart';
import 'package:huzaifa_dev/widgets/nav_bar.dart';
import 'package:huzaifa_dev/sections/hero_section.dart';
import 'package:huzaifa_dev/sections/work_section.dart';
import 'package:huzaifa_dev/sections/skills_section.dart';
import 'package:huzaifa_dev/sections/experience_section.dart';
import 'package:huzaifa_dev/sections/contact_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Animation
          const BackgroundOrbs(),
          
          // Main Content
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeroSection(),
              ),
              const SliverToBoxAdapter(
                child: WorkSection(),
              ),
              const SliverToBoxAdapter(
                child: SkillsSection(),
              ),
              const SliverToBoxAdapter(
                child: ExperienceSection(),
              ),
              const SliverToBoxAdapter(
                child: ContactSection(),
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
}
