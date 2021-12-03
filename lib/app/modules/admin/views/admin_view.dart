import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
