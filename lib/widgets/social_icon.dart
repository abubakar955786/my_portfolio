import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/url_helper.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final String url;
  final String? label;
  final Color? color;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.url,
    this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UrlHelper.launch(url),
      borderRadius: BorderRadius.circular(12),
      child: Tooltip(
        message: tooltip,
        child: Container(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: label != null ? 20 : 0),
          width: label != null ? null : 56,
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              if (label != null) ...[
                const SizedBox(width: 10),
                Text(
                  label!,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
