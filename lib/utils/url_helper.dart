import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
