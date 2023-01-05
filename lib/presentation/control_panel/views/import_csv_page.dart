import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth/utils/patch.dart';
import '../../../services/firebase/repository/firestore_service.dart';
import '../../../services/hive/utils/in_app_rating.dart';
import '../controllers/controller_panel_controller.dart';
import 'change_user_batch_widget.dart';

class ControlPanel extends GetView<ControlPanelController> with UserPatchMixin {
  const ControlPanel({Key? key}) : super(key: key);

  FirestoreService get firestoreServices => Get.find<FirestoreService>();

  Widget _panelItem(BuildContext context, String title, Widget child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            child: SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: child,
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Control Panel'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              reportTile(context),
              const ChangeUserBatch(),
              emailPatchTool(context),
              const SizedBox(height: 20),
              testButtons(context),
              thirdYearAsViewer,
              delete2ndYear,
              get3rdYearBlankRoom,
            ],
          ),
        ),
      );

  Widget reportTile(BuildContext context) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
          title: const Text('Reports'),
          trailing: IconButton(
            onPressed: () => controller.submitTestReport,
            icon: const Icon(Icons.abc),
          ),
          onTap: () => Get.toNamed(Routes.ADMIN_REPORT_PAGE),
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
            onPressed: () {},
            child: const Text("Pint User Batch"),
          ),
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

  Widget emailPatchTool(BuildContext context) => _panelItem(
      context,
      "Email Patch Tool",
      Wrap(
        children: [
          ElevatedButton(
            onPressed: () => print(emailFixed),
            child: const Text("Box value"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => setEmailFixed(false),
            child: const Text("set false"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () =>
                print(hiveDatabase.userBoxDatasources.userInfo?.id),
            child: const Text("print id"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () async => print(
                (await firestoreServices.userInfoDatasources.getUserInfo)?.id),
            child: const Text("fb id"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => addDublicate,
            child: const Text("Add dublicate"),
          ),
        ],
      ));
}
