import 'package:class_link/services/firebase/repository/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/utils/utils.dart';
import '../../../../services/firebase/models/report_models/report.dart';

class AdminReportsPage extends StatefulWidget {
  const AdminReportsPage({Key? key}) : super(key: key);

  @override
  State<AdminReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<AdminReportsPage> {
  final replyController = TextEditingController();
  final submitting = ValueNotifier<bool>(false);

  FirestoreService get firestoreServices => Get.find<FirestoreService>();

  Future<void> replyReport(Report report) async {
    submitting.value = true;
    await firestoreServices.reportDatasources
        .replyReport(
            report.docId!, report.copyWith(reply: replyController.text))
        .then((value) => replyController.clear());
    submitting.value = false;
  }

  @override
  void dispose() {
    replyController.dispose();
    submitting.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Reports')),
        body: FutureBuilder<List<Report>>(
          future: Get.find<FirestoreService>().reportDatasources.getAllReports,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            } else if (snapshot.hasData) {
              final reports = snapshot.data ?? [];
              return reportList(reports);
            } else {
              return snapshot.error != null
                  ? Center(child: Text('Error: ${snapshot.error}'))
                  : const Center(child: Text('No data found'));
            }
          },
        ),
      );

  Widget reportList(List<Report> reports) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: reports.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              tileColor: Theme.of(context).primaryColor.withAlpha(80),
              title: Text(reports[index].reportType.toString()),
              subtitle: Text(reports[index].description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async =>
                    await deleteReportDialog(context, reports[index].docId!),
              ),
              onTap: () {
                replyController.text = reports[index].reply ?? '';
                replySheet(context, reports[index])
                    .closed
                    .then((value) => replyController.clear());
              },
            ),
          ),
        ),
      );

  PersistentBottomSheetController<dynamic> replySheet(
          BuildContext context, Report report) =>
      showBottomSheet(
        context: context,
        builder: (context) => Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(report.reportType.toString(),
                  style: Theme.of(context).textTheme.headline4),
              Text(report.description,
                  style: Theme.of(context).textTheme.bodyText1),
              Text("Date: ${Utils.formateDate(report.dateTime, false, true)}"),
              Text('Attatchment: ${report.attatchmentUrl}'),
              const SizedBox(height: 10),
              TextField(
                controller: replyController,
                decoration: const InputDecoration(
                  hintMaxLines: 3,
                  labelText: 'Reply',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  ValueListenableBuilder<bool>(
                    valueListenable: submitting,
                    builder: (context, value, child) => ElevatedButton(
                      onPressed: () async =>
                          await replyReport(report).then((value) => Get.back()),
                      child: value
                          ? const Center(
                              child: SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator()),
                            )
                          : const Text("Submit"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> deleteReportDialog(BuildContext context, String docId) async =>
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Report'),
          content: const Text('Are you sure you want to delete this report?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async => await firestoreServices.reportDatasources
                  .deleteReport(docId)
                  .then((value) {
                Get.back();
                setState(() {});
              }),
            ),
          ],
        ),
      );
}
