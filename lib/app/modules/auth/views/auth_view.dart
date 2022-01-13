import 'package:class_link/app/global/widget/app_title.dart';
// import 'package:class_link/app/modules/user_info/controllers/user_info_controller.dart';
// import 'package:class_link/app/modules/user_info/views/user_info_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Center(
            child: Hero(
          tag: "app_logo",
          child: Material(child: AppTitleWidget(fontSize: 60)),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(
            () => ElevatedButton(
              onPressed:
                  controller.loading.value ? null : () => controller.login(),
              child: const Text("Login"),
            ),
          ),
        ),
      );
}
