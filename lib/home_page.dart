import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/portfolio_data.dart';
import 'utils/url_helper.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_list_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/youtube_section.dart';
import 'widgets/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _packagesKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          ),
        ),
        child: Column(
          children: [
            _buildNavbar(context, isMobile),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(isMobile: isMobile),
                    _buildStatsSection(context, isMobile),
                    AboutSection(key: _aboutKey),
                    SkillsSection(key: _skillsKey, isMobile: isMobile),
                    ProjectsListSection(key: _projectsKey, isMobile: isMobile),
                    ProjectsListSection(key: _packagesKey, isMobile: isMobile, showPackages: true),
                    ExperienceSection(key: _experienceKey, isMobile: isMobile),
                    YouTubeSection(isMobile: isMobile),
                    ContactSection(key: _contactKey, isMobile: isMobile),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0F2027),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black26),
            child: Center(
              child: Text(
                "AA",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildDrawerLink("About", _aboutKey),
          _buildDrawerLink("Skills", _skillsKey),
          _buildDrawerLink("Projects", _projectsKey),
          _buildDrawerLink("Packages", _packagesKey),
          _buildDrawerLink("Experience", _experienceKey),
          _buildDrawerLink("Contact", _contactKey),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.download, color: Colors.blueAccent),
            title: Text("Download Resume", style: GoogleFonts.poppins(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              UrlHelper.launch(PortfolioData.resumeUrl);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerLink(String text, GlobalKey key) {
    return ListTile(
      title: Text(text, style: GoogleFonts.poppins(color: Colors.white70)),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(key);
      },
    );
  }

  Widget _buildNavbar(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "AA",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            )
          else
            Row(
              children: [
                _buildNavLink("About", _aboutKey),
                _buildNavLink("Skills", _skillsKey),
                _buildNavLink("Projects", _projectsKey),
                _buildNavLink("Packages", _packagesKey),
                _buildNavLink("Experience", _experienceKey),
                const SizedBox(width: 20),
                OutlinedButton.icon(
                  onPressed: () => UrlHelper.launch(PortfolioData.resumeUrl),
                  icon: const Icon(Icons.download, size: 18),
                  label: const Text("Resume"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Hire Me"),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildNavLink(String text, GlobalKey key) {
    return InkWell(
      onTap: () => _scrollToSection(key),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Text(
          text,
          style: GoogleFonts.poppins(color: Colors.white70, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 20),
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white10),
      ),
      child: isMobile
          ? GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatItem("4+", "Years Exp"),
                _buildStatItem("20+", "Apps Live"),
                _buildStatItem("300+", "Tutorials"),
                _buildStatItem("10+", "Open Source"),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem("4+", "Years Exp"),
                _buildStatItem("20+", "Apps Live"),
                _buildStatItem("300+", "Tutorials"),
                _buildStatItem("10+", "Open Source"),
              ],
            ),
    );
  }

  Widget _buildStatItem(String val, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(val, style: GoogleFonts.poppins(color: Colors.blueAccent, fontSize: 32, fontWeight: FontWeight.bold)),
        Text(label, style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14)),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          Text(
            "© 2024 Abubakar Ansari. Built with Flutter",
            style: GoogleFonts.poppins(color: Colors.white38),
          ),
        ],
      ),
    );
  }
}
