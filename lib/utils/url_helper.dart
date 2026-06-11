import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'url_helper_stub.dart' if (dart.library.html) 'url_helper_web.dart' as platform;

class UrlHelper {
  static Future<void> launch(String url) async {
    if (kIsWeb && url.contains('assets/')) {
      platform.download(url);
      return;
    }
    
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
