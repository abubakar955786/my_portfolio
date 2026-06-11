import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/url_helper.dart';
import 'social_icon.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;

  const HeroSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: isMobile ? _buildMobile() : _buildDesktop(),
    );
  }

  Widget _buildDesktop() {
    return Row(
      children: [
        Expanded(flex: 3, child: _buildInfo(false)),
        Expanded(flex: 2, child: _buildProfileImage(false)),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _buildInfo(true),
        const SizedBox(height: 40),
        _buildProfileImage(true),
      ],
    );
  }

  Widget _buildInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(
          PortfolioData.name,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile ? 40 : 64,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          PortfolioData.title,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: isMobile ? 20 : 28,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            SocialIcon(
              icon: Icons.download,
              tooltip: "Resume",
              url: PortfolioData.resumeUrl,
              label: "Resume",
              color: Colors.blueAccent,
            ),
            SocialIcon(icon: Icons.code, tooltip: "GitHub", url: PortfolioData.githubUrl),
            SocialIcon(icon: Icons.work, tooltip: "LinkedIn", url: PortfolioData.linkedinUrl),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage(bool isMobile) {
    return Center(
      child: Container(
        height: isMobile ? 250 : 400,
        width: isMobile ? 250 : 400,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blueAccent.withOpacity(0.5), width: 10),
          image: const DecorationImage(
            image: AssetImage("assets/profile.jpg"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.3),
              blurRadius: 50,
              spreadRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
