import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> launchUrl(BuildContext context, String url) async {
    try {
      await launch(url);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Unable to open"),
      ));
    }
  }
}
