import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/import_csv_controller.dart';

class ImportCsvPage extends StatelessWidget {
  final ImportCsvController csvController;
  const ImportCsvPage({Key? key, required this.csvController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 12),
            dayWidget,
            batchWidget,
            room1Widget,
            room2Widget,
            room3Widget,
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
                    ? csvController.year.value = int.tryParse(val) ?? 2020
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
                    ? csvController.slot.value = int.tryParse(val) ?? 1
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
                    val != '' ? csvController.creatorId.value = val : null,
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
              children: csvController.subjectTimes
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
            ElevatedButton(
              onPressed: () => csvController.printTimetable,
              child: const Text("Print"),
            )
          ],
        ),
      );

  Widget get room1Widget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Select Room-1 column",
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
                  hint: 'Room No',
                  buttonElevation: 5,
                  dropdownItems: csvController.field.first
                      .map((e) => e.toString())
                      .toList(),
                  onChanged: (String? value) => csvController.r1.value = value,
                  value: csvController.r1.value,
                ),
              ),
            ),
          ),
        ],
      );

  Widget get room2Widget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Select Room-2 column",
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
                  hint: 'Room No',
                  buttonElevation: 5,
                  dropdownItems: csvController.field.first
                      .map((e) => e.toString())
                      .toList(),
                  onChanged: (String? value) => csvController.r2.value = value,
                  value: csvController.r2.value,
                ),
              ),
            ),
          ),
        ],
      );

  Widget get room3Widget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Select Room-2 column",
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
                  hint: 'Room No',
                  buttonElevation: 5,
                  dropdownItems: csvController.field.first
                      .map((e) => e.toString())
                      .toList(),
                  onChanged: (String? value) => csvController.r3.value = value,
                  value: csvController.r3.value,
                ),
              ),
            ),
          ),
        ],
      );

  Widget get batchWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  dropdownItems: csvController.field.first
                      .map((e) => e.toString())
                      .toList(),
                  onChanged: (String? value) =>
                      csvController.batch.value = value,
                  value: csvController.batch.value,
                ),
              ),
            ),
          ),
        ],
      );

  Widget get dayWidget => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  dropdownItems: csvController.field.first
                      .map((e) => e.toString())
                      .toList(),
                  onChanged: (String? value) => csvController.day.value = value,
                  value: csvController.day.value,
                ),
              ),
            ),
          ),
        ],
      );
}
