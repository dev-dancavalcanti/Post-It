import 'package:url_launcher/url_launcher.dart';

class UrlController {
  Future<void> lauchHttps(String link, String paramets) async {
    Uri uri = Uri.https(link, paramets);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {}
  }

  Future<void> lauchEmail() async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: 'dev.dancavalcanti@gmail.com',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
      );
    } else {}
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
