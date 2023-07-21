import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../global/widget/app_title.dart';
import '../controllers/user_batch_controller.dart';

class UserBatchView extends GetView<UserBatchController> {
  const UserBatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Hero(
            tag: "app_logo",
            flightShuttleBuilder: AppTitleWidget.flightShuttleBuilder,
            transitionOnUserGestures: true,
            child: Material(color: Colors.transparent, child: AppTitleWidget()),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            // Select Stream [IT, CSE, CSSE, CSCE]
            selectStreamTitle(context),
            selectStreamWidget(context),

            // Select Batch [CSE-1, CSE-2, CSE-3, CSE-4, ...]
            selectBatchTitle(context),
            batchList(context),

            // Select First Elective Subject
            selectElectiveSubject1(context, "First Elective Subject"),
            electiveSubject1List(context),

            // Select Second Elective Subject
            selectElectiveSubject1(context, "Second Elective Subject"),
            electiveSubject2List(context),
          ],
        ),
        floatingActionButton: fab(context),
      );

  Widget fab(BuildContext context) => Obx(
        () => !controller.showSubmitButton
            ? const SizedBox()
            : FloatingActionButton.extended(
                onPressed: () => showConfirmDialog(context),
                icon: controller.loading.value
                    ? const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const FaIcon(FontAwesomeIcons.check),
                label: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: controller.loading.value
                      ? const SizedBox()
                      : const Text("Submit"),
                ),
              ),
      );

  Future<void> showConfirmDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Once selected cannot be changed',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Card(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stream: ${controller.currentStream.value}',
                        ),
                        Text(
                          'Batch: ${controller.currentBatch.value}',
                        ),
                        controller.currentYear.value == 3
                            ? Text(
                                '1st Elective Subject: ${controller.currentElectiveSubject1.value}',
                              )
                            : const SizedBox(),
                        controller.currentYear.value == 3
                            ? Text(
                                '2nd Elective Subject: ${controller.currentElectiveSubject2.value}',
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.submit();
                },
                child: const Text('Confirm')),
          ],
        ),
      );

  Widget electiveSubject2List(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Obx(
        () => controller.currentStream.value == null ||
                controller.currentYear.value != 3
            ? const SizedBox()
            : FutureBuilder<Map<String, String>>(
                future: controller.getSectionListWithTeacherName,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
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
                                .map<DropdownMenuItem<String>>((String value) =>
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: ListTile(
                                          title: Text(value),
                                          subtitle:
                                              Text(snapshot.data?[value] ?? ""),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
      ),
    );
  }

  Widget electiveSubject1List(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => controller.currentStream.value == null ||
                  controller.currentYear.value != 3
              ? const SizedBox()
              : FutureBuilder<Map<String, String>>(
                  future: controller.getSectionListWithTeacherName,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
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
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
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
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
        ),
      );

  Widget batchList(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => controller.currentStream.value == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.currentBatch.value,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                      borderRadius: BorderRadius.circular(10),
                      underline: Container(height: 2),
                      onChanged: (String? newValue) =>
                          controller.currentBatch.value = newValue!,
                      items: controller.batchList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
        ),
      );

  Widget selectStreamTitle(BuildContext context) => Obx(() =>
      controller.currentYear.value == 2 || controller.currentYear.value == 3
          ? title(context, "Select Stream")
          : const SizedBox());

  Widget selectBatchTitle(BuildContext context) =>
      Obx(() => (controller.currentStream.value != null)
          ? title(context, "Select Batch")
          : const SizedBox());

  Widget selectElectiveSubject1(BuildContext context, String text) =>
      Obx(() => controller.currentYear.value == 3 &&
              controller.currentStream.value != null
          ? title(context, text)
          : const SizedBox());

  Widget selectStreamWidget(BuildContext context) => Obx(() =>
      controller.currentYear.value == 2 || controller.currentYear.value == 3
          ? AnimatedSize(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              child: Obx(
                () => GridView.count(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  childAspectRatio:
                      controller.currentStream.value == null ? 1 : 2,
                  children: controller.getStreamList
                      .map(
                        (e) => Card(
                          color: controller.currentStream.value == e
                              ? selectedCardColor
                              : cardColor,
                          child: InkWell(
                            onTap: () {
                              controller.currentStream.value = e;
                              controller.currentBatch.value = null;
                            },
                            child: Center(
                              child: Text(e,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color:
                                            controller.currentStream.value == e
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary
                                                : null,
                                      )),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          : const SizedBox());

  String intPostfix(int i) => i == 1
      ? " st"
      : i == 2
          ? " nd"
          : i == 3
              ? " rd"
              : " th";

  Widget title(BuildContext context, String title) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          title,
          style: Get.theme.textTheme.headlineMedium!.copyWith(
            color: Get.theme.textTheme.headlineMedium!.color!.withOpacity(0.5),
          ),
        ),
      );

  Color get cardColor => Color.alphaBlend(
      Get.theme.colorScheme.primary.withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
      Get.theme.cardColor);

  Color get selectedCardColor {
    return Get.isDarkMode
        ? Get.theme.primaryColor
        : Get.theme.primaryColor.withOpacity(.8);
  }
}
