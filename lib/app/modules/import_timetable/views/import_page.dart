import 'package:class_link/app/modules/import_timetable/controllers/import_controller.dart';
import 'package:class_link/app/services/firebase/repository/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'import_csv_page.dart';

class ImportPage extends GetView<ImportController> {
  const ImportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Import Timetable")),
        body: Obx(
          () => controller.csvController.field.isEmpty
              ? selectFile(context)
              : ImportCsvPage(csvController: controller.csvController),
        ),
        floatingActionButton: fab,
      );

  Widget get fab => Obx(
        () => controller.csvController.field.isEmpty
            ? const SizedBox()
            : ElevatedButton(
                onPressed: () => controller.print,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => controller.uploading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Import",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
      );

  Widget selectFile(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            importTimetable(context),
            import3yearUserSection(context),
            import3yearElectiveTimetable(context),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.find<FirestoreService>()
                    .electiveDatasources
                    .getUserElectiveSubjects;
              },
              child: const Text("Test"),
            ),
          ],
        ),
      );

  Widget import3yearElectiveTimetable(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Import 3year elective timetable",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select csv file",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 6),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Obx(
                        () => controller.count.value != null
                            ? Text("${controller.count.value}")
                            : ElevatedButton(
                                onPressed: controller.count.value != null
                                    ? null
                                    : () =>
                                        controller.import3YearElectiveTimetable,
                                child: const Text("Select file"),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget import3yearUserSection(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Import 3year user section",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select csv file",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => controller.importUserSectionSection.count.value !=
                              null
                          ? Text(
                              "${controller.importUserSectionSection.count.value}")
                          : ElevatedButton(
                              onPressed: controller.importUserSectionSection
                                          .count.value !=
                                      null
                                  ? null
                                  : () => controller
                                      .importUserSectionSection.importCsv,
                              child: const Text("Select file"),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget importTimetable(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Import Timetable",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select csv file",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      child: const Text("Select file"),
                      onPressed: () => controller.csvController.selectFile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
