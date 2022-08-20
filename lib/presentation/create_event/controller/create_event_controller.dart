import 'package:class_link/global/models/event/event.dart';
import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/hive/repository/hive_database.dart';
import 'date_time_controller.dart';

class CreateEventController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final creatorNameController = TextEditingController();
  final launchUrl = TextEditingController();
  final logoUrl = TextEditingController();
  final imageUrl = TextEditingController();
  final dateController = DateController();
  final timeController = TimeController();
  final loading = false.obs;

  HiveDatabase get hiveDatabase => Get.find<HiveDatabase>();

  @override
  void onReady() {
    creatorNameController.text =
        hiveDatabase.userBoxDatasources.userInfo?.userName ?? "";
    super.onReady();
  }

  bool get validate =>
      titleController.text.isNotEmpty &&
      descriptionController.text.isNotEmpty &&
      creatorNameController.text.isNotEmpty &&
      imageUrl.text.isNotEmpty &&
      dateController.getDateTime != null &&
      timeController.getDateTime != null;

  Future<void> get createEvent async {
    loading.value = true;
    final event = Event(
      title: titleController.text,
      description: descriptionController.text,
      creatorId: hiveDatabase.userBoxDatasources.userInfo?.id ?? "",
      creatorName: creatorNameController.text,
      imgUrl: imageUrl.text,
      dateTime: DateTime(
          dateController.getDateTime!.year,
          dateController.getDateTime!.month,
          dateController.getDateTime!.day,
          timeController.getDateTime!.hour,
          timeController.getDateTime!.minute),
      createdAt: DateTime.now(),
    );
    await Get.find<FirestoreService>().eventDatasources.addEvent(event);
    loading.value = false;
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    creatorNameController.dispose();
    dateController.dispose();
    timeController.dispose();
    launchUrl.dispose();
    logoUrl.dispose();
    imageUrl.dispose();
    super.onClose();
    loading.close();
  }
}
