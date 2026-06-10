import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import 'section_header.dart';

class SkillsSection extends StatelessWidget {
  final bool isMobile;

  const SkillsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "Technical Skills", accentColor: Colors.orangeAccent),
          const SizedBox(height: 30),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: PortfolioData.skills.map((skill) => _buildSkillBadge(skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBadge(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        skill,
        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}
