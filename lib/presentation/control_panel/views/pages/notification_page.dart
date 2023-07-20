import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/notification_control_controller.dart';

class NotificationControlPage extends StatefulWidget {
  const NotificationControlPage({super.key});

  @override
  State<NotificationControlPage> createState() =>
      _NotificationControlPageState();
}

class _NotificationControlPageState extends State<NotificationControlPage> {
  final controller = NotificationControlController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Notification Control'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            onChanged: (value) => controller.title.value = value,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) => controller.body.value = value,
            decoration: const InputDecoration(
              labelText: 'Body',
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => CheckboxListTile(
              value: controller.reDialToWeb.value,
              title: const Text("Add URL"),
              onChanged: (value) => controller.reDialToWeb.value = value!,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              child: controller.reDialToWeb.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          onChanged: (value) =>
                              controller.reDialURL.value = value,
                          decoration: InputDecoration(
                            labelText: 'Enter URL',
                            suffix: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.paste),
                            ),
                            contentPadding:
                                const EdgeInsets.only(left: 10, top: 2),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Wrap(
                          spacing: 10,
                          children: [
                            Chip(label: Text('Open In App')),
                            Chip(label: Text('External App')),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(width: double.maxFinite),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => controller.createNotification,
            child: const Text('Send Notification'),
          ),
        ],
      ));
}
