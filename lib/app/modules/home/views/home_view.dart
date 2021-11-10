import 'package:class_link/app/modules/login/views/login_view.dart';
import 'package:class_link/app/modules/servers/views/servers_view.dart';
import 'package:class_link/app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return authService.isAuthenticated ? ServerPage() : LoginView();
  }
}
