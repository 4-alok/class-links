import 'package:class_link/app/services/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthService authService = Get.find<AuthService>();
  
  @override
  Widget build(BuildContext context) {
    authService.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      // body: controller.app.value == null? Center(child: CircularProgressIndicator()): Center(
      //   child: Text(
      //     'HomeView is working',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
    );
  }
}
