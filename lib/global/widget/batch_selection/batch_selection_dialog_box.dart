import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/hive/models/user_info.dart';
import '../frost_card.dart';
import 'batch_selection_controller.dart';

class BatchSelectionDialogBox extends StatefulWidget {
  final UserInfo? initialUserInfo;
  const BatchSelectionDialogBox({this.initialUserInfo, super.key});

  @override
  State<BatchSelectionDialogBox> createState() =>
      _BatchSelectionDialogBoxState();
}

class _BatchSelectionDialogBoxState extends State<BatchSelectionDialogBox> {
  late final BatchSelectionDialogController controller;
  final Rx<bool> showChoseElectiveOption = false.obs;

  @override
  void initState() {
    controller =
        Get.put<BatchSelectionDialogController>(BatchSelectionDialogController(
      initialUserInfo: widget.initialUserInfo,
    ));
    showChoseElectiveOption.value =
        [6].contains(controller.currentSemester.value);
    super.initState();
  }

  Future<void> _onSave() async {
    final userInfo = await controller.save();
    if (userInfo != null) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, userInfo);
    }
  }

  @override
  void dispose() {
    Get.delete<BatchSelectionDialogController>();
    showChoseElectiveOption.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        content: SizedBox(
          width: double.maxFinite,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select Stream"),
                  selectStreamWidget(context),
                  batchList(context),
                  electiveSubject1List(context),
                  electiveSubject2List(context),
                  const SizedBox(height: 10),
                  errorText(context),
                  dialogFooter()
                ],
              ),
            ),
          ),
        ),
      );

  Widget dialogFooter() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: _onSave,
            child: Obx(
              () => controller.savingInProcess.value
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text("Save"),
            ),
          ),
        ],
      );

  Widget errorText(BuildContext context) => Obx(
        () => controller.errorText.value == null
            ? const SizedBox()
            : Text(
                controller.errorText.value ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.red),
              ),
      );

  Widget selectStreamWidget(BuildContext context) =>
      Obx(() => [4, 6].contains(controller.currentSemester.value)
          ? AnimatedSize(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              child: Obx(
                () => GridView.count(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio:
                      controller.currentStream.value == null ? 1 : 2,
                  children: controller.getStreamList
                      .map((e) => InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              controller.currentStream.value =
                                  controller.currentStream.value == e
                                      ? null
                                      : e;
                              controller.currentBatch.value = null;
                            },
                            child: FrostCard(
                              selected: controller.currentStream.value == e,
                              child: Center(
                                child: Text(e,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: 22,
                                          color:
                                              controller.currentStream.value ==
                                                      e
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary
                                                  : null,
                                        )),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )
          : const SizedBox());

  Widget batchList(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => controller.currentStream.value == null
              ? const SizedBox(width: double.maxFinite)
              : SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Select Batch"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: FrostCard(
                          padding: const EdgeInsets.all(0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: controller.currentBatch.value,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            menuMaxHeight:
                                MediaQuery.of(context).size.height * 0.5,
                            borderRadius: BorderRadius.circular(10),
                            underline: Container(height: 2),
                            onChanged: (String? newValue) =>
                                controller.currentBatch.value = newValue!,
                            items: controller.batchList
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              value,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                          ),
                                        ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );

  Widget electiveSubject1List(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => !(controller.currentStream.value != null &&
                  controller.currentBatch.value != null)
              ? const SizedBox(width: double.maxFinite)
              : FutureBuilder<Map<String, String>>(
                  future: controller.getSectionListWithTeacherName,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select Elective Subject 1"),
                          FrostCard(
                            child: Obx(
                              () => DropdownButton<String>(
                                isExpanded: true,
                                value: controller.currentElectiveSubject1.value,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                itemHeight: 80,
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * 0.5,
                                elevation: 16,
                                borderRadius: BorderRadius.circular(10),
                                underline: Container(height: 2),
                                onChanged: (String? newValue) => controller
                                    .currentElectiveSubject1.value = newValue!,
                                items: snapshot.data!.keys
                                    .toList()
                                    .map<DropdownMenuItem<String>>((String
                                            value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: ListTile(
                                            title: Text(value),
                                            subtitle: Text(
                                                snapshot.data?[value] ?? ""),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
        ),
      );

  Widget electiveSubject2List(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => !(controller.currentStream.value != null &&
                  controller.currentBatch.value != null)
              ? const SizedBox(width: double.maxFinite)
              : FutureBuilder<Map<String, String>>(
                  future: controller.getSectionListWithTeacherName,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select Elective Subject 2"),
                          FrostCard(
                            child: Obx(
                              () => DropdownButton<String>(
                                isExpanded: true,
                                value: controller.currentElectiveSubject2.value,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                itemHeight: 80,
                                menuMaxHeight:
                                    MediaQuery.of(context).size.height * 0.5,
                                elevation: 16,
                                borderRadius: BorderRadius.circular(10),
                                underline: Container(height: 2),
                                onChanged: (String? newValue) => controller
                                    .currentElectiveSubject2.value = newValue!,
                                items: snapshot.data!.keys
                                    .toList()
                                    .map<DropdownMenuItem<String>>((String
                                            value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Center(
                                            child: ListTile(
                                              title: Text(value),
                                              subtitle: Text(
                                                  snapshot.data?[value] ?? ""),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
        ),
      );
}
