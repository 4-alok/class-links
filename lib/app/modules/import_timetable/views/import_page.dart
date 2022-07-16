import 'package:class_link/app/modules/import_timetable/controllers/import_controller.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
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
                onPressed: () => controller.import,
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

  Widget importView(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Select day column",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Card(
              child: SizedBox(
                height: 48,
                width: double.maxFinite,
                child: Obx(
                  () => CustomDropdownButton2(
                    hint: 'Day',
                    buttonElevation: 5,
                    dropdownItems: controller.csvController.field.first
                        .map((e) => e.toString())
                        .toList(),
                    onChanged: (String? value) =>
                        controller.csvController.day.value = value,
                    value: controller.csvController.day.value,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Select batch column",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Card(
              child: SizedBox(
                height: 48,
                width: double.maxFinite,
                child: Obx(
                  () => CustomDropdownButton2(
                    hint: 'Batch',
                    buttonElevation: 5,
                    dropdownItems: controller.csvController.field.first
                        .map((e) => e.toString())
                        .toList(),
                    onChanged: (String? value) =>
                        controller.csvController.batch.value = value,
                    value: controller.csvController.batch.value,
                  ),
                ),
              ),
            ),
            Card(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Year",
                  hintText: "2020",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (val) => val != ''
                    ? controller.csvController.year.value =
                        int.tryParse(val) ?? 2020
                    : null,
              ),
            ),
            Card(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Slot",
                  hintText: "1",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (val) => val != ''
                    ? controller.csvController.slot.value =
                        int.tryParse(val) ?? 1
                    : null,
              ),
            ),
            Card(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Creator ID",
                  hintText: "2005847@kiit.ac.in",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onChanged: (val) => val != ''
                    ? controller.csvController.creatorId.value = val
                    : null,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Timing slot",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12),
              ),
            ),
            Card(
                child: Wrap(
              children: controller.csvController.subjectTimes
                  .map((e) => Card(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: Text(e),
                        ),
                      ))
                  .toList(),
            )),
          ],
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
                        () => controller.uploadElectiveTimeTable.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : ElevatedButton(
                                onPressed: controller.importUserSectionSection
                                        .uploading.value
                                    ? null
                                    : () => controller
                                        .import3YearElectiveTimetable(),
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
                      () => controller.importUserSectionSection.uploading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : ElevatedButton(
                              onPressed: controller
                                      .importUserSectionSection.uploading.value
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
