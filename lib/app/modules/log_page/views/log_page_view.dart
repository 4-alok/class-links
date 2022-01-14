import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/log_page_controller.dart';

class LogPageView extends GetView<LogPageController> {
  const LogPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('LogPageView'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'LogPageView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
}
