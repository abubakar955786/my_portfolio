import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/url_helper.dart';
import 'section_header.dart';

class ContactSection extends StatelessWidget {
  final bool isMobile;

  const ContactSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const SectionHeader(title: "Get In Touch", accentColor: Colors.blueAccent),
          const SizedBox(height: 40),
          isMobile ? _buildMobile() : _buildDesktop(),
        ],
      ),
    );
  }

  Widget _buildDesktop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContactCard(Icons.email, "Email Me", PortfolioData.email, () => UrlHelper.launch("mailto:${PortfolioData.email}"), false),
        const SizedBox(width: 30),
        _buildContactCard(Icons.phone, "Call Me", PortfolioData.phone, () => UrlHelper.launch("tel:${PortfolioData.phone}"), false),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _buildContactCard(Icons.email, "Email Me", PortfolioData.email, () => UrlHelper.launch("mailto:${PortfolioData.email}"), true),
        const SizedBox(height: 20),
        _buildContactCard(Icons.phone, "Call Me", PortfolioData.phone, () => UrlHelper.launch("tel:${PortfolioData.phone}"), true),
      ],
    );
  }

  Widget _buildContactCard(IconData icon, String title, String val, VoidCallback onTap, bool isMobile) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: isMobile ? double.infinity : 300,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 40),
            const SizedBox(height: 20),
            Text(title, style: GoogleFonts.poppins(color: Colors.white70)),
            Text(val, style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
