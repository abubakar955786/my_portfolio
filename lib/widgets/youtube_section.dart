import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../utils/url_helper.dart';

class YouTubeSection extends StatelessWidget {
  final bool isMobile;

  const YouTubeSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 30 : 60.0),
      margin: EdgeInsets.all(isMobile ? 20 : 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red.shade900, Colors.red.shade600]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: isMobile ? _buildMobile() : _buildDesktop(),
    );
  }

  Widget _buildDesktop() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Check out my YouTube Channel!",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "I share Flutter tutorials, project breakdowns, and coding tips for the community.",
                style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9), fontSize: 18),
              ),
              const SizedBox(height: 30),
              _buildButton(),
            ],
          ),
        ),
        const Icon(Icons.video_library, color: Colors.white24, size: 150),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        const Icon(Icons.video_library, color: Colors.white, size: 80),
        const SizedBox(height: 20),
        Text(
          "Check out my YouTube Channel!",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton.icon(
      onPressed: () => UrlHelper.launch(PortfolioData.youtubeChannel),
      icon: const Icon(Icons.play_arrow),
      label: const Text("Subscribe Now"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
