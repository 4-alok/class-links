import 'package:class_link/app/modules/import_timetable/controllers/import_controller.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImportPage extends GetView<ImportController> {
  const ImportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Import Timetable")),
        body: Obx(
          () => controller.field.isEmpty ? selectFile : importView(context),
        ),
        floatingActionButton: Obx(
          () => controller.field.isEmpty
              ? const SizedBox()
              : ElevatedButton(
                  onPressed: () => controller.getTimeTables,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Import"),
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
                    dropdownItems: controller.field.first
                        .map((e) => e.toString())
                        .toList(),
                    onChanged: (String? value) => controller.day.value = value,
                    value: controller.day.value,
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
                    dropdownItems: controller.field.first
                        .map((e) => e.toString())
                        .toList(),
                    onChanged: (String? value) =>
                        controller.batch.value = value,
                    value: controller.batch.value,
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
                    ? controller.year.value = int.tryParse(val) ?? 2020
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
                    ? controller.slot.value = int.tryParse(val) ?? 1
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
                onChanged: (val) =>
                    val != '' ? controller.creatorId.value = val : null,
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
              children: controller.subjectTimes
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

  Widget get selectFile => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Select a csv file to import"),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text("Select file"),
            onPressed: () => controller.selectFile,
          )
        ],
      ));
}
