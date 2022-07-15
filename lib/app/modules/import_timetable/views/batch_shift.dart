// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/import_controller.dart';

class BatchShift extends StatelessWidget {
  final ImportController controller;
  const BatchShift({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Shift Batch",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: FutureBuilder<List<int>>(
                    future: controller.getTimetableYearly,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LinearProgressIndicator();
                      } else if (snapshot.hasData) {
                        final yearList = snapshot.data ?? [];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => CustomDropdownButton2(
                                      hint: 'Year',
                                      buttonElevation: 5,
                                      dropdownItems: yearList
                                          .map((e) => e.toString())
                                          .toList(),
                                      onChanged: (String? value) =>
                                          (value != '' && value != null)
                                              ? controller.fromYear.value =
                                                  int.parse(value)
                                              : null,
                                      value:
                                          controller.fromYear.value?.toString(),
                                      iconSize: 0,
                                    )),
                                Obx(
                                  () => CustomDropdownButton2(
                                    hint: 'Year',
                                    buttonElevation: 5,
                                    dropdownItems: yearList
                                        .map((e) => e.toString())
                                        .toList(),
                                    onChanged: (String? value) =>
                                        (value != '' && value != null)
                                            ? controller.toYear.value =
                                                int.parse(value)
                                            : null,
                                    value: controller.toYear.value?.toString(),
                                    iconSize: 0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Shift"))
                          ],
                        );
                      } else {
                        return const Text("Error");
                      }
                    }),
              ),
            ),
          ),
        ],
      );
}
