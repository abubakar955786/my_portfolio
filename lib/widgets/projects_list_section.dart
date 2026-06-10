import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/project.dart';
import 'section_header.dart';
import 'project_card.dart';

class ProjectsListSection extends StatelessWidget {
  final bool isMobile;
  final bool showPackages;

  const ProjectsListSection({
    super.key,
    required this.isMobile,
    this.showPackages = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<Project> items = PortfolioData.projects
        .where((p) => p.isPackage == showPackages)
        .toList();

    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: showPackages ? "Flutter Packages" : "My Projects",
            accentColor: showPackages ? Colors.cyanAccent : Colors.greenAccent,
          ),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 450,
              mainAxisExtent: isMobile ? 420 : 400,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: items[index], isMobile: isMobile);
            },
          ),
        ],
      ),
    );
  }
}
