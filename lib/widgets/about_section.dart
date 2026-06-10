import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import 'section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "About Me", accentColor: Colors.blueAccent),
          const SizedBox(height: 20),
          Text(
            PortfolioData.aboutMe,
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16, height: 1.8),
          ),
        ],
      ),
    );
  }
}
