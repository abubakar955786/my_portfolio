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
        if (isMobile)
          ElevatedButton.icon(
            onPressed: () => UrlHelper.launch(PortfolioData.resumeUrl),
            icon: const Icon(Icons.download),
            label: const Text("Download Resume"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white12,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            SocialIcon(icon: Icons.code, tooltip: "GitHub", url: PortfolioData.githubUrl),
            const SizedBox(width: 15),
            SocialIcon(icon: Icons.work, tooltip: "LinkedIn", url: PortfolioData.linkedinUrl),
            if (!isMobile) ...[
              const SizedBox(width: 25),
              _buildResumeButton(),
            ],
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _buildStoreButton("Google Play", Icons.play_arrow),
            const SizedBox(width: 15),
            _buildStoreButton("App Store", Icons.apple),
          ],
        ),
      ],
    );
  }

  Widget _buildResumeButton() {
    return ElevatedButton.icon(
      onPressed: () => UrlHelper.launch(PortfolioData.resumeUrl),
      icon: const Icon(Icons.download),
      label: const Text("Download Resume"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
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
            image: NetworkImage("https://via.placeholder.com/400?text=Profile+Pic"),
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

  Widget _buildStoreButton(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
