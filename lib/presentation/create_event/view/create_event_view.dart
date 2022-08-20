import 'package:class_link/presentation/create_event/view/date_field.dart';
import 'package:class_link/presentation/create_event/view/time_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/create_event_controller.dart';

class CreateEventPage extends GetView<CreateEventController> {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            TextField(
              controller: controller.titleController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.descriptionController,
              minLines: 5,
              maxLines: 10,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.creatorNameController,
              decoration: const InputDecoration(labelText: "Creator name"),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: DateField(
                    controller: controller.dateController,
                    hintText: "Select Event Date",
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TimeField(
                    controller: controller.timeController,
                    hintText: "Select Event Time",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.imageUrl,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.logoUrl,
              decoration: const InputDecoration(labelText: "Logo URL"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.launchUrl,
              decoration: const InputDecoration(labelText: "Launch URL"),
            ),
            const SizedBox(height: 10),
            Obx(
              () => ElevatedButton(
                onPressed: controller.loading.value
                    ? null
                    : () => (controller.validate)
                        ? controller.createEvent
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Enter valid details")),
                          ),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Center(
                        child: controller.loading.value
                            ? const SizedBox(
                                height: 12,
                                width: 12,
                                child: CircularProgressIndicator())
                            : const Text("Create Event"))),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ));

  AppBar get appBar => AppBar(
        leading: Material(
            child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                onPressed: () => Get.back())),
        centerTitle: true,
        title: const Text("Add Event"),
      );
}
