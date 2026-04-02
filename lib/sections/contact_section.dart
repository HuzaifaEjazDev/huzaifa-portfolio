import 'package:flutter/material.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:huzaifa_dev/widgets/glass_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:huzaifa_dev/widgets/hover_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          children: [
            ResponsiveLayout(
              mobile: Column(
                children: [
                  _educationCard().animate().fadeIn().slideY(begin: 0.1),
                  const SizedBox(height: 24),
                  _socialsCard()
                      .animate()
                      .fadeIn(delay: 200.ms)
                      .slideY(begin: 0.1),
                ],
              ),
              tablet: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _educationCard().animate().fadeIn().slideX(
                      begin: -0.1,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: _socialsCard()
                        .animate()
                        .fadeIn(delay: 200.ms)
                        .slideX(begin: 0.1),
                  ),
                ],
              ),
              desktop: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _educationCard().animate().fadeIn().slideX(
                      begin: -0.1,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: _socialsCard()
                        .animate()
                        .fadeIn(delay: 200.ms)
                        .slideX(begin: 0.1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            _footer(context).animate().fadeIn(delay: 400.ms),
          ],
        ),
      ).animate().fadeIn(duration: 800.ms),
    );
  }

  Widget _educationCard() {
    return HoverContainer(
      child: GlassContainer(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            _eduItem(
              year: '2021 – 2025',
              degree: 'BS in Information Technology',
              school: 'Punjab University, Lahore',
            ),
            // const SizedBox(height: 24),
            // _eduItem(
            //   year: 'Completed',
            //   degree: 'Intermediate in Computer Science (ICS)',
            //   school: 'Government College Samanabad Faisalabad',
            // ),
          ],
        ),
      ),
    );
  }

  Widget _eduItem({
    required String year,
    required String degree,
    required String school,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(year, style: const TextStyle(fontSize: 12, color: Colors.white38)),
        const SizedBox(height: 4),
        Text(
          degree,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 2),
        Text(
          school,
          style: const TextStyle(fontSize: 14, color: Colors.white60),
        ),
      ],
    );
  }

  Widget _socialsCard() {
    return Column(
      children: [
        _socialButton(
          icon: FontAwesomeIcons.github,
          label: 'GitHub',
          url: 'https://github.com/huzai-fa',
        ),
        const SizedBox(height: 16),
        _socialButton(
          icon: FontAwesomeIcons.linkedin,
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/huzaifa-ejaz-kahlon',
        ),
        const SizedBox(height: 16),
        _socialButton(
          icon: FontAwesomeIcons.whatsapp,
          label: 'WhatsApp',
          url: 'https://wa.me/923250019905',
        ),
        const SizedBox(height: 16),
        _socialButton(
          icon: Icons.email,
          label: 'Email',
          url: 'mailto:huzaifaejazdev@gmail.com',
        ),
      ],
    );
  }

  Widget _socialButton({
    required dynamic icon,
    required String label,
    required String url,
  }) {
    return HoverContainer(
      translateY: true,
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) await launchUrl(uri);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon is FaIconData)
              FaIcon(icon, size: 16, color: Colors.white70)
            else
              Icon(icon as IconData, size: 16, color: Colors.white70),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    return Column(
      children: [
        const Divider(color: Colors.white10),
        const SizedBox(height: 40),
        if (isMobile)
          Column(
            children: [
              _footerText(),
              const SizedBox(height: 24),
              _footerLinks(),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_footerText(), _footerLinks()],
          ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _footerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HUZAIFA EJAZ KAHLON',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Flutter Developer • Android & Cross-Platform',
          style: TextStyle(fontSize: 12, color: Colors.white38),
        ),
      ],
    );
  }

  Widget _footerLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '© 2026',
          style: TextStyle(fontSize: 12, color: Colors.white38),
        ),
        const SizedBox(width: 24),
        _link('Portfolio'),
        const SizedBox(width: 16),
        _link('Contact'),
      ],
    );
  }

  Widget _link(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12, color: Colors.white60),
    );
  }
}
