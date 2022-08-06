import '../controllers/controller_panel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/repository/firestore_service.dart';
import '../../../../services/hive/utils/in_app_rating.dart';
import 'import_csv_page.dart';

class ControlPanel extends GetView<ControlPanelController> {
  const ControlPanel({Key? key}) : super(key: key);

  FirestoreService get firestoreServices => Get.find<FirestoreService>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Control Panel")),
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
                onPressed: () => controller.csvController.import,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: Obx(
                      () => controller.csvController.count.value == null
                          ? const Text(
                              "Import",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Import (${controller.csvController.count.value})",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
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
            testButtons(context),
            thirdYearAsViewer,
            delete2ndYear,
            get3rdYearBlankRoom,
          ],
        ),
      );

  Widget get get3rdYearBlankRoom => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Get 3rd Year Blank Room"),
        ),
      );

  Widget get delete2ndYear => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
          () => ElevatedButton(
            onPressed: firestoreServices.utilsDataSources.dCount.value != null
                ? null
                : () async {
                    await firestoreServices.utilsDataSources.delete2ndYear;
                    null;
                  },
            child: Text(
              firestoreServices.utilsDataSources.dCount.value == null
                  ? "Delete 2nd Year"
                  : "Deleting 2nd Year (${firestoreServices.utilsDataSources.dCount.value})",
            ),
          ),
        ),
      );

  Widget get thirdYearAsViewer => Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          onPressed: () =>
              firestoreServices.utilsDataSources.count.value == null
                  ? firestoreServices.utilsDataSources.all3rdYearAsViewer
                  : null,
          child: Text(
            firestoreServices.utilsDataSources.count.value == null
                ? "Convert 3rd year to Viewer"
                : firestoreServices.utilsDataSources.count.value.toString(),
          ),
        ),
      ));

  Widget testButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Text("Pint User Batch")),
          ElevatedButton(
            onPressed: () =>
                firestoreServices.electiveDatasources.getUserElectiveSubjects,
            child: const Text("Test"),
          ),
          ElevatedButton(
            onPressed: () => InAppRating().requestReview,
            child: const Text("Test review"),
          ),
        ],
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
                          () => controller.import3YearElectiveTimetable.count
                                      .value !=
                                  null
                              ? Text(
                                  "${controller.import3YearElectiveTimetable.count.value}")
                              : ElevatedButton(
                                  onPressed: controller
                                              .import3YearElectiveTimetable
                                              .count
                                              .value !=
                                          null
                                      ? null
                                      : () => controller
                                          .import3YearElectiveTimetable,
                                  child: const Text("Select file"),
                                ),
                        ))
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
                                  : () => controller.importUserSectionSection
                                      .uploadOnFirestore,
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
