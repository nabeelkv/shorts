import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AppExtensions {
  //Toast widget
  void showToast(BuildContext context, String message,
      SnackBarAction snackAction, Duration duration) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.hideCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content:
            Text(message, style: const TextStyle(fontFamily: 'Baloo Chettan')),
        duration: duration,
        dismissDirection: DismissDirection.none,
        action: snackAction,
      ),
    );
  }

  //Open link in default browser
  openExternalURL(url, context) async {
    url = Uri.parse(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // throw 'Could not launch $url';
      showToast(
          context,
          'ലിങ്ക് ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല.',
          SnackBarAction(label: '', onPressed: () {}),
          const Duration(seconds: 3));
    }
  }

  void copyLink(url, context) {
    Clipboard.setData(ClipboardData(text: url)).then((_) {
      showToast(
          context,
          'ലിങ്ക് കോപ്പി ചെയ്തു.',
          SnackBarAction(label: '', onPressed: () {}),
          const Duration(seconds: 3));
    });
  }
}
