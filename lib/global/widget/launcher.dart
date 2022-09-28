import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as LA;

class Launcher {
  static Future<void> launchUrl(BuildContext context, String url) async {
    try {
      await LA.launchUrl(
        Uri.parse(url),
        mode: LA.LaunchMode.externalApplication,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Unable to open"),
      ));
    }
  }
}
