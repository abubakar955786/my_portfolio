import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/project.dart';
import '../utils/url_helper.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isMobile;

  const ProjectCard({super.key, required this.project, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(project.imageUrl), fit: BoxFit.cover),
              ),
              child: project.isPackage
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: const Text("PACKAGE", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  project.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(color: Colors.white60, fontSize: 13),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    if (project.link != null)
                      _buildAttractiveButton(
                        onPressed: () => UrlHelper.launch(project.link!),
                        icon: project.isPackage ? Icons.inventory_2 : Icons.link,
                        label: project.isPackage ? "Pub.dev" : "Preview",
                        color: Colors.blueAccent,
                      ),
                    if (project.playStoreUrl != null)
                      _buildAttractiveButton(
                        onPressed: () => UrlHelper.launch(project.playStoreUrl!),
                        icon: Icons.play_arrow,
                        label: "Play Store",
                        color: Colors.greenAccent,
                      ),
                    if (project.appStoreUrl != null)
                      _buildAttractiveButton(
                        onPressed: () => UrlHelper.launch(project.appStoreUrl!),
                        icon: Icons.apple,
                        label: "App Store",
                        color: Colors.white70,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttractiveButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
