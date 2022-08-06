import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Message {
  Message(String title, String subtitle) {
    Get.snackbar(
      title,
      subtitle,
      snackPosition: SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 200),
      borderRadius: 0,
      margin: EdgeInsets.zero,
    );
  }
}
