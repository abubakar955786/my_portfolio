import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../models/experience.dart';
import 'section_header.dart';

class ExperienceSection extends StatelessWidget {
  final bool isMobile;

  const ExperienceSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "Experience", accentColor: Colors.purpleAccent),
          const SizedBox(height: 30),
          ...PortfolioData.experiences.map((exp) => _buildExperienceItem(exp, isMobile)),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Experience exp, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: isMobile ? _buildMobile(exp) : _buildDesktop(exp),
    );
  }

  Widget _buildDesktop(Experience exp) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.1), shape: BoxShape.circle),
          child: const Icon(Icons.business, color: Colors.blueAccent),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exp.company, style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              Text(exp.role, style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(exp.period, style: GoogleFonts.poppins(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
            Text(exp.location, style: GoogleFonts.poppins(color: Colors.white54)),
          ],
        ),
      ],
    );
  }

  Widget _buildMobile(Experience exp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.business, color: Colors.blueAccent),
            const SizedBox(width: 10),
            Expanded(child: Text(exp.company, style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
          ],
        ),
        const SizedBox(height: 5),
        Text(exp.role, style: GoogleFonts.poppins(color: Colors.white70, fontSize: 15)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(exp.period, style: GoogleFonts.poppins(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 13)),
            Text(exp.location, style: GoogleFonts.poppins(color: Colors.white54, fontSize: 13)),
          ],
        ),
      ],
    );
  }
}
