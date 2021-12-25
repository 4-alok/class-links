import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
