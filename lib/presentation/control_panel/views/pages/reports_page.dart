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
              reports.sort((a, b) => b.dateTime.compareTo(a.dateTime));
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
                onPressed: () async => await firestoreServices.reportDatasources
                    .deleteReport(reports[index].docId!)
                    .then((value) => setState(() {})),
              ),
              onTap: () {
                replyController.text = reports[index].reply ?? '';
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(reports[index].reportType.toString()),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${reports[index].userId} - ${reports[index].id}"),
                        const SizedBox(height: 10),
                        Text(reports[index].description),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => Get.find<FirestoreService>()
                              .userInfoDatasources
                              .resetUser(reports[index].userId),
                          child: const Text("Reset User"),
                        ),
                        Text(
                            "Date: ${Utils.formateDate(reports[index].dateTime, false, true)}"),
                        const SizedBox(height: 10),
                        Text('Attatchment: ${reports[index].attatchmentUrl}'),
                        const SizedBox(height: 10),
                        TextField(
                          controller: replyController,
                          decoration: const InputDecoration(
                            hintMaxLines: 3,
                            labelText: 'Reply',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Cancel')),
                      ValueListenableBuilder<bool>(
                          valueListenable: submitting,
                          builder: (context, value, child) => ElevatedButton(
                                onPressed: () async =>
                                    await replyReport(reports[index])
                                        .then((value) => Get.back()),
                                child: value
                                    ? const Center(
                                        child: SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator()),
                                      )
                                    : const Text("Submit"),
                              ))
                    ],
                  ),
                );
              },
            ),
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
