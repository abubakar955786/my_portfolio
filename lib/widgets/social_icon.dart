import 'package:flutter/material.dart';
import '../utils/url_helper.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final String url;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UrlHelper.launch(url),
      borderRadius: BorderRadius.circular(12),
      child: Tooltip(
        message: tooltip,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
