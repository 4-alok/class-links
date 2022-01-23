import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  final scrollController = ScrollController(initialScrollOffset: 100);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
