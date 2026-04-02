import 'package:flutter/material.dart';
import 'package:huzaifa_dev/core/responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Logo
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF02569B).withValues(alpha: 0.3),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF02569B).withValues(alpha: 0.3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: const Color(0xFF02569B).withValues(alpha: 0.3),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF02569B), Color(0xFF22D3EE)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: FlutterLogo(size: 16),
                        ),
                      ),
                    ],
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

              // Nav Items (Desktop only)
              if (ResponsiveLayout.isDesktop(context) || ResponsiveLayout.isTablet(context))
                Row(
                  children: [
                    _navItem('Work'),
                    _navItem('Skills'),
                    _navItem('Experience'),
                    _navItem('Contact'),
                    const SizedBox(width: 8),
                    _hireMeButton(),
                  ],
                ),
                
              if (ResponsiveLayout.isMobile(context))
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 13,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _hireMeButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
    );
  }
}
