import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../global/widget/launcher.dart';
import '../../../services/firebase/models/report_models/report.dart';
import '../controller/report_controller.dart';

class MyReportsPage extends StatefulWidget {
  final ReportController controller;
  const MyReportsPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<MyReportsPage> createState() => _MyReportsPageState();
}

class _MyReportsPageState extends State<MyReportsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: FutureBuilder<List<Report>>(
          future:
              widget.controller.firestoreService.reportDatasources.getMyReports,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            } else if (snapshot.hasData) {
              final reports = snapshot.data ?? [];
              return reports.isEmpty
                  ? const Center(child: Text('No reports found'))
                  : reportList(reports);
            } else {
              return snapshot.error != null
                  ? Center(child: Text('Error: ${snapshot.error}'))
                  : const Center(child: Text('No data found'));
            }
          },
        ),
      );

  AppBar appBar() => AppBar(
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
            onPressed: () => Get.back()),
        centerTitle: true,
        title: const Text('My Reports'),
      );

  Widget reportList(List<Report> reports) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: reports.length,
          itemBuilder: (context, index) => Card(
            color: Color.alphaBlend(
                Theme.of(context).colorScheme.primary.withAlpha(80 * 4),
                Theme.of(context).cardColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 10,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Report Type"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.controller.getText(reports[index].reportType),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.withAlpha(200),
                          ),
                          onPressed: () async => await deleteReportDialog(
                              context, reports[index].docId!),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      reports[index].description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    reports[index].attatchmentUrl != null &&
                            reports[index].attatchmentUrl != ''
                        ? const SizedBox(height: 20)
                        : const SizedBox(),
                    reports[index].attatchmentUrl != null &&
                            reports[index].attatchmentUrl != ''
                        ? InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              try {
                                Launcher.launchUrl(
                                    context, reports[index].attatchmentUrl!);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Can't launch link")),
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                reports[index].attatchmentUrl ?? "",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    reports[index].reply != null && reports[index].reply != ''
                        ? const SizedBox(height: 20)
                        : const SizedBox(),
                    reports[index].reply != null && reports[index].reply != ''
                        ? Text("Reply \n${reports[index].reply ?? ""}",
                            style: Theme.of(context).textTheme.bodyMedium)
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Future<void> deleteReportDialog(BuildContext context, String docId) async =>
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          titlePadding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          actionsPadding: const EdgeInsets.only(bottom: 0, right: 10),
          title: const Text('Delete Report'),
          content: const Text('Are you sure you want to delete this report?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async => await widget
                  .controller.firestoreService.reportDatasources
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
