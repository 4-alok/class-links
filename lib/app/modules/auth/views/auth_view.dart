import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => controller.login(),
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () => controller.logout(),
            child: Text('logout'),
          ),
          ElevatedButton(
            onPressed: () => controller.user(),
            child: Text('user'),
          ),
        ],
      )),
    );
  }
}
