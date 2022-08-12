import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/report_controller.dart';
import 'my_reports.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: body(context),
        floatingActionButton: fab(context),
      );

  Widget body(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => Wrap(
                children: controller.getReportTypeText
                    .map((e) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: controller.reportType.value == e
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withAlpha(80),
                        child: InkWell(
                          onTap: () => controller.reportType.value = e,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(e,
                                style: TextStyle(
                                    color: controller.reportType.value == e
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                        : null)),
                          ),
                        )))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.descriptionTextController,
              minLines: 5,
              maxLines: 5,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Description",
              ),
              validator: ((value) =>
                  value == null ? 'Please enter a description' : null),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.attatchmentUrlTextController,
              decoration: const InputDecoration(
                  filled: true, hintText: "Attatchment URL"),
            ),
          ],
        ),
      );

  AppBar get appBar => AppBar(
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
            onPressed: () => Get.back()),
        centerTitle: true,
        title: const Text('Report'),
        actions: [
          Tooltip(
            message: 'My Reports',
            child: TextButton(
                onPressed: () => Get.to(MyReportsPage(controller: controller)),
                child: const Text('My Reports')),
          )
        ],
      );

  FloatingActionButton fab(BuildContext context) =>
      FloatingActionButton.extended(
        onPressed: () => (controller.descriptionTextController.text.isEmpty)
            ? ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a description'),
                ),
              )
            : controller.submitReport.then((value) => Get.back()),
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSize(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            child: Obx(() => controller.submitting.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const FaIcon(FontAwesomeIcons.paperPlane)),
          ),
        ),
      );
}
